
  module wvlt_ibuf
  ( 
    iclk ,     // 128 MHz
    iclk_ena , // 2 MHz
    iena ,
    idat ,
    ireq ,

    oena ,
    oclk_ena ,
    odat
  );

  localparam  pW_DAT     = pIDWT_IN ;
  localparam  pWORDS_DAT = 128 ;
  localparam  pADR_DAT   = $clog2(pWORDS_DAT) ;

  input                     iclk ;
  input                     iclk_ena ;
  input                     iena ;
  input  [ pW_DAT-1:0 ]     idat ;
  input                     ireq ;

  output                    oena ;
  output                    oclk_ena ;
  output  t_wvlt_core_in    odat ;

  wire                      ram__wr_ena   ;
  wire  [ pADR_DAT-1 : 0 ]  ram__wr_adr   ;
  wire                      ram__iclk     ;
  wire  [ pW_DAT-1   : 0 ]  ram__data     ;
  wire                      ram__rd_ena   ;
  wire  [ pADR_DAT-1 : 0 ]  ram__rd_adr   ;
  wire  [ pW_DAT-1   : 0 ]  ram__q        ;

  //----------------------------------------------------
  // BODY
  //----------------------------------------------------

  reg    clk_ena_ ;
  reg    ena ;

  always@(posedge iclk) begin
    clk_ena_ <= iclk_ena ;
    ena      <= iena ;
  end

  reg   [ pADR_DAT-1 : 0 ]  wr_adr ;
  reg   [ pADR_DAT-1 : 0 ]  rd_adr ;

  always@(posedge iclk) begin
    if (iena)  wr_adr <= wr_adr + 1'b1 ;
    else       wr_adr <= '0 ;
  end

  always@(posedge iclk) begin
    if (iclk_ena || clk_ena_) begin
      if (ireq)  rd_adr <= rd_adr + 1'b1 ;
      else       rd_adr <= '0 ;
    end
  end

  reg  [ 3 : 0 ]         out_ena ;
  reg  [ 3 : 0 ]         out_clk ;
  reg  [ pW_DAT-1 : 0 ]  ram__delay ;

  // Output signals delays
  always@(posedge iclk) begin
    if (iclk_ena)   out_ena <= { out_ena[2:0], ireq } ;

    out_clk <= { out_clk[2:0], iclk_ena } ;

    ram__delay <= ram__q ;
  end

  assign oena     = out_ena  [ 0 ] ;
  assign oclk_ena = out_clk  [ 2 ] ;
  assign odat.l   = ram__delay ;
  assign odat.h   = ram__q ;

  //----------------------------------------------------
  // RAM
  //----------------------------------------------------

  assign  ram__wr_ena    = iena ;
  assign  ram__wr_adr    = wr_adr ;
  assign  ram__iclk      = iclk ;
  assign  ram__data      = idat ;
  assign  ram__rd_ena    = ireq ;
  assign  ram__rd_adr    = rd_adr ;

  altsyncram
  #(
    . address_reg_b             ("CLOCK0"        ) ,
    . clock_enable_input_a      ("BYPASS"        ) ,
    . clock_enable_input_b      ("BYPASS"        ) ,
    . clock_enable_output_b     ("BYPASS"        ) ,
    . intended_device_family    ("Cyclone III"   ) ,
    . lpm_type                  ("altsyncram"    ) ,
    . numwords_a                (pWORDS_DAT      ) ,
    . numwords_b                (pWORDS_DAT      ) ,
    . operation_mode            ("DUAL_PORT"     ) ,
    . outdata_reg_b             ("CLOCK0"        ) ,
    . rdcontrol_reg_b           ("CLOCK0"        ) ,
    . widthad_a                 (pADR_DAT        ) ,
    . widthad_b                 (pADR_DAT        ) ,
    . width_a                   (pW_DAT          ) ,
    . width_b                   (pW_DAT          ) ,
    . width_byteena_a           (1               )
  )
  ram_dat__
  (
    . address_a                (ram__wr_adr      ) ,
    . clock0                   (ram__iclk        ) ,
    . data_a                   (ram__data        ) ,
    . rden_b                   (ram__rd_ena      ) ,
    . wren_a                   (ram__wr_ena      ) ,
    . address_b                (ram__rd_adr      ) ,
    . q_b                      (ram__q           )
  ) ;

endmodule