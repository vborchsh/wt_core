
/*
  localparam int pWIDTH = 12;

  logic                  idwt__iclk      ;
  logic                  idwt__iclk_ena  ;
  logic                  idwt__iclk_enax2;
  logic                  idwt__irst      ;
  logic                  idwt__iena      ;
  logic     [pWIDTH-1:0] idwt__idatH     ;
  logic     [pWIDTH-1:0] idwt__idatL     ;
  logic                  idwt__oena      ;
  logic   [2*pWIDTH-1:0] idwt__odat      ;

  assign iclk       = ;
  assign iclk_ena   = ;
  assign iclk_enax2 = ;
  assign irst       = ;
  assign iena       = ;
  assign idatH      = ;
  assign idatL      = ;

  idwt_core
  #(
    . pWIDTH         (pWIDTH)
  )
  idwt__
  (
    . iclk           (idwt__iclk           ) ,
    . iclk_ena       (idwt__iclk_ena       ) ,
    . iclk_enax2     (idwt__iclk_enax2     ) ,
    . irst           (idwt__irst           ) ,
    . iena           (idwt__iena           ) ,
    . idatH          (idwt__idatH          ) ,
    . idatL          (idwt__idatL          ) ,
    . oena           (idwt__oena           ) ,
    . odat           (idwt__odat           )
  );
*/

module idwt_core
  #(
    parameter int pWIDTH = "ext"
  )
  (
    input                            iclk      ,
    input                            iclk_ena  ,
    input                            iclk_enax2,
    input                            irst      ,
    input                            iena      ,
    input               [pWIDTH-1:0] idatH     ,
    input               [pWIDTH-1:0] idatL     ,
    output                           oena      ,
    output            [2*pWIDTH-1:0] odat
  );

  `include "./../include/header_wavelets.svh"

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
  // Declaration variables
  //--------------------------------------------------------------------------------------------------------

  logic                 ena;
  logic    [2*pWIDTH:0] sum;

  //--------------------------------------------------------------------------------------------------------
  // BODY
  //--------------------------------------------------------------------------------------------------------
  
  always_ff@(posedge iclk) begin
    if (hfir__oena | lfir__oena) begin
      sum <= $signed(hfir__odat) + $signed(lfir__odat);
    end
    //
    ena <= hfir__oena | lfir__oena;
  end

  //--------------------------------------------------------------------------------------------------------
  // Output signals
  //--------------------------------------------------------------------------------------------------------

  assign oena = ena;
  assign odat = sum;

  //--------------------------------------------------------------------------------------------------------
  // Modules
  //--------------------------------------------------------------------------------------------------------

  // High filter
  assign hfir__iclk      = iclk;
  assign hfir__iclk_ena  = iclk_enax2;
  assign hfir__irst      = irst;
  assign hfir__iena      = iena;
  assign hfir__idat      = (iclk_ena) ? (idatH) : ('0); // Interpolation
  // Low filter
  assign lfir__iclk      = iclk;
  assign lfir__iclk_ena  = iclk_enax2;
  assign lfir__irst      = irst;
  assign lfir__iena      = iena;
  assign lfir__idat      = (iclk_ena) ? (idatL) : ('0); // Interpolation

  wt_fir
  #(
    . pWIDTH     ($size(pDB6_Hi_R[0]) ) ,
    . pORDER     ($size(pDB6_Hi_R)    ) ,
    . cCOEFS     (pDB6_Hi_R           )
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
    . pWIDTH     ($size(pDB6_Lo_R[0]) ) ,
    . pORDER     ($size(pDB6_Lo_R)    ) ,
    . cCOEFS     (pDB6_Lo_R           )
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
