
module tb_wt_fir;
  // ******************************************
  // CLOCK GENERATOR***************************
  timeunit 1ns;
  timeprecision 1ns;

  bit  clk;
  initial begin
    forever #1 clk = ~clk;
  end
  // ******************************************
  // ******************************************
  
  `include "./../include/header_wavelets.svh"

  //--------------------------------------------------------------------------------------------------
  // Declaration parameters
  //--------------------------------------------------------------------------------------------------

  localparam int pWIDTH = $size(pDB6_Lo_D[0]);
  localparam int pORDER = $size(pDB6_Lo_D);
 
  //--------------------------------------------------------------------------------------------------
  // Declaration variables
  //--------------------------------------------------------------------------------------------------
  
  logic    [pWIDTH-1:0] farr         [$];
  int                   fdat         ;
  logic           [3:0] cnt_ena      ;
  logic                 clk_ena      ;
  int                   pF           ;
  //
  logic                 fir__iclk    ;
  logic                 fir__iclk_ena;
  logic                 fir__irst    ;
  logic                 fir__iena    ;
  logic    [pWIDTH-1:0] fir__idat    ;
  logic                 fir__oena    ;
  logic  [2*pWIDTH-1:0] fir__odat    ;

  //--------------------------------------------------------------------------------------------------
  // Initialization
  //--------------------------------------------------------------------------------------------------

  initial begin
    
  end
  
  //--------------------------------------------------------------------------------------------------
  // BODY
  //--------------------------------------------------------------------------------------------------

  always@(posedge clk) begin
    cnt_ena <= cnt_ena + 1'b1;
    clk_ena <= &cnt_ena;
  end

  // File read thread
  initial begin
    pF = $fopen("./../doc/math/to_hardware/wt_fir_input.dat", "r");
    while (! $feof(pF)) begin
      $fscanf(pF, "%f\n", fdat);
      farr.push_back(fdat);
      //$display(fdat);
    end
    $fclose(pF);
  end

  // Main thread
  initial begin
    fir__irst = 1; #0.1us fir__irst = 0;
    //
    @(posedge clk_ena);
    fir__iena = 1'b1;
    foreach (farr[i]) begin
      fir__idat = farr[i];
      @(posedge clk_ena);
      fir__idat = '0;
      @(posedge clk_ena);
    end
    fir__iena = 1'b0;
  end

  // File write thread
  initial begin
    pF = $fopen("fir_resp.dat", "w");
    #0.1us;
  end
  always@(posedge clk_ena) begin
    if (fir__oena)
      $fwrite(pF, "%d\n", $signed(fir__odat));
  end

  //--------------------------------------------------------------------------------------------------
  // Modules
  //--------------------------------------------------------------------------------------------------

  wt_fir
  #(
    . pWIDTH     (                 16) ,
    . pORDER     (                 12) ,
    . cCOEFS     (          pDB6_Lo_D)
  )
  fir__
  (
    . iclk       (clk                ) ,
    . iclk_ena   (clk_ena            ) ,
    . irst       (fir__irst          ) ,
    . iena       (fir__iena          ) ,
    . idat       (fir__idat          ) ,
    . oena       (fir__oena          ) ,
    . odat       (fir__odat          )
  );

endmodule
