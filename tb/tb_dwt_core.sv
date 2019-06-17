
module tb_dwt_core;
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
  
  bit      [pWIDTH-1:0] rarrL        [$];
  bit      [pWIDTH-1:0] rarrH        [$];
  bit      [pWIDTH-1:0] farr         [$];
  int                   fdat         ;
  bit             [3:0] cnt_ena      ;
  bit                   clk_ena      ;
  bit                   clk_enax2    ;
  int                   pF           ;
  //
  logic                  dwt__iclk      ;
  logic                  dwt__iclk_ena  ;
  logic                  dwt__iclk_enax2;
  logic                  dwt__irst      ;
  logic     [pWIDTH-1:0] dwt__idat      ;
  logic                  dwt__iena      ;
  logic                  dwt__oena      ;
  logic   [2*pWIDTH-1:0] dwt__odatH     ;
  logic   [2*pWIDTH-1:0] dwt__odatL     ;

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
    pF = $fopen("./../doc/math/to_hardware/dwt_core_input.dat", "r");
    while (! $feof(pF)) begin
      $fscanf(pF, "%f\n", fdat);
      farr.push_back(fdat);
      //$display(fdat);
    end
    $fclose(pF);
  end

  // Main thread
  initial begin
    dwt__irst = 1; #0.1us dwt__irst = 0;
    //
    @(posedge clk_enax2);
    dwt__iena = 1'b1;
    foreach (farr[i]) begin
      dwt__idat = farr[i];
      @(posedge clk_enax2);
    end
    dwt__iena = 1'b0;
  end

  // File write thread
  initial begin
    pF = $fopen("dwt_resp.dat", "w");
    #0.1us;
  end
  always@(posedge clk_ena) begin
    if (dwt__oena)
      $fwrite(pF, "%f %f\n", $signed(dwt__odatH), $signed(dwt__odatL));
  end

  //--------------------------------------------------------------------------------------------------
  // Modules
  //--------------------------------------------------------------------------------------------------

  dwt_core
  #(
    . pWIDTH       (pWIDTH             )
  )
  dwt__
  ( 
    . iclk         (clk                ) ,
    . iclk_ena     (clk_ena            ) ,
    . iclk_enax2   (clk_enax2          ) ,
    . irst         (dwt__irst          ) ,
    . idat         (dwt__idat          ) ,
    . iena         (dwt__iena          ) ,
    . oena         (dwt__oena          ) ,
    . odatH        (dwt__odatH         ) ,
    . odatL        (dwt__odatL         )
  );
endmodule
