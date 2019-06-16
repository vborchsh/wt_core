
module idwt_top
  ( 
    input              iclk     , // 128 MHz
    input              iclk_ena , //   4 MHz
    input              iclk_dat , // 31.25 kHz
    
    input              iena     ,
    
    input     t_dwt_in idat
  );
  
  //--------------------------------------------------------------------------------------------------------
  // Declaration parameters
  //--------------------------------------------------------------------------------------------------------

  

  //--------------------------------------------------------------------------------------------------------
  // Declaration variables
  //--------------------------------------------------------------------------------------------------------

  

  //--------------------------------------------------------------------------------------------------------
  // Declaration modules wires
  //--------------------------------------------------------------------------------------------------------
  
  wire            core__iclk      ;
  wire            core__iclk_ena  ;
  wire            core__irst      ;
  t_dwt_in        core__idat      ;
  wire            core__iena      ;
  wire     [36:0] core__odat      ;
  wire            core__oclk_ena  ;
  wire            core__oena      ;

  //--------------------------------------------------------------------------------------------------------
  // BODY
  //--------------------------------------------------------------------------------------------------------


  
  //--------------------------------------------------------------------------------------------------------
  // Modules
  //--------------------------------------------------------------------------------------------------------
  
  assign core__iclk     = iclk ;
  assign core__iclk_ena = iclk_ena ;
  assign core__irst     = !iena ;
  assign core__idat     = idat ;
  assign core__iena     = iena ;

  wvlt_core
  core__
  ( 
    .  iclk       (core__iclk     ) , // 128 MHz
    .  iclk_ena   (core__iclk_ena ) , // 2 MHz
    .  irst       (core__irst     ) ,
    .  idat       (core__idat     ) ,
    .  iena       (core__iena     ) ,
    .  odat       (core__odat     ) ,
    .  oclk_ena   (core__oclk_ena ) ,
    .  oena       (core__oena     )
  );

  //--------------------------------------------------------------------------------------------------------
  // Output signals
  //--------------------------------------------------------------------------------------------------------

  // Simple core out buffer for DBG!
  reg signed [36:0] res_array [ 0 : 11 ];
  always@(posedge iclk) begin
    if (core__oclk_ena) begin
      if (core__oena) begin
        for (int i = 0; i < 12; i++) begin
          if (i == 0)  res_array[ i ] <= core__odat ;
          else         res_array[ i ] <= res_array[ i - 1 ] ;
        end
      end
    end
  end

endmodule