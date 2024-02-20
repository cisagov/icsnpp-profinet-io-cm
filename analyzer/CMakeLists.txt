spicy_add_analyzer(
    NAME PROFINET_IO_CM
    PACKAGE_NAME icsnpp-profinet-io-cm
    SOURCES zeek_profinetio.spicy profinet_io_cm.evt profinet_io_cm_enums.spicy profinet_io_cm_multi.spicy profinet_io_cm_rpc_header.spicy profinet_io_cm_types.spicy profinet_io_cm_message.spicy import_functions.spicy c_functions.cc
    SCRIPTS zeekEnums.zeek types.zeek main.zeek profinet_io_processing.zeek __load__.zeek
)