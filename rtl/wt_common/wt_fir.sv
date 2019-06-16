  /*
  localparam int pWIDTH          = 12;
  localparam int pORDER          = 12;
  localparam int cCOEFS [pORDER] = '{-5,  19,  2,  -130,  112,  399,  -532,  -927,  1291,  3076,  2025,  456};

  wire                    fir__iclk    ;
  wire                    fir__iclk_ena;
  wire                    fir__irst    ;
  wire                    fir__iena    ;
  wire       [pWIDTH-1:0] fir__idat    ;
  wire                    fir__oena    ;
  wire     [2*pWIDTH-1:0] fir__odat    ;

  assign fir__iclk     = ;
  assign fir__iclk_ena = ;
  assign fir__irst     = ;
  assign fir__iena     = ;
  assign fir__idat     = ;

  wvlt_fir
  #(
    . pWIDTH     (pWIDTH        ) ,
    . pORDER     (pORDER        ) ,
    . cCOEFS     (cCOEFS        )
  )
  fir__
  (
    . iclk       (fir__iclk     ) ,
    . iclk_ena   (fir__iclk_ena ) ,
    . irst       (fir__irst     ) ,
    . iena       (fir__iena     ) ,
    . idatI      (fir__idat     ) ,
    . oena       (fir__oena     ) ,
    . odatI      (fir__odat     )
  );
*/

module wt_fir
  #(
    parameter int pWIDTH          = "ext",
    parameter int pORDER          = "ext",
    parameter int cCOEFS [pORDER] = "ext"
  )
  (
    input                            iclk     ,
    input                            iclk_ena ,
    input                            irst     ,
    input                            iena     ,
    input               [pWIDTH-1:0] idat     ,
    output                           oena     ,
    output            [2*pWIDTH-1:0] odat
  );

  //--------------------------------------------------------------------------------------------------------
  // Declaration variables
  //--------------------------------------------------------------------------------------------------------

  logic                     ena  ;
  logic      [2*pWIDTH-1:0] mult [pORDER];
  logic      [2*pWIDTH-1:0] acc  [pORDER];
  logic        [pWIDTH-1:0] z    [pORDER];

  //--------------------------------------------------------------------------------------------------------
  // BODY
  //--------------------------------------------------------------------------------------------------------

  // Delay line
  always_ff@(posedge iclk) begin
    if (irst) begin
      z <= '{pORDER{'0}};
    end else if (iclk_ena) begin
      z[0] <= idat;
      //
      for (int i = 1; i < pORDER; i++) begin
        z[i] <= z[i-1];
      end
    end
  end

  always_ff@(posedge iclk) begin
    for (int i = 0; i < pORDER; i++) begin
      // Multipliers
      if (irst)               mult[i] <= '0;
      else if (iclk_ena)      mult[i] <= '0;
          else                mult[i] <= $signed(z[i] * cCOEFS[i]);
      // Accumulation
      if (irst)               acc[i] <= '0;
      else if (iclk_ena)      acc[i] <= '0;
          else                acc[i] <= $signed(acc[i] + mult[i]);
    end
  end

  // Output interface
  always_ff@(posedge iclk) ena <= iena;

  //--------------------------------------------------------------------------------------------------------
  // Output signals
  //--------------------------------------------------------------------------------------------------------

  assign oena = ena;
  assign odat = acc[$high(acc)];

endmodule
