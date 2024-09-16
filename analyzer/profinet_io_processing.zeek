##! profinet_io_processing.zeek
##!
##! Zeek Processing. Matches the Types from Spicy (exported .evt) to zeek (types.zeek)
##!
##!
##! Author:   Taegan Williams
##! Contact:  taegan.williams@inl.gov
##!
##! Copyright (c) 2024 Battelle Energy Alliance, LLC.  All rights reserved.

module PROFINET_IO_CM;

hook set_connection_log_profinet(c: connection) {
    if ( ! c?$log_profinet )
        c$log_profinet = PROFINET_IO_CM::Profinet_Header($ts=network_time(),$uid=c$uid, $id=c$id, $proto="profinet_io_cm");
}

event PROFINET_IO_CM::RpcHeaderEvt(c: connection, is_orig: bool,_rpcHeader_: PROFINET_IO_CM::RpcHeader){
    hook set_connection_log_profinet(c);
    local _rpc_header_                        = c$log_profinet;

    # Set source and destination information
    if (is_orig) {
        _rpc_header_$source_h      = c$id$orig_h;
        _rpc_header_$source_p      = c$id$orig_p;
        _rpc_header_$destination_h = c$id$resp_h;
        _rpc_header_$destination_p = c$id$resp_p;
    } else {
        _rpc_header_$source_h      = c$id$resp_h;
        _rpc_header_$source_p      = c$id$resp_p;
        _rpc_header_$destination_h = c$id$orig_h;
        _rpc_header_$destination_p = c$id$orig_p;
    }

    _rpc_header_$rpc_version                   = _rpcHeader_$rpcVersion;
    _rpc_header_$packet_type                   = PDU_TYPE[_rpcHeader_$pduType$packetType];
    _rpc_header_$reserved_for_impl_1            = _rpcHeader_$rpcFlags1$implementationSpecificSetTo0_1;
    _rpc_header_$last_fragment                 = _rpcHeader_$rpcFlags1$lastFragment;
    _rpc_header_$fragment                     = _rpcHeader_$rpcFlags1$fragment;
    _rpc_header_$no_fragment_requested          = _rpcHeader_$rpcFlags1$noFragmentRequested;
    _rpc_header_$maybe                        = _rpcHeader_$rpcFlags1$maybe;
    _rpc_header_$idempotent                   = _rpcHeader_$rpcFlags1$idempotent;
    _rpc_header_$broadcast                    = _rpcHeader_$rpcFlags1$broadcast;
    _rpc_header_$reserved_for_impl_2            = _rpcHeader_$rpcFlags1$implementationSpecificSetTo0_2;
    _rpc_header_$cancel_was_pending_at_call_end    = _rpcHeader_$rpcFlags2$cancelWasPendingAtCallEnd;
    _rpc_header_$integer_encoding              = RPCD_REP_INTEGER_ENCODING[_rpcHeader_$drepBytes$characterIntegerEncoding$rpcdRepIntegerEncoding];
    _rpc_header_$character_encoding            = RPCD_REP_CHARACTER_ENCODING[_rpcHeader_$drepBytes$characterIntegerEncoding$rpcdRepCharacterEncoding];
    _rpc_header_$floating_point_encoding        = FLOATING_POINT_REPRESENTATION[_rpcHeader_$drepBytes$floatPointEncoding$floatingPointRepresentation];
    if(_rpcHeader_?$rpcBodyLittleEndian){
        _rpc_header_$serial_high                = _rpcHeader_$rpcBodyLittleEndian$serialHigh;
        _rpc_header_$object_uuid               = _rpcHeader_$rpcBodyLittleEndian$objectUuid$uidValue;
        _rpc_header_$interface_uuid            = _rpcHeader_$rpcBodyLittleEndian$interfaceUuid$uidValue;
        _rpc_header_$activity_uuid             = _rpcHeader_$rpcBodyLittleEndian$activityUuid$uidValue;
        _rpc_header_$server_boot_time            = _rpcHeader_$rpcBodyLittleEndian$serverBootTime;
        _rpc_header_$interface_vers_major        = _rpcHeader_$rpcBodyLittleEndian$interfaceVersion$rpcInterfaceVersionMajor;
        _rpc_header_$interface_vers_minor        = _rpcHeader_$rpcBodyLittleEndian$interfaceVersion$rpcInterfaceVersionMinor;
        _rpc_header_$sequence_num               = _rpcHeader_$rpcBodyLittleEndian$sequenceNum;
        _rpc_header_$operation_num              = PNIO_SERVICES_VALUE[_rpcHeader_$rpcBodyLittleEndian$operationNum];
        _rpc_header_$interface_hint             = _rpcHeader_$rpcBodyLittleEndian$interfaceHint;
        _rpc_header_$activity_hint              = _rpcHeader_$rpcBodyLittleEndian$activityHint;
        _rpc_header_$len_of_body                 = _rpcHeader_$rpcBodyLittleEndian$lenOfBody;
        _rpc_header_$fragment_num               = _rpcHeader_$rpcBodyLittleEndian$fragmentNum;
        _rpc_header_$auth_protocol              = _rpcHeader_$rpcBodyLittleEndian$authProtocol;
        _rpc_header_$serial_low                 = _rpcHeader_$rpcBodyLittleEndian$serialLow;
    }
    if(_rpcHeader_?$ndrFackLittle){
        _rpc_header_$vers_fack     = RPC_VERSION_FACK[_rpcHeader_$ndrFackLittle$rpcVersionFack];
        _rpc_header_$window_size   = _rpcHeader_$ndrFackLittle$rpcWindowSize;
        _rpc_header_$max_tsdu      = _rpcHeader_$ndrFackLittle$rpcMaxTsdu;
        _rpc_header_$max_frag_size  = _rpcHeader_$ndrFackLittle$rpcMaxFragSize;
        _rpc_header_$serial_number = _rpcHeader_$ndrFackLittle$rpcSerialNumber;
        _rpc_header_$sel_ack_len    = _rpcHeader_$ndrFackLittle$rpcSelAckLen;
        if(_rpcHeader_$ndrFackLittle?$rpcArrayOfSelAck){
            _rpc_header_$array_of_sel_ack = vector();
            for(item in _rpcHeader_$ndrFackLittle$rpcArrayOfSelAck){
                 _rpc_header_$array_of_sel_ack += _rpcHeader_$ndrFackLittle$rpcArrayOfSelAck[item];
            }
        }
    }
    if(_rpcHeader_?$rpcBodyBigEndian){
        _rpc_header_$serial_high                = _rpcHeader_$rpcBodyBigEndian$serialHigh;
        _rpc_header_$object_uuid               = _rpcHeader_$rpcBodyBigEndian$objectUuid$uidValue;
        _rpc_header_$interface_uuid            = _rpcHeader_$rpcBodyBigEndian$interfaceUuid$uidValue;
        _rpc_header_$activity_uuid             = _rpcHeader_$rpcBodyBigEndian$activityUuid$uidValue;
        _rpc_header_$server_boot_time            = _rpcHeader_$rpcBodyBigEndian$serverBootTime;
        _rpc_header_$interface_vers_major        = _rpcHeader_$rpcBodyBigEndian$interfaceVersion$rpcInterfaceVersionMajor;
        _rpc_header_$interface_vers_minor        = _rpcHeader_$rpcBodyBigEndian$interfaceVersion$rpcInterfaceVersionMinor;
        _rpc_header_$sequence_num               = _rpcHeader_$rpcBodyBigEndian$sequenceNum;
        _rpc_header_$operation_num              = PNIO_SERVICES_VALUE[_rpcHeader_$rpcBodyBigEndian$operationNum];
        _rpc_header_$interface_hint             = _rpcHeader_$rpcBodyBigEndian$interfaceHint;
        _rpc_header_$activity_hint              = _rpcHeader_$rpcBodyBigEndian$activityHint;
        _rpc_header_$len_of_body                 = _rpcHeader_$rpcBodyBigEndian$lenOfBody;
        _rpc_header_$fragment_num               = _rpcHeader_$rpcBodyBigEndian$fragmentNum;
        _rpc_header_$auth_protocol              = _rpcHeader_$rpcBodyBigEndian$authProtocol;
        _rpc_header_$serial_low                 = _rpcHeader_$rpcBodyBigEndian$serialLow;
    }
    if(_rpcHeader_?$ndrFackBig){
        _rpc_header_$vers_fack     = RPC_VERSION_FACK[_rpcHeader_$ndrFackBig$rpcVersionFack];
        _rpc_header_$window_size   = _rpcHeader_$ndrFackBig$rpcWindowSize;
        _rpc_header_$max_tsdu      = _rpcHeader_$ndrFackBig$rpcMaxTsdu;
        _rpc_header_$max_frag_size  = _rpcHeader_$ndrFackBig$rpcMaxFragSize;
        _rpc_header_$serial_number = _rpcHeader_$ndrFackBig$rpcSerialNumber;
        _rpc_header_$sel_ack_len    = _rpcHeader_$ndrFackBig$rpcSelAckLen;
        if(_rpcHeader_$ndrFackBig?$rpcArrayOfSelAck){
            _rpc_header_$array_of_sel_ack = vector();
            for(item in _rpcHeader_$ndrFackBig$rpcArrayOfSelAck){
                 _rpc_header_$array_of_sel_ack += _rpcHeader_$ndrFackBig$rpcArrayOfSelAck[item];
            }
        }
    }
    PROFINET_IO_CM::emit_header_log(c);
}
