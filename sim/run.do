.main clear

quietly set INC_DIR "./../include"
quietly set RTL_DIR "./../rtl"
quietly set TB_DIR  "./../tb"

vlog +initreg+0 +initmem+0 -sv -mfcu \
${INC_DIR}/*.svh                     \
${TB_DIR}/*.sv                       \
${RTL_DIR}/wt_common/wt_fir.sv

restart -all -force
log -r /*
