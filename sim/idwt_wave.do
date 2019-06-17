onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_idwt_core/cnt_ena
add wave -noupdate /tb_idwt_core/clk_enax2
add wave -noupdate /tb_idwt_core/clk_ena
add wave -noupdate /tb_idwt_core/idwt__/iclk
add wave -noupdate /tb_idwt_core/idwt__/iclk_ena
add wave -noupdate /tb_idwt_core/idwt__/iclk_enax2
add wave -noupdate /tb_idwt_core/idwt__/irst
add wave -noupdate /tb_idwt_core/idwt__/iena
add wave -noupdate /tb_idwt_core/idwt__/idatH
add wave -noupdate /tb_idwt_core/idwt__/idatL
add wave -noupdate /tb_idwt_core/idwt__/oena
add wave -noupdate -radix decimal /tb_idwt_core/idwt__/odat
add wave -noupdate /tb_idwt_core/idwt__/hfir__iclk
add wave -noupdate /tb_idwt_core/idwt__/hfir__iclk_ena
add wave -noupdate /tb_idwt_core/idwt__/hfir__irst
add wave -noupdate /tb_idwt_core/idwt__/hfir__iena
add wave -noupdate /tb_idwt_core/idwt__/hfir__idat
add wave -noupdate /tb_idwt_core/idwt__/hfir__oena
add wave -noupdate -radix decimal /tb_idwt_core/idwt__/hfir__odat
add wave -noupdate /tb_idwt_core/idwt__/lfir__iclk
add wave -noupdate /tb_idwt_core/idwt__/lfir__iclk_ena
add wave -noupdate /tb_idwt_core/idwt__/lfir__irst
add wave -noupdate /tb_idwt_core/idwt__/lfir__iena
add wave -noupdate /tb_idwt_core/idwt__/lfir__idat
add wave -noupdate /tb_idwt_core/idwt__/lfir__oena
add wave -noupdate -radix decimal /tb_idwt_core/idwt__/lfir__odat
add wave -noupdate /tb_idwt_core/idwt__/ena
add wave -noupdate -radix decimal -childformat {{{/tb_idwt_core/idwt__/sum[32]} -radix decimal} {{/tb_idwt_core/idwt__/sum[31]} -radix decimal} {{/tb_idwt_core/idwt__/sum[30]} -radix decimal} {{/tb_idwt_core/idwt__/sum[29]} -radix decimal} {{/tb_idwt_core/idwt__/sum[28]} -radix decimal} {{/tb_idwt_core/idwt__/sum[27]} -radix decimal} {{/tb_idwt_core/idwt__/sum[26]} -radix decimal} {{/tb_idwt_core/idwt__/sum[25]} -radix decimal} {{/tb_idwt_core/idwt__/sum[24]} -radix decimal} {{/tb_idwt_core/idwt__/sum[23]} -radix decimal} {{/tb_idwt_core/idwt__/sum[22]} -radix decimal} {{/tb_idwt_core/idwt__/sum[21]} -radix decimal} {{/tb_idwt_core/idwt__/sum[20]} -radix decimal} {{/tb_idwt_core/idwt__/sum[19]} -radix decimal} {{/tb_idwt_core/idwt__/sum[18]} -radix decimal} {{/tb_idwt_core/idwt__/sum[17]} -radix decimal} {{/tb_idwt_core/idwt__/sum[16]} -radix decimal} {{/tb_idwt_core/idwt__/sum[15]} -radix decimal} {{/tb_idwt_core/idwt__/sum[14]} -radix decimal} {{/tb_idwt_core/idwt__/sum[13]} -radix decimal} {{/tb_idwt_core/idwt__/sum[12]} -radix decimal} {{/tb_idwt_core/idwt__/sum[11]} -radix decimal} {{/tb_idwt_core/idwt__/sum[10]} -radix decimal} {{/tb_idwt_core/idwt__/sum[9]} -radix decimal} {{/tb_idwt_core/idwt__/sum[8]} -radix decimal} {{/tb_idwt_core/idwt__/sum[7]} -radix decimal} {{/tb_idwt_core/idwt__/sum[6]} -radix decimal} {{/tb_idwt_core/idwt__/sum[5]} -radix decimal} {{/tb_idwt_core/idwt__/sum[4]} -radix decimal} {{/tb_idwt_core/idwt__/sum[3]} -radix decimal} {{/tb_idwt_core/idwt__/sum[2]} -radix decimal} {{/tb_idwt_core/idwt__/sum[1]} -radix decimal} {{/tb_idwt_core/idwt__/sum[0]} -radix decimal}} -subitemconfig {{/tb_idwt_core/idwt__/sum[32]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[31]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[30]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[29]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[28]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[27]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[26]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[25]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[24]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[23]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[22]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[21]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[20]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[19]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[18]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[17]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[16]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[15]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[14]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[13]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[12]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[11]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[10]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[9]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[8]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[7]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[6]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[5]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[4]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[3]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[2]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[1]} {-height 15 -radix decimal} {/tb_idwt_core/idwt__/sum[0]} {-height 15 -radix decimal}} /tb_idwt_core/idwt__/sum
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {426 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 245
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {2100 ns}
