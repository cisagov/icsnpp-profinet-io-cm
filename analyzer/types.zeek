##! types.zeek
##!
##! Zeek records and field types
##!
##!
##! Author:   Taegan Williams
##! Contact:  taegan.williams@inl.gov
##!
##! Copyright (c) 2024 Battelle Energy Alliance, LLC.  All rights reserved.

module PROFINET_IO_CM;

export {
    type Profinet_Header: record {
        ts                             : time &log;
        uid                            : string &log;
        id                             : conn_id &log;

        # Source/Destination
        source_h                      : addr &log &optional;  # Source IP Address
        source_p                      : port &log &optional;  # Source Port
        destination_h                 : addr &log &optional;  # Destination IP Address
        destination_p                 : port &log &optional;  # Destination Port

        proto                          : string &log;
        rpc_version                    : count &log &optional;
        packet_type                    : string &log &optional;
        reserved_for_impl_1            : bool &log &optional;
        last_fragment                  : bool &log &optional;
        fragment                       : bool &log &optional;
        no_fragment_requested          : bool &log &optional;
        maybe                          : bool &log &optional;
        idempotent                     : bool &log &optional;
        broadcast                      : bool &log &optional;
        reserved_for_impl_2            : bool &log &optional;
        cancel_was_pending_at_call_end : bool &log &optional;
        integer_encoding               : string &log &optional;
        character_encoding             : string &log &optional;
        floating_point_encoding        : string &log &optional;

        serial_high                    : count &log &optional;
        object_uuid                    : string &log &optional;
        interface_uuid                 : string &log &optional;
        activity_uuid                  : string &log &optional;
        server_boot_time               : count &log &optional;
        interface_vers_major           : count &log &optional;
        interface_vers_minor           : count &log &optional;
        sequence_num                   : count &log &optional;
        operation_num                  : string &log &optional;
        interface_hint                 : count &log &optional;
        activity_hint                  : count &log &optional;
        len_of_body                    : count &log &optional;
        fragment_num                   : count &log &optional;
        auth_protocol                  : count &log &optional;
        serial_low                     : count &log &optional;
        vers_fack                      : string &log &optional;
        window_size                    : count &log &optional;
        max_tsdu                       : count &log &optional;
        max_frag_size                  : count &log &optional;
        serial_number                  : count &log &optional;
        sel_ack_len                    : count &log &optional;
        array_of_sel_ack               : vector of count &log &optional;
    };
}
