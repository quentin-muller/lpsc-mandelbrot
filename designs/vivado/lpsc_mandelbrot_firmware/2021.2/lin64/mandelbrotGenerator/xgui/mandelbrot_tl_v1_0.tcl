# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "MAX_ITER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SIZE_VEC" -parent ${Page_0}


}

proc update_PARAM_VALUE.MAX_ITER { PARAM_VALUE.MAX_ITER } {
	# Procedure called to update MAX_ITER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_ITER { PARAM_VALUE.MAX_ITER } {
	# Procedure called to validate MAX_ITER
	return true
}

proc update_PARAM_VALUE.SIZE_VEC { PARAM_VALUE.SIZE_VEC } {
	# Procedure called to update SIZE_VEC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SIZE_VEC { PARAM_VALUE.SIZE_VEC } {
	# Procedure called to validate SIZE_VEC
	return true
}


proc update_MODELPARAM_VALUE.SIZE_VEC { MODELPARAM_VALUE.SIZE_VEC PARAM_VALUE.SIZE_VEC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SIZE_VEC}] ${MODELPARAM_VALUE.SIZE_VEC}
}

proc update_MODELPARAM_VALUE.MAX_ITER { MODELPARAM_VALUE.MAX_ITER PARAM_VALUE.MAX_ITER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_ITER}] ${MODELPARAM_VALUE.MAX_ITER}
}

