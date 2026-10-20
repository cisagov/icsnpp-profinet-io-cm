# @TEST-DOC: Verify non-standard UDP port registration, direction inference, and bidirectional payload signatures.
#
# @TEST-EXEC: base64 -d ${DIST}/testing/files/profinet-custom-udp-c2s.pcap.b64 > custom-udp-c2s.pcap
# @TEST-EXEC: base64 -d ${DIST}/testing/files/profinet-custom-udp-s2c.pcap.b64 > custom-udp-s2c.pcap
#
# Without signatures or configuration, the custom port is not parsed.
# @TEST-EXEC: zeek -C -r custom-udp-c2s.pcap ${DIST}/testing/scripts/load-without-signatures.zeek
# @TEST-EXEC: test ! -e profinet_io_cm.log
# @TEST-EXEC: rm -f *.log
#
# The UDP set assigns traffic to the analyzer and updates the direction heuristic.
# @TEST-EXEC: zeek -C -r custom-udp-c2s.pcap ${DIST}/testing/scripts/load-without-signatures.zeek "PROFINET_IO_CM::udp_ports+={12345/udp}"
# @TEST-EXEC: test "$(zeek-cut destination_p < profinet_io_cm.log)" = "12345"
# @TEST-EXEC: rm -f *.log
#
# The same single-set configuration provides server-direction inference in both directions.
# @TEST-EXEC: zeek -C -r custom-udp-c2s.pcap ${DIST}/testing/scripts/load-without-signatures.zeek %INPUT "PROFINET_IO_CM::udp_ports+={12345/udp}"
# @TEST-EXEC: test "$(zeek-cut id.resp_p < profinet_io_cm.log)" = "12345"
# @TEST-EXEC: rm -f *.log
# @TEST-EXEC: zeek -C -r custom-udp-s2c.pcap ${DIST}/testing/scripts/load-without-signatures.zeek %INPUT "PROFINET_IO_CM::udp_ports+={12345/udp}"
# @TEST-EXEC: test "$(zeek-cut id.resp_p < profinet_io_cm.log)" = "12345"
# @TEST-EXEC: rm -f *.log
#
# Normal package loading detects both payload directions by signature without port configuration.
# @TEST-EXEC: zeek -C -r custom-udp-c2s.pcap ${PACKAGE}
# @TEST-EXEC: test -e profinet_io_cm.log
# @TEST-EXEC: rm -f *.log
# @TEST-EXEC: zeek -C -r custom-udp-s2c.pcap ${PACKAGE}
# @TEST-EXEC: test -e profinet_io_cm.log

event zeek_init() &priority=-10
    {
    assert(12345/udp in PROFINET_IO_CM::udp_ports);
    assert(12345/udp in likely_server_ports);
    assert(12345/udp in Analyzer::registered_ports(Analyzer::ANALYZER_SPICY_PROFINET_IO_CM));
    }
