
  module wvlt_postbuf
  #(
    parameter pW_DAT     = "ext" ,
    parameter pWORDS_DAT = "ext"
  )
  ( 
    iclk ,    // 128 MHz
    iclk_wr , // 2 MHz (delayed after previous modules)
    iclk_rd , // 2 MHz
    iena ,
    inum_buf ,
    idat ,
    ireq ,

    oclk_ena ,
    oena ,
    odat
  );

  localparam  pADR_DAT   = $clog2(pWORDS_DAT) ;

  input                     iclk ;
  input                     iclk_wr ;
  input                     iclk_rd ;
  input                     iena ;
  input   [ 3 : 0 ]         inum_buf ;
  input   [ pW_DAT-1 : 0 ]  idat ;
  input                     ireq ;

  output                    oclk_ena ;
  output                    oena ;
  output  t_wvlt_core_in    odat ;

  wire                      ram__wr_ena   ;
  wire  [ pADR_DAT-1 : 0 ]  ram__wr_adr   ;
  wire                      ram__iclk     ;
  wire                      ram__iclk_wr  ;
  wire                      ram__iclk_rd  ;
  wire  [ pW_DAT-1   : 0 ]  ram__data     ;
  wire                      ram__rd_ena   ;
  wire  [ pADR_DAT-1 : 0 ]  ram__rd_adr   ;
  wire  [ pW_DAT-1   : 0 ]  ram__q        ;

  //----------------------------------------------------
  // BODY
  //----------------------------------------------------

  reg    clk_rd_ ;
  reg    clk_rd__ ;
  reg    clk_rd___ ;
  reg    ena ;
  wire   rd_ena ;

  always@(posedge iclk) begin
    clk_rd_  <= iclk_rd ;
    clk_rd__ <= clk_rd_ ;

    ena      <= iena ;
  end

  assign rd_ena = iclk_rd || clk_rd_ || clk_rd__ ;

  reg   [ pADR_DAT-1 : 0 ]  wr_adr ;
  reg   [ pADR_DAT-1 : 0 ]  rd_adr ;
  reg   [ pADR_DAT-1 : 0 ]  rd_adr_ ;

  always@(posedge iclk) begin
    if (iclk_wr) begin
      if (iena)  wr_adr <= wr_adr + 1'b1 ;
      else       wr_adr <= '0 ;
    end
  end

  // Read always 2 words
  logic    [ 3 : 0 ]    cnt_step ;
  logic    [ 3 : 0 ]    cnt_shft ;
  logic                 set_adr = 1'b0 ;

  always_comb begin
    case (inum_buf)
      4'd0 : cnt_step = 4'd1 ;
      4'd1 : cnt_step = 4'd2 ;
      4'd2 : cnt_step = 4'd3 ; // ???
    endcase

    case (inum_buf)
      4'd0 : cnt_shft = 4'd1 ;
      4'd1 : cnt_shft = 4'd2 ;
      4'd2 : cnt_shft = 4'd3 ; // ???
    endcase
  end

  always@(posedge iclk) begin
    if (iclk_rd || clk_rd_) begin
      if (ireq)  rd_adr <= rd_adr + cnt_step;
      else       rd_adr <= '0 ;
    end

    if (iclk_rd || clk_rd_) begin
      if (set_adr) begin
        if (ireq)  rd_adr_ <= rd_adr_ + cnt_step;
        else       rd_adr_ <= cnt_shft ;
      end
    end

    if (clk_rd_) begin
      if (ireq)  set_adr <= set_adr + 1'b1 ;
      else       set_adr <= '0 ;
    end
  end

  reg   [ pADR_DAT-1 : 0 ]  rd_adr_mux ;

  always_comb begin
    case (inum_buf)
      4'd0 :
            begin
              rd_adr_mux <= rd_adr ;
            end
      4'd1 :
            begin
              if (set_adr)  rd_adr_mux = rd_adr  ;
              else          rd_adr_mux = rd_adr_ ;
            end
      4'd2 :
            begin

            end

    endcase
  end

  reg  [ 2 : 0 ]         out_ena ;
  reg  [ 2 : 0 ]         out_clk ;
  reg  [ pW_DAT-1 : 0 ]  ram__delay = 0 ;

  always@(posedge iclk) begin
    out_ena <= { out_ena[$high(out_ena)-1:0], ireq } ;
    out_clk <= { out_clk[$high(out_clk)-1:0], iclk_rd } ;

    ram__delay <= ram__q ;
  end

  assign oena     = out_ena [ 1 ] ;
  assign oclk_ena = out_clk [ 2 ] ;
  assign odat.l   = (oclk_ena&&oena) ? (ram__delay) : ('0) ;
  assign odat.h   = (oclk_ena&&oena) ? (ram__q) : ('0) ;
  // assign odat.l   = ram__delay ;
  // assign odat.h   = ram__q ;

  //----------------------------------------------------
  // RAM
  //----------------------------------------------------

  assign  ram__wr_ena    = iena ;
  assign  ram__wr_adr    = wr_adr ;
  assign  ram__iclk      = iclk ;
  assign  ram__iclk_wr   = iclk_wr ;
  assign  ram__iclk_rd   = rd_ena ;
  assign  ram__data      = idat ;
  assign  ram__rd_ena    = ireq ;
  assign  ram__rd_adr    = rd_adr ;

  altsyncram
  #(
    . width_a          (pW_DAT              ) ,
    . widthad_a        (pADR_DAT            ) ,
    . numwords_a       (pWORDS_DAT          ) ,
    . width_b          (pW_DAT              ) ,
    . widthad_b        (pADR_DAT            ) ,
    . numwords_b       (pWORDS_DAT          ) ,
    . operation_mode   ("DUAL_PORT"         ) ,
    . address_reg_b    ("CLOCK1"            ) ,
    . outdata_reg_b    ("CLOCK1"            ) ,
    . rdcontrol_reg_b  ("CLOCK1"            )
  )
  ram_dat__
  (
    .  wren_a          (ram__wr_ena         ) ,
    .  address_a       (ram__wr_adr         ) ,
    .  clock0          (ram__iclk           ) ,
    .  clocken0        (ram__iclk_wr        ) ,
    .  data_a          (ram__data           ) ,
    .  rden_b          (ram__rd_ena         ) ,
    .  address_b       (ram__rd_adr         ) ,
    .  clock1          (ram__iclk           ) , 
    .  clocken1        (ram__iclk_rd        ) , 
    .  q_b             (ram__q              ) 
  ) ;

endmodule