
/*
  localparam int pWIDTH = 12;

  logic                  dwt__iclk      ;
  logic                  dwt__iclk_ena  ;
  logic                  dwt__iclk_enax2;
  logic                  dwt__irst      ;
  logic     [pWIDTH-1:0] dwt__idat      ;
  logic                  dwt__iena      ;
  logic                  dwt__oena      ;
  logic   [2*pWIDTH-1:0] dwt__odatH     ;
  logic   [2*pWIDTH-1:0] dwt__odatL     ;

  assign dwt__iclk       = ;
  assign dwt__iclk_ena   = ;
  assign dwt__iclk_enax2 = ;
  assign dwt__irst       = ;
  assign dwt__idat       = ;
  assign dwt__iena       = ;

  dwt_core
  #(
    . pWIDTH       (pWIDTH             )
  )
  dwt__
  ( 
    . iclk         (dwt__iclk          ) ,
    . iclk_ena     (dwt__iclk_ena      ) ,
    . iclk_enax2   (dwt__iclk_enax2    ) ,
    . irst         (dwt__irst          ) ,
    . idat         (dwt__idat          ) ,
    . iena         (dwt__iena          ) ,
    . oena         (dwt__oena          ) ,
    . odatH        (dwt__odatH         ) ,
    . odatL        (dwt__odatL         )
  );
*/

module dwt_core
  #(
    parameter int pWIDTH = "ext"
  )
  ( 
    input                   iclk      ,
    input                   iclk_ena  ,
    input                   iclk_enax2,
    input                   irst      ,
    input      [pWIDTH-1:0] idat      ,
    input                   iena      ,

    output                  oena      ,
    output   [2*pWIDTH-1:0] odatH     ,
    output   [2*pWIDTH-1:0] odatL
  );

  `include "./../include/header_wavelets.svh"

  //--------------------------------------------------------------------------------------------------------
  // Declaration variables
  //--------------------------------------------------------------------------------------------------------

  logic                  ena;
  logic   [2*pWIDTH-1:0] datH;
  logic   [2*pWIDTH-1:0] datL;
  
  //--------------------------------------------------------------------------------------------------------
  // Declaration modules wires
  //--------------------------------------------------------------------------------------------------------

  wire                    hfir__iclk    ;
  wire                    hfir__iclk_ena;
  wire                    hfir__irst    ;
  wire                    hfir__iena    ;
  wire       [pWIDTH-1:0] hfir__idat    ;
  wire                    hfir__oena    ;
  wire     [2*pWIDTH-1:0] hfir__odat    ;

  wire                    lfir__iclk    ;
  wire                    lfir__iclk_ena;
  wire                    lfir__irst    ;
  wire                    lfir__iena    ;
  wire       [pWIDTH-1:0] lfir__idat    ;
  wire                    lfir__oena    ;
  wire     [2*pWIDTH-1:0] lfir__odat    ;

  //--------------------------------------------------------------------------------------------------------
  // BODY
  //--------------------------------------------------------------------------------------------------------

  // Decimation
  always_ff@(posedge iclk) begin
    if (iclk_ena) begin
      datH <= hfir__odat;
      datL <= lfir__odat;
      ena  <= hfir__oena | lfir__oena;
    end
  end

  //--------------------------------------------------------------------------------------------------------
  // Output signals
  //--------------------------------------------------------------------------------------------------------

  assign odatH = datH;
  assign odatL = datL;
  assign oena  = ena;

  //--------------------------------------------------------------------------------------------------------
  // Modules
  //--------------------------------------------------------------------------------------------------------
  
  // High filter
  assign hfir__iclk      = iclk;
  assign hfir__iclk_ena  = iclk_enax2;
  assign hfir__irst      = irst;
  assign hfir__iena      = iena;
  assign hfir__idat      = idat;
  // Low filter
  assign lfir__iclk      = iclk;
  assign lfir__iclk_ena  = iclk_enax2;
  assign lfir__irst      = irst;
  assign lfir__iena      = iena;
  assign lfir__idat      = idat;

  wt_fir
  #(
    . pWIDTH     ($size(pDB6_Hi_D[0]) ) ,
    . pORDER     ($size(pDB6_Hi_D)    ) ,
    . cCOEFS     (pDB6_Hi_D           )
  )
  hfir__
  (
    . iclk       (hfir__iclk          ) ,
    . iclk_ena   (hfir__iclk_ena      ) ,
    . irst       (hfir__irst          ) ,
    . iena       (hfir__iena          ) ,
    . idat       (hfir__idat          ) ,
    . oena       (hfir__oena          ) ,
    . odat       (hfir__odat          )
  );

  wt_fir
  #(
    . pWIDTH     ($size(pDB6_Lo_D[0]) ) ,
    . pORDER     ($size(pDB6_Lo_D)    ) ,
    . cCOEFS     (pDB6_Lo_D           )
  )
  lfir__
  (
    . iclk       (lfir__iclk          ) ,
    . iclk_ena   (lfir__iclk_ena      ) ,
    . irst       (lfir__irst          ) ,
    . iena       (lfir__iena          ) ,
    . idat       (lfir__idat          ) ,
    . oena       (lfir__oena          ) ,
    . odat       (lfir__odat          )
  );

endmodule
