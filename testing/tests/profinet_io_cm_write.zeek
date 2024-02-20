# @TEST-EXEC: touch profinet_io_cm.log
# @TEST-EXEC: zeek -C -r ${TRACES}/profinet_io_cm_write.pcapng ${PACKAGE} %INPUT
# @TEST-EXEC: zeek-cut id.orig_h id.orig_p id.resp_h id.resp_p proto service < conn.log > conn.tmp && mv conn.tmp conn.log
# @TEST-EXEC: btest-diff conn.log
# @TEST-EXEC: btest-diff profinet_io_cm.log
#
# @TEST-DOC: Test profinet-io-cm analyzer with profinet_io_cm_write.pcapng
