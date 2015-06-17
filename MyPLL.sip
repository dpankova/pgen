set_global_assignment -entity "MyPLL" -library "lib_MyPLL" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "MyPLL" -library "lib_MyPLL" -name IP_TOOL_VERSION "13.1"
set_global_assignment -entity "MyPLL" -library "lib_MyPLL" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_MyPLL" -name SPD_FILE [file join $::quartus(sip_path) "MyPLL.spd"]

set_global_assignment -library "lib_MyPLL" -name MISC_FILE [file join $::quartus(sip_path) "MyPLL_sim/MyPLL.vo"]
