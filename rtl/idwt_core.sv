
module idwt_core
  #(
    parameter int pWIDTH          = "ext"
  )
  (
    input                            iclk     ,
    input                            iclk_ena ,
    input                            irst     ,
    input                            iena     ,
    input               [pWIDTH-1:0] idatHI   ,
    input               [pWIDTH-1:0] idatHQ   ,
    input               [pWIDTH-1:0] idatLI   ,
    input               [pWIDTH-1:0] idatLQ   ,
    output                           oena     ,
    output            [2*pWIDTH-1:0] odatI    ,
    output            [2*pWIDTH-1:0] odatQ
  );

  //--------------------------------------------------------------------------------------------------------
  // Declaration parameters
  //--------------------------------------------------------------------------------------------------------

  localparam int pORDER        = 12;
  localparam int cL_D [pORDER] = '{-3,9,1,-65,56,199,-266,-464,645,1538,1012,228};
  localparam int cH_D [pORDER] = '{-229,1012,-1539,645,463,-266,-200,56,64,1,-10,-3};

  //--------------------------------------------------------------------------------------------------------
  // Declaration modules wires
  //--------------------------------------------------------------------------------------------------------

  wire                    hfir__iclk    ;
  wire                    hfir__iclk_ena;
  wire                    hfir__irst    ;
  wire                    hfir__iena    ;
  wire       [pWIDTH-1:0] hfir__idatI   ;
  wire       [pWIDTH-1:0] hfir__idatQ   ;
  wire                    hfir__oena    ;
  wire     [2*pWIDTH-1:0] hfir__odatI   ;
  wire     [2*pWIDTH-1:0] hfir__odatQ   ;

  wire                    lfir__iclk    ;
  wire                    lfir__iclk_ena;
  wire                    lfir__irst    ;
  wire                    lfir__iena    ;
  wire       [pWIDTH-1:0] lfir__idatI   ;
  wire       [pWIDTH-1:0] lfir__idatQ   ;
  wire                    lfir__oena    ;
  wire     [2*pWIDTH-1:0] lfir__odatI   ;
  wire     [2*pWIDTH-1:0] lfir__odatQ   ;

  //--------------------------------------------------------------------------------------------------------
  // Declaration variables
  //--------------------------------------------------------------------------------------------------------

  logic                   ena;
  logic    [2*pWIDTH-1:0] sumI;
  logic    [2*pWIDTH-1:0] sumQ;

  //--------------------------------------------------------------------------------------------------------
  // BODY
  //--------------------------------------------------------------------------------------------------------
  
  always_ff@(posedge iclk) begin
    if (hfir__oena) begin
      sumI <= hfir__odatI + lfir__odatI;
      sumQ <= hfir__odatI + lfir__odatQ;
    end
    //
    ena <= hfir__oena;
  end

  //--------------------------------------------------------------------------------------------------------
  // Output signals
  //--------------------------------------------------------------------------------------------------------

  assign oena  = ena;
  assign odatI = sumI;
  assign odatQ = sumQ;

  //--------------------------------------------------------------------------------------------------------
  // Modules
  //--------------------------------------------------------------------------------------------------------

  // High filter
  assign hfir__iclk      = iclk    ;
  assign hfir__iclk_ena  = iclk_ena;
  assign hfir__irst      = irst    ;
  assign hfir__iena      = iena    ;
  assign hfir__idatI     = idatHI  ;
  assign hfir__idatQ     = idatHQ  ;
  // Low filter
  assign lfir__iclk      = iclk    ;
  assign lfir__iclk_ena  = iclk_ena;
  assign lfir__irst      = irst    ;
  assign lfir__iena      = iena    ;
  assign lfir__idatI     = idatLI  ;
  assign lfir__idatQ     = idatLQ  ;

  wvlt_fir
  #(
    . pWIDTH     (pWIDTH         ) ,
    . pORDER     (pORDER         ) ,
    . cCOEFS     (cH_D           )
  )
  hfir__
  (
    . iclk       (hfir__iclk     ) ,
    . iclk_ena   (hfir__iclk_ena ) ,
    . irst       (hfir__irst     ) ,
    . iena       (hfir__iena     ) ,
    . idatI      (hfir__idatI    ) ,
    . idatQ      (hfir__idatQ    ) ,
    . oena       (hfir__oena     ) ,
    . odatI      (hfir__odatI    ) ,
    . odatQ      (hfir__odatQ    )
  );

  wvlt_fir
  #(
    . pWIDTH     (pWIDTH         ) ,
    . pORDER     (pORDER         ) ,
    . cCOEFS     (cL_D           )
  )
  lfir__
  (
    . iclk       (lfir__iclk     ) ,
    . iclk_ena   (lfir__iclk_ena ) ,
    . irst       (lfir__irst     ) ,
    . iena       (lfir__iena     ) ,
    . idatI      (lfir__idatI    ) ,
    . idatQ      (lfir__idatQ    ) ,
    . oena       (lfir__oena     ) ,
    . odatI      (lfir__odatI    ) ,
    . odatQ      (lfir__odatQ    )
  );

endmodule
