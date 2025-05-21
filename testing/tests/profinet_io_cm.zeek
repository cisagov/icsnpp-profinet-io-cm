# @TEST-EXEC: touch profinet_io_cm.log
# @TEST-EXEC: zeek -C -r ${TRACES}/profinet_io_cm.pcap ${PACKAGE} %INPUT
# @TEST-EXEC: zeek-cut id.orig_h id.orig_p id.resp_h id.resp_p proto service < conn.log > conn.tmp && mv conn.tmp conn.log
# @TEST-EXEC: zeek-cut id.orig_h id.orig_p id.resp_h id.resp_p source_h source_p destination_h destination_p proto rpc_version packet_type reserved_for_impl_1 last_fragment fragment no_fragment_requested maybe idempotent broadcast reserved_for_impl_2 cancel_was_pending_at_call_end integer_encoding character_encoding floating_point_encoding serial_high object_uuid interface_uuid activity_uuid server_boot_time interface_vers_major interface_vers_minor sequence_num operation_num interface_hint activity_hint len_of_body fragment_num auth_protocol serial_low vers_fack window_size max_tsdu max_frag_size serial_number sel_ack_len array_of_sel_ack < profinet_io_cm.log > profinet_io_cm.tmp && mv profinet_io_cm.tmp profinet_io_cm.log
# @TEST-EXEC: btest-diff conn.log
# @TEST-EXEC: btest-diff profinet_io_cm.log
#
# @TEST-DOC: Test profinet-io-cm analyzer with profinet_io_cm.pcap
