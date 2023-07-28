
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/vid_dbg_module_v3_1.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Options}]
  set WHICH_INTERFACE [ipgui::add_param $IPINST -name "WHICH_INTERFACE" -parent ${Page_0}]
  set_property tooltip {Which type of interface to expose.} ${WHICH_INTERFACE}
  set INCLUDE_FRAME_SIZE_LOGGER [ipgui::add_param $IPINST -name "INCLUDE_FRAME_SIZE_LOGGER" -parent ${Page_0}]
  set_property tooltip {Include Frame Size Logger submodule.} ${INCLUDE_FRAME_SIZE_LOGGER}
  set INIT_HSIZE [ipgui::add_param $IPINST -name "INIT_HSIZE" -parent ${Page_0}]
  set_property tooltip {Initial number of pixels per line to check against. When 'Which Interface' is set to 'None,' the core will always check against this value.} ${INIT_HSIZE}
  set INIT_VSIZE [ipgui::add_param $IPINST -name "INIT_VSIZE" -parent ${Page_0}]
  set_property tooltip {Initial number of lines per frame to check against. When 'Which Interface' is set to 'None,' the core will always check against this value.} ${INIT_VSIZE}
  set MAX_HSIZE [ipgui::add_param $IPINST -name "MAX_HSIZE" -parent ${Page_0}]
  set_property tooltip {Maximum number of pixels per line to check against.} ${MAX_HSIZE}
  set MAX_VSIZE [ipgui::add_param $IPINST -name "MAX_VSIZE" -parent ${Page_0}]
  set_property tooltip {Maximum number of lines per frame to check against.} ${MAX_VSIZE}
  set TDATA_WIDTH [ipgui::add_param $IPINST -name "TDATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Width of the input 'tdata' port (bits per pixel).} ${TDATA_WIDTH}

  #Adding Page
  set Programmable_Flag_Settings [ipgui::add_page $IPINST -name "Programmable Flag Settings"]
  set PIXEL_TO_TRIGGER [ipgui::add_param $IPINST -name "PIXEL_TO_TRIGGER" -parent ${Programmable_Flag_Settings}]
  set_property tooltip {Which pixel the programmable flag should assert.} ${PIXEL_TO_TRIGGER}
  set LINE_TO_TRIGGER [ipgui::add_param $IPINST -name "LINE_TO_TRIGGER" -parent ${Programmable_Flag_Settings}]
  set_property tooltip {Which line the programmable flag should assert.} ${LINE_TO_TRIGGER}
  set FRAME_TO_TRIGGER [ipgui::add_param $IPINST -name "FRAME_TO_TRIGGER" -parent ${Programmable_Flag_Settings}]
  set_property tooltip {Which frame the programmable flag should assert.} ${FRAME_TO_TRIGGER}


}

proc update_PARAM_VALUE.INCLUDE_FRAME_SIZE_LOGGER { PARAM_VALUE.INCLUDE_FRAME_SIZE_LOGGER PARAM_VALUE.WHICH_INTERFACE } {
	# Procedure called to update INCLUDE_FRAME_SIZE_LOGGER when any of the dependent parameters in the arguments change
	
	set INCLUDE_FRAME_SIZE_LOGGER ${PARAM_VALUE.INCLUDE_FRAME_SIZE_LOGGER}
	set WHICH_INTERFACE ${PARAM_VALUE.WHICH_INTERFACE}
	set values(WHICH_INTERFACE) [get_property value $WHICH_INTERFACE]
	if { [gen_USERPARAMETER_INCLUDE_FRAME_SIZE_LOGGER_ENABLEMENT $values(WHICH_INTERFACE)] } {
		set_property enabled true $INCLUDE_FRAME_SIZE_LOGGER
	} else {
		set_property enabled false $INCLUDE_FRAME_SIZE_LOGGER
	}
}

proc validate_PARAM_VALUE.INCLUDE_FRAME_SIZE_LOGGER { PARAM_VALUE.INCLUDE_FRAME_SIZE_LOGGER } {
	# Procedure called to validate INCLUDE_FRAME_SIZE_LOGGER
	return true
}

proc update_PARAM_VALUE.MAX_HSIZE { PARAM_VALUE.MAX_HSIZE PARAM_VALUE.WHICH_INTERFACE } {
	# Procedure called to update MAX_HSIZE when any of the dependent parameters in the arguments change
	
	set MAX_HSIZE ${PARAM_VALUE.MAX_HSIZE}
	set WHICH_INTERFACE ${PARAM_VALUE.WHICH_INTERFACE}
	set values(WHICH_INTERFACE) [get_property value $WHICH_INTERFACE]
	if { [gen_USERPARAMETER_MAX_HSIZE_ENABLEMENT $values(WHICH_INTERFACE)] } {
		set_property enabled true $MAX_HSIZE
	} else {
		set_property enabled false $MAX_HSIZE
	}
}

proc validate_PARAM_VALUE.MAX_HSIZE { PARAM_VALUE.MAX_HSIZE } {
	# Procedure called to validate MAX_HSIZE
	return true
}

proc update_PARAM_VALUE.MAX_VSIZE { PARAM_VALUE.MAX_VSIZE PARAM_VALUE.WHICH_INTERFACE } {
	# Procedure called to update MAX_VSIZE when any of the dependent parameters in the arguments change
	
	set MAX_VSIZE ${PARAM_VALUE.MAX_VSIZE}
	set WHICH_INTERFACE ${PARAM_VALUE.WHICH_INTERFACE}
	set values(WHICH_INTERFACE) [get_property value $WHICH_INTERFACE]
	if { [gen_USERPARAMETER_MAX_VSIZE_ENABLEMENT $values(WHICH_INTERFACE)] } {
		set_property enabled true $MAX_VSIZE
	} else {
		set_property enabled false $MAX_VSIZE
	}
}

