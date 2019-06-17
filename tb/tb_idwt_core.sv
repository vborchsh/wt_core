
module tb_idwt_core;
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
 
  //--------------------------------------------------------------------------------------------------
  // Declaration variables
  //--------------------------------------------------------------------------------------------------
  
  bit      [pWIDTH-1:0] farrL        [$];
  bit      [pWIDTH-1:0] farrH        [$];
  int                   fdatL        ;
  int                   fdatH        ;
  bit             [3:0] cnt_ena      ;
  bit                   clk_ena      ;
  bit                   clk_enax2    ;
  int                   pF           ;
  //
  logic                 idwt__iclk      ;
  logic                 idwt__iclk_ena  ;
  logic                 idwt__iclk_enax2;
  logic                 idwt__irst      ;
  logic                 idwt__iena      ;
  logic    [pWIDTH-1:0] idwt__idatH     ;
  logic    [pWIDTH-1:0] idwt__idatL     ;
  logic                 idwt__oena      ;
  logic  [2*pWIDTH-1:0] idwt__odat      ;

  //--------------------------------------------------------------------------------------------------
  // Initialization
  //--------------------------------------------------------------------------------------------------

  initial begin
    
  end
  
  //--------------------------------------------------------------------------------------------------
  // BODY
  //--------------------------------------------------------------------------------------------------

  always@(posedge clk) begin
    cnt_ena   <= cnt_ena + 1'b1;
    clk_ena   <= &cnt_ena;
    clk_enax2 <= &cnt_ena[2:0];
  end

  // File read thread
  initial begin
    pF = $fopen("./../doc/math/to_hardware/wt_core_input.dat", "r");
    while (! $feof(pF)) begin
      $fscanf(pF, "%f %f\n", fdatL, fdatH);
      farrL.push_back(fdatL);
      farrH.push_back(fdatH);
      //$display(fdat);
    end
    $fclose(pF);
  end

  // Main thread
  initial begin
    idwt__irst = 1; #0.1us idwt__irst = 0;
    //
    @(posedge clk_ena);
    idwt__iena = 1'b1;
    foreach (farrL[i]) begin
      idwt__idatL = farrL[i];
      idwt__idatH = farrH[i];
      @(posedge clk_ena);
    end
    idwt__iena = 1'b0;
  end

  // File write thread
  initial begin
    pF = $fopen("idwt_resp.dat", "w");
    #0.1us;
  end
  always@(posedge clk_enax2) begin
    if (idwt__oena)
      $fwrite(pF, "%f\n", $signed(idwt__odat));
  end

  //--------------------------------------------------------------------------------------------------
  // Modules
  //--------------------------------------------------------------------------------------------------

  idwt_core
  #(
    . pWIDTH         (               pWIDTH)
  )
  idwt__
  (
    . iclk           (clk                  ) ,
    . iclk_ena       (clk_ena              ) ,
    . iclk_enax2     (clk_enax2            ) ,
    . irst           (idwt__irst           ) ,
    . iena           (idwt__iena           ) ,
    . idatH          (idwt__idatH          ) ,
    . idatL          (idwt__idatL          ) ,
    . oena           (idwt__oena           ) ,
    . odat           (idwt__odat           )
  );

endmodule
