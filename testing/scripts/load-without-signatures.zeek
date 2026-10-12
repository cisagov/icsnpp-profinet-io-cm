# Load the PROFINET IO CM scripts without DPD signatures so tests can isolate
# port-based analyzer registration.
@load ../../analyzer/zeekEnums
@load ../../analyzer/types
@load ../../analyzer/main
@load ../../analyzer/profinet_io_processing