proc validate_PARAM_VALUE.MAX_VSIZE { PARAM_VALUE.MAX_VSIZE } {
	# Procedure called to validate MAX_VSIZE
	return true
}

proc update_PARAM_VALUE.FRAME_TO_TRIGGER { PARAM_VALUE.FRAME_TO_TRIGGER } {
	# Procedure called to update FRAME_TO_TRIGGER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FRAME_TO_TRIGGER { PARAM_VALUE.FRAME_TO_TRIGGER } {
	# Procedure called to validate FRAME_TO_TRIGGER
	return true
}

proc update_PARAM_VALUE.INIT_HSIZE { PARAM_VALUE.INIT_HSIZE } {
	# Procedure called to update INIT_HSIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INIT_HSIZE { PARAM_VALUE.INIT_HSIZE } {
	# Procedure called to validate INIT_HSIZE
	return true
}

proc update_PARAM_VALUE.INIT_VSIZE { PARAM_VALUE.INIT_VSIZE } {
	# Procedure called to update INIT_VSIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INIT_VSIZE { PARAM_VALUE.INIT_VSIZE } {
	# Procedure called to validate INIT_VSIZE
	return true
}

proc update_PARAM_VALUE.LINE_TO_TRIGGER { PARAM_VALUE.LINE_TO_TRIGGER } {
	# Procedure called to update LINE_TO_TRIGGER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LINE_TO_TRIGGER { PARAM_VALUE.LINE_TO_TRIGGER } {
	# Procedure called to validate LINE_TO_TRIGGER
	return true
}

proc update_PARAM_VALUE.PIXEL_TO_TRIGGER { PARAM_VALUE.PIXEL_TO_TRIGGER } {
	# Procedure called to update PIXEL_TO_TRIGGER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PIXEL_TO_TRIGGER { PARAM_VALUE.PIXEL_TO_TRIGGER } {
	# Procedure called to validate PIXEL_TO_TRIGGER
	return true
}

proc update_PARAM_VALUE.TDATA_WIDTH { PARAM_VALUE.TDATA_WIDTH } {
	# Procedure called to update TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDATA_WIDTH { PARAM_VALUE.TDATA_WIDTH } {
	# Procedure called to validate TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.WHICH_INTERFACE { PARAM_VALUE.WHICH_INTERFACE } {
	# Procedure called to update WHICH_INTERFACE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WHICH_INTERFACE { PARAM_VALUE.WHICH_INTERFACE } {
	# Procedure called to validate WHICH_INTERFACE
	return true
}


proc update_MODELPARAM_VALUE.TDATA_WIDTH { MODELPARAM_VALUE.TDATA_WIDTH PARAM_VALUE.TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDATA_WIDTH}] ${MODELPARAM_VALUE.TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.MAX_HSIZE { MODELPARAM_VALUE.MAX_HSIZE PARAM_VALUE.MAX_HSIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_HSIZE}] ${MODELPARAM_VALUE.MAX_HSIZE}
}

proc update_MODELPARAM_VALUE.MAX_VSIZE { MODELPARAM_VALUE.MAX_VSIZE PARAM_VALUE.MAX_VSIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_VSIZE}] ${MODELPARAM_VALUE.MAX_VSIZE}
}

proc update_MODELPARAM_VALUE.INIT_HSIZE { MODELPARAM_VALUE.INIT_HSIZE PARAM_VALUE.INIT_HSIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INIT_HSIZE}] ${MODELPARAM_VALUE.INIT_HSIZE}
}

proc update_MODELPARAM_VALUE.INIT_VSIZE { MODELPARAM_VALUE.INIT_VSIZE PARAM_VALUE.INIT_VSIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INIT_VSIZE}] ${MODELPARAM_VALUE.INIT_VSIZE}
}

proc update_MODELPARAM_VALUE.FRAME_TO_TRIGGER { MODELPARAM_VALUE.FRAME_TO_TRIGGER PARAM_VALUE.FRAME_TO_TRIGGER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FRAME_TO_TRIGGER}] ${MODELPARAM_VALUE.FRAME_TO_TRIGGER}
}

proc update_MODELPARAM_VALUE.LINE_TO_TRIGGER { MODELPARAM_VALUE.LINE_TO_TRIGGER PARAM_VALUE.LINE_TO_TRIGGER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LINE_TO_TRIGGER}] ${MODELPARAM_VALUE.LINE_TO_TRIGGER}
}

proc update_MODELPARAM_VALUE.PIXEL_TO_TRIGGER { MODELPARAM_VALUE.PIXEL_TO_TRIGGER PARAM_VALUE.PIXEL_TO_TRIGGER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PIXEL_TO_TRIGGER}] ${MODELPARAM_VALUE.PIXEL_TO_TRIGGER}
}

proc update_MODELPARAM_VALUE.INCLUDE_FRAME_SIZE_LOGGER { MODELPARAM_VALUE.INCLUDE_FRAME_SIZE_LOGGER PARAM_VALUE.INCLUDE_FRAME_SIZE_LOGGER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INCLUDE_FRAME_SIZE_LOGGER}] ${MODELPARAM_VALUE.INCLUDE_FRAME_SIZE_LOGGER}
}

proc update_MODELPARAM_VALUE.WHICH_INTERFACE { MODELPARAM_VALUE.WHICH_INTERFACE PARAM_VALUE.WHICH_INTERFACE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WHICH_INTERFACE}] ${MODELPARAM_VALUE.WHICH_INTERFACE}
}

