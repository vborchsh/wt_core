.main clear

quietly set INC_DIR "./../include"
quietly set RTL_DIR "./../rtl"
quietly set TB_DIR  "./../tb"

vlog +initreg+0 +initmem+0 -sv -mfcu \
${INC_DIR}/header_wt_core.svh        \
${TB_DIR}/*.sv

vsim +initreg+0 +initmem+0 -novopt -L 220model_ver tb_dwt_core
