onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_wt_fir/fir__/iclk
add wave -noupdate /tb_wt_fir/fir__/iclk_ena
add wave -noupdate /tb_wt_fir/fir__/irst
add wave -noupdate /tb_wt_fir/fir__/iena
add wave -noupdate -radix decimal /tb_wt_fir/fir__/idat
add wave -noupdate -radix decimal /tb_wt_fir/fir__/oena
add wave -noupdate -radix decimal -childformat {{{/tb_wt_fir/fir__/odat[31]} -radix decimal} {{/tb_wt_fir/fir__/odat[30]} -radix decimal} {{/tb_wt_fir/fir__/odat[29]} -radix decimal} {{/tb_wt_fir/fir__/odat[28]} -radix decimal} {{/tb_wt_fir/fir__/odat[27]} -radix decimal} {{/tb_wt_fir/fir__/odat[26]} -radix decimal} {{/tb_wt_fir/fir__/odat[25]} -radix decimal} {{/tb_wt_fir/fir__/odat[24]} -radix decimal} {{/tb_wt_fir/fir__/odat[23]} -radix decimal} {{/tb_wt_fir/fir__/odat[22]} -radix decimal} {{/tb_wt_fir/fir__/odat[21]} -radix decimal} {{/tb_wt_fir/fir__/odat[20]} -radix decimal} {{/tb_wt_fir/fir__/odat[19]} -radix decimal} {{/tb_wt_fir/fir__/odat[18]} -radix decimal} {{/tb_wt_fir/fir__/odat[17]} -radix decimal} {{/tb_wt_fir/fir__/odat[16]} -radix decimal} {{/tb_wt_fir/fir__/odat[15]} -radix decimal} {{/tb_wt_fir/fir__/odat[14]} -radix decimal} {{/tb_wt_fir/fir__/odat[13]} -radix decimal} {{/tb_wt_fir/fir__/odat[12]} -radix decimal} {{/tb_wt_fir/fir__/odat[11]} -radix decimal} {{/tb_wt_fir/fir__/odat[10]} -radix decimal} {{/tb_wt_fir/fir__/odat[9]} -radix decimal} {{/tb_wt_fir/fir__/odat[8]} -radix decimal} {{/tb_wt_fir/fir__/odat[7]} -radix decimal} {{/tb_wt_fir/fir__/odat[6]} -radix decimal} {{/tb_wt_fir/fir__/odat[5]} -radix decimal} {{/tb_wt_fir/fir__/odat[4]} -radix decimal} {{/tb_wt_fir/fir__/odat[3]} -radix decimal} {{/tb_wt_fir/fir__/odat[2]} -radix decimal} {{/tb_wt_fir/fir__/odat[1]} -radix decimal} {{/tb_wt_fir/fir__/odat[0]} -radix decimal}} -subitemconfig {{/tb_wt_fir/fir__/odat[31]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[30]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[29]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[28]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[27]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[26]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[25]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[24]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[23]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[22]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[21]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[20]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[19]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[18]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[17]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[16]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[15]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[14]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[13]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[12]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[11]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[10]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[9]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[8]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[7]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[6]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[5]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[4]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[3]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[2]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[1]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/odat[0]} {-height 15 -radix decimal}} /tb_wt_fir/fir__/odat
add wave -noupdate /tb_wt_fir/fir__/ena
add wave -noupdate -childformat {{{/tb_wt_fir/fir__/z[0]} -radix decimal} {{/tb_wt_fir/fir__/z[1]} -radix decimal} {{/tb_wt_fir/fir__/z[2]} -radix decimal}} -expand -subitemconfig {{/tb_wt_fir/fir__/z[0]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/z[1]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/z[2]} {-height 15 -radix decimal}} /tb_wt_fir/fir__/z
add wave -noupdate -childformat {{{/tb_wt_fir/fir__/mult[0]} -radix decimal -childformat {{{/tb_wt_fir/fir__/mult[0][31]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][30]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][29]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][28]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][27]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][26]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][25]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][24]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][23]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][22]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][21]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][20]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][19]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][18]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][17]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][16]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][15]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][14]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][13]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][12]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][11]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][10]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][9]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][8]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][7]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][6]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][5]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][4]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][3]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][2]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][1]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][0]} -radix decimal}}} {{/tb_wt_fir/fir__/mult[1]} -radix decimal -childformat {{{/tb_wt_fir/fir__/mult[1][31]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][30]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][29]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][28]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][27]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][26]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][25]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][24]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][23]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][22]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][21]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][20]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][19]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][18]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][17]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][16]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][15]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][14]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][13]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][12]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][11]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][10]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][9]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][8]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][7]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][6]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][5]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][4]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][3]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][2]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][1]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][0]} -radix decimal}}} {{/tb_wt_fir/fir__/mult[2]} -radix decimal} {{/tb_wt_fir/fir__/mult[3]} -radix decimal} {{/tb_wt_fir/fir__/mult[4]} -radix decimal} {{/tb_wt_fir/fir__/mult[5]} -radix decimal} {{/tb_wt_fir/fir__/mult[6]} -radix decimal} {{/tb_wt_fir/fir__/mult[7]} -radix decimal -childformat {{{/tb_wt_fir/fir__/mult[7][31]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][30]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][29]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][28]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][27]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][26]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][25]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][24]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][23]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][22]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][21]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][20]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][19]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][18]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][17]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][16]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][15]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][14]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][13]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][12]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][11]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][10]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][9]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][8]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][7]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][6]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][5]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][4]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][3]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][2]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][1]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][0]} -radix decimal}}} {{/tb_wt_fir/fir__/mult[8]} -radix decimal} {{/tb_wt_fir/fir__/mult[9]} -radix decimal} {{/tb_wt_fir/fir__/mult[10]} -radix decimal} {{/tb_wt_fir/fir__/mult[11]} -radix decimal}} -expand -subitemconfig {{/tb_wt_fir/fir__/mult[0]} {-height 15 -radix decimal -childformat {{{/tb_wt_fir/fir__/mult[0][31]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][30]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][29]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][28]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][27]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][26]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][25]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][24]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][23]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][22]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][21]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][20]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][19]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][18]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][17]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][16]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][15]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][14]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][13]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][12]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][11]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][10]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][9]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][8]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][7]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][6]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][5]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][4]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][3]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][2]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][1]} -radix decimal} {{/tb_wt_fir/fir__/mult[0][0]} -radix decimal}}} {/tb_wt_fir/fir__/mult[0][31]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][30]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][29]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][28]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][27]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][26]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][25]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][24]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][23]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][22]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][21]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][20]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][19]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][18]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][17]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][16]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][15]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][14]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][13]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][12]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][11]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][10]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][9]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][8]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][7]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][6]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][5]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][4]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][3]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][2]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][1]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[0][0]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1]} {-height 15 -radix decimal -childformat {{{/tb_wt_fir/fir__/mult[1][31]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][30]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][29]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][28]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][27]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][26]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][25]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][24]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][23]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][22]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][21]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][20]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][19]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][18]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][17]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][16]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][15]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][14]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][13]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][12]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][11]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][10]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][9]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][8]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][7]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][6]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][5]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][4]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][3]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][2]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][1]} -radix decimal} {{/tb_wt_fir/fir__/mult[1][0]} -radix decimal}}} {/tb_wt_fir/fir__/mult[1][31]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][30]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][29]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][28]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][27]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][26]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][25]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][24]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][23]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][22]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][21]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][20]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][19]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][18]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][17]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][16]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][15]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][14]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][13]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][12]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][11]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][10]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][9]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][8]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][7]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][6]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][5]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][4]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][3]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][2]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][1]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[1][0]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[2]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[3]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[4]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[5]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[6]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7]} {-height 15 -radix decimal -childformat {{{/tb_wt_fir/fir__/mult[7][31]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][30]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][29]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][28]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][27]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][26]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][25]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][24]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][23]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][22]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][21]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][20]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][19]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][18]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][17]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][16]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][15]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][14]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][13]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][12]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][11]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][10]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][9]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][8]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][7]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][6]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][5]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][4]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][3]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][2]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][1]} -radix decimal} {{/tb_wt_fir/fir__/mult[7][0]} -radix decimal}}} {/tb_wt_fir/fir__/mult[7][31]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][30]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][29]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][28]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][27]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][26]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][25]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][24]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][23]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][22]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][21]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][20]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][19]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][18]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][17]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][16]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][15]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][14]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][13]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][12]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][11]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][10]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][9]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][8]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][7]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][6]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][5]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][4]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][3]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][2]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][1]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[7][0]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[8]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[9]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[10]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/mult[11]} {-height 15 -radix decimal}} /tb_wt_fir/fir__/mult
add wave -noupdate -radix decimal -childformat {{{/tb_wt_fir/fir__/acc[31]} -radix decimal} {{/tb_wt_fir/fir__/acc[30]} -radix decimal} {{/tb_wt_fir/fir__/acc[29]} -radix decimal} {{/tb_wt_fir/fir__/acc[28]} -radix decimal} {{/tb_wt_fir/fir__/acc[27]} -radix decimal} {{/tb_wt_fir/fir__/acc[26]} -radix decimal} {{/tb_wt_fir/fir__/acc[25]} -radix decimal} {{/tb_wt_fir/fir__/acc[24]} -radix decimal} {{/tb_wt_fir/fir__/acc[23]} -radix decimal} {{/tb_wt_fir/fir__/acc[22]} -radix decimal} {{/tb_wt_fir/fir__/acc[21]} -radix decimal} {{/tb_wt_fir/fir__/acc[20]} -radix decimal} {{/tb_wt_fir/fir__/acc[19]} -radix decimal} {{/tb_wt_fir/fir__/acc[18]} -radix decimal} {{/tb_wt_fir/fir__/acc[17]} -radix decimal} {{/tb_wt_fir/fir__/acc[16]} -radix decimal} {{/tb_wt_fir/fir__/acc[15]} -radix decimal} {{/tb_wt_fir/fir__/acc[14]} -radix decimal} {{/tb_wt_fir/fir__/acc[13]} -radix decimal} {{/tb_wt_fir/fir__/acc[12]} -radix decimal} {{/tb_wt_fir/fir__/acc[11]} -radix decimal} {{/tb_wt_fir/fir__/acc[10]} -radix decimal} {{/tb_wt_fir/fir__/acc[9]} -radix decimal} {{/tb_wt_fir/fir__/acc[8]} -radix decimal} {{/tb_wt_fir/fir__/acc[7]} -radix decimal} {{/tb_wt_fir/fir__/acc[6]} -radix decimal} {{/tb_wt_fir/fir__/acc[5]} -radix decimal} {{/tb_wt_fir/fir__/acc[4]} -radix decimal} {{/tb_wt_fir/fir__/acc[3]} -radix decimal} {{/tb_wt_fir/fir__/acc[2]} -radix decimal} {{/tb_wt_fir/fir__/acc[1]} -radix decimal} {{/tb_wt_fir/fir__/acc[0]} -radix decimal}} -subitemconfig {{/tb_wt_fir/fir__/acc[31]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[30]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[29]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[28]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[27]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[26]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[25]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[24]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[23]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[22]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[21]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[20]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[19]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[18]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[17]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[16]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[15]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[14]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[13]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[12]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[11]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[10]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[9]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[8]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[7]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[6]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[5]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[4]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[3]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[2]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[1]} {-height 15 -radix decimal} {/tb_wt_fir/fir__/acc[0]} {-height 15 -radix decimal}} /tb_wt_fir/fir__/acc
add wave -noupdate /tb_wt_fir/fir__oena
add wave -noupdate /tb_wt_fir/clk_ena
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2305 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 154
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
WaveRestoreZoom {0 ns} {5250 ns}
