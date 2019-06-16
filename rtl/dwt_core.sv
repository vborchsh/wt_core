
module dwt_core
  ( 
    input                 iclk     , // 128 MHz
    input                 iclk_ena , // 4 MHz
    input                 irst     ,
    input          [17:0] idat_l   ,
    input          [17:0] idat_h   ,
    input                 iena     ,

    output  signed [36:0] odat     ,
    output                oclk_ena ,
    output                oena
  );

  //--------------------------------------------------------------------------------------------------------
  // Declaration parameters
  //--------------------------------------------------------------------------------------------------------
  
  // Decomposion filters responses
  // localparam int cL_D [ 0 : 11 ] = '{ -310,  1372,  159,  -9073,  7906,  28007,  -37277,  -64997,  90557,  215768,  142084,  32040 } ;
  // localparam int cH_D [ 0 : 11 ] = '{ -32041,  142084,  -215769,  90557,  64996,  -37277,  -28008,  7906,  9072,  159,  -1373,  -310 } ;
  localparam int cL_D [ 0 : 11 ] = '{ -71,  313,  36,  -2070,  1803,  6389,  -8505,  -14829,  20660,  49226,  32415,  7309   } ; 
  localparam int cH_D [ 0 : 11 ] = '{ -7310,  32415,  -49227,  20660,  14828,  -8505,  -6390,  1803,  2069,  36,  -314,  -71 } ; 
  
  //--------------------------------------------------------------------------------------------------------
  // Declaration variables
  //--------------------------------------------------------------------------------------------------------

  reg  signed [36:0] sum ;
  reg                ena ;
  reg                clk ;
  
  //--------------------------------------------------------------------------------------------------------
  // Declaration modules wires
  //--------------------------------------------------------------------------------------------------------

  wire             f_l__iclk     ;
  wire             f_l__iclk_ena ;
  wire             f_l__irst     ;
  wire             f_l__iena     ;
  wire      [17:0] f_l__idat     ;
  wire             f_l__oena     ;
  wire      [35:0] f_l__odat     ; // pIDWT_IN+pIDWT_C+4-1
  
  wire             f_h__iclk     ;
  wire             f_h__iclk_ena ;
  wire             f_h__irst     ;
  wire             f_h__iena     ;
  wire      [17:0] f_h__idat     ;
  wire             f_h__oena     ;
  wire      [35:0] f_h__odat     ; // pIDWT_IN+pIDWT_C+4-1

  //--------------------------------------------------------------------------------------------------------
  // BODY
  //--------------------------------------------------------------------------------------------------------

  // Sum results from LOW and HIGH filters
  // ENABLE signals from two filters are equal, here can be use any of them
  always@(posedge iclk) begin
    if (irst)            sum <= '0 ;
    else if (f_l__oena)  sum <= $signed(f_h__odat + f_l__odat) ;
  end

  always@(posedge iclk) begin
    if (iclk_ena)  ena <= iena ;

    ena <= f_l__oena ;
  end
  
  //--------------------------------------------------------------------------------------------------------
  // Modules
  //--------------------------------------------------------------------------------------------------------
  
  // LOW Filter
  assign  f_l__iclk     = iclk     ;
  assign  f_l__iclk_ena = iclk_ena ;
  assign  f_l__irst     = irst     ;
  assign  f_l__iena     = iena     ;
  assign  f_l__idat     = idat_l   ;
  
  wvlt_fir
  #(
    . cCOEFS     (cL_D           )
  )
  f_l__
  ( 
    . iclk       (f_l__iclk      ) , 
    . iclk_ena   (f_l__iclk_ena  ) , 
    . irst       (f_l__irst      ) , 
    . iena       (f_l__iena      ) , 
    . idat       (f_l__idat      ) , 
    . oena       (f_l__oena      ) ,
    . odat       (f_l__odat      )    
  );
  
  // HIGH Filter
  assign  f_h__iclk     = iclk     ;
  assign  f_h__iclk_ena = iclk_ena ;
  assign  f_h__irst     = irst     ;
  assign  f_h__iena     = iena     ;
  assign  f_h__idat     = idat_h   ;

  wvlt_fir
  #(
    . cCOEFS     (cL_D           )
  )
  f_h__
  ( 
    . iclk       (f_h__iclk      ) , 
    . iclk_ena   (f_h__iclk_ena  ) , 
    . irst       (f_h__irst      ) , 
    . iena       (f_h__iena      ) , 
    . idat       (f_h__idat      ) , 
    . oena       (f_h__oena      ) ,
    . odat       (f_h__odat      )    
  );

  //--------------------------------------------------------------------------------------------------------
  // Output signals
  //--------------------------------------------------------------------------------------------------------

  assign odat     = sum ;
  assign oclk_ena = 1'b0 ;
  assign oena     = ena ;

endmodule