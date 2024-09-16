##! zeekEnums.zeek
##!
##! zeek constants that convert spicy enums to zeek strings
##!
##!
##! Author:   Taegan Williams
##! Contact:  taegan.williams@inl.gov
##!
##! Copyright (c) 2024 Battelle Energy Alliance, LLC.  All rights reserved.

module PROFINET_IO_CM;

export{
    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 4.10.3.2.2 Table 270
    const PDU_TYPE = {
        [PROFINET_IO_CM_ENUMS::PduType_REQUEST]                  = "Request",
        [PROFINET_IO_CM_ENUMS::PduType_PING]                     = "Ping",
        [PROFINET_IO_CM_ENUMS::PduType_RESPONSE]                 = "Response",
        [PROFINET_IO_CM_ENUMS::PduType_FAULT]                    = "Fault",
        [PROFINET_IO_CM_ENUMS::PduType_WORKING]                  = "Working",
        [PROFINET_IO_CM_ENUMS::PduType_NO_CALL_RESPONSE_TO_PING] = "No call Response to Ping",
        [PROFINET_IO_CM_ENUMS::PduType_REJECT]                   = "Reject",
        [PROFINET_IO_CM_ENUMS::PduType_ACKNOWLEDGE]              = "Acknowledge",
        [PROFINET_IO_CM_ENUMS::PduType_CONNECTIONLESS_CANCEL]    = "Connectionless Canel",
        [PROFINET_IO_CM_ENUMS::PduType_FRAGMENT_ACKNOWLEDGE]     = "Fragment Acknowledge",
        [PROFINET_IO_CM_ENUMS::PduType_CANCEL_ACKNOWLEDGE]       = "Cancel Acknowledge"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 4.10.3.2.5 Table 273
    const RPCD_REP_CHARACTER_ENCODING = {
        [PROFINET_IO_CM_ENUMS::RpcdRepCharacterEncoding_ASCII]   = "ASCII",
        [PROFINET_IO_CM_ENUMS::RpcdRepCharacterEncoding_EBCDIC]  = "EBCDIC"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 4.10.3.2.5 Table 273
    const RPCD_REP_INTEGER_ENCODING = {
        [PROFINET_IO_CM_ENUMS::RpcdRepIntegerEncoding__BIG_ENDIAN]       = "Big Endian",
        [PROFINET_IO_CM_ENUMS::RpcdRepIntegerEncoding__LITTLE_ENDIAN]    = "Little Endian"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 4.10.3.2.5 Table 274
    const FLOATING_POINT_REPRESENTATION = {
        [PROFINET_IO_CM_ENUMS::FloatingPointRepresentation_IEEE] = "IEEE",
        [PROFINET_IO_CM_ENUMS::FloatingPointRepresentation_VAX]  = "VAX",
        [PROFINET_IO_CM_ENUMS::FloatingPointRepresentation_CRAY] = "CRAY",
        [PROFINET_IO_CM_ENUMS::FloatingPointRepresentation_IBM]  = "IBM"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 4.10.3.2.14 Table 282
    const PNIO_SERVICES_VALUE = {
        [PROFINET_IO_CM_ENUMS::PnioServicesValue_CONNECT]         = "Connect",
        [PROFINET_IO_CM_ENUMS::PnioServicesValue_RELEASE]         = "Release",
        [PROFINET_IO_CM_ENUMS::PnioServicesValue_READ]            = "Read",
        [PROFINET_IO_CM_ENUMS::PnioServicesValue_WRITE]           = "Write",
        [PROFINET_IO_CM_ENUMS::PnioServicesValue_CONTROL]         = "Control",
        [PROFINET_IO_CM_ENUMS::PnioServicesValue_READ_IMPLICIT]   = "Read Implicit"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 4.10.3.2.23 Table 284
    const RPC_VERSION_FACK = {
        [PROFINET_IO_CM_ENUMS::RpcVersionFack_INITIAL]  = "Initial version",
        [PROFINET_IO_CM_ENUMS::RpcVersionFack_DEFAULT]  = "Default version",
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section5.2.6.2 Table 538
    const PNIO_STATUS_ERROR_CODE = {
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorCode_NO_ERROR]             = "No Error",
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorCode_PNIO]                 = "PNIO",
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorCode_RTA_ERROR]            = "RTA Error",
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorCode_ALARM_ACK]            = "AlarmAck",
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorCode_IOD_CONNECT_RES]      = "IODConnectRes",
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorCode_IOD_RELEASE_RES]      = "IODReleaseRes",
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorCode_IOD_IOX_CONTROL_RES]  = "IODControlRes or IOXControlRes",
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorCode_IOD_READ_RES]         = "IODReadRes",
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorCode_IOD_WRITE_RES]        = "IODWriteRes"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section5.2.6.2 Table 539
    const PNIO_STATUS_ERROR_DECODE = {
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorDecode_NO_ERROR]               = "No Error",
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorDecode_PNIORW]                 = "PNIORW user error codes with Read and Write Service",
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorDecode_PNIO]                   = "PNIO used with other services or internal",
        [PROFINET_IO_CM_ENUMS::PnioStatusErrorDecode_MANUFACTURER_SPECIFIC]  = "Manufacturer Specific - used in context with LogBookData"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section5.2.6.2 Table 540
    const ERROR_CODE1_CLASS = {
        [PROFINET_IO_CM_ENUMS::ErrorCode1Class_NO_ERROR]             = "No Error",
        [PROFINET_IO_CM_ENUMS::ErrorCode1Class_APPLICATION]          = "Application",
        [PROFINET_IO_CM_ENUMS::ErrorCode1Class_ACCESS]               = "Access",
        [PROFINET_IO_CM_ENUMS::ErrorCode1Class_RESOURCE]             = "Resource",
        [PROFINET_IO_CM_ENUMS::ErrorCode1Class__13_USER_SPECIFIC]    = "User Specific",
        [PROFINET_IO_CM_ENUMS::ErrorCode1Class__14_USER_SPECIFIC]    = "User Specific",
        [PROFINET_IO_CM_ENUMS::ErrorCode1Class__15_USER_SPECIFIC]    = "User Specific"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section5.2.6.2 Table 540
    const ERROR_CODE1_CODE_APPLICATION = {
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeApplication_READ_ERROR]             = "Read Error",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeApplication_WRITE_ERROR]            = "Write Error",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeApplication_BUSY]                   = "Busy",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeApplication_VERSION_CONFLICT]       = "Version Conflict",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeApplication_FEATURE_NOT_SUPPORTED]  = "Feature Not Supported",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeApplication_USER_SPECIFIC_1]        = "User Specific 1",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeApplication_USER_SPECIFIC_2]        = "User Specific 2",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeApplication_USER_SPECIFIC_3]        = "User Specific 3",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeApplication_USER_SPECIFIC_4]        = "User Specific 4",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeApplication_USER_SPECIFIC_5]        = "User Specific 5",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeApplication_USER_SPECIFIC_6]        = "User Specific 6"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section5.2.6.2 Table 540
    const ERROR_CODE1_CODE_ACCESS = {
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_INVALID_INDEX]           = "Invalid Index",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_WRITE_LENGTH_ERROR]      = "Write Length Error",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_INVALID_SLOT_SUBSLOT]    = "Invalid Slot Subslot",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_TYPE_CONFLICT]           = "Type Conflict",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_INVALID_AREA_API]        = "Invalid Area API",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_STATE_CONFLICT]          = "State Conflict",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_ACCESS_DENIED]           = "Access Denied",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_INVALID_RANGE]           = "Invalid Range",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_INVALID_PARAMETER]       = "Invalid Parameter",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_INVALID_TYPE]           = "Invalid Type",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_BACKUP]                  = "Backup",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_USER_SPECIFIC_7]         = "User Specific 7",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_USER_SPECIFIC_8]         = "User Specific 8",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_USER_SPECIFIC_9]         = "User Specific 9",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_USER_SPECIFIC_10]        = "User Specific 10",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeAccess_USER_SPECIFIC_11]        = "User Specific 11"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section5.2.6.2 Table 540
    const ERROR_CODE1_CODE_RESOURCE = {
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_READ_CONSTRAIN_CONFLICT]   = "Read Constrain Conflict",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_WRITE_CONSTRAIN_CONFLICT]  = "Write Constrain Conflict",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_RESOURCE_BUSY]             = "Resource Busy",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_RESOURCE_UNAVAILABLE]      = "Resource Unavailable",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_USER_SPECIFIC_12]          = "User Specific 12",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_USER_SPECIFIC_13]          = "User Specific 13",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_USER_SPECIFIC_14]          = "User Specific 14",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_USER_SPECIFIC_15]          = "User Specific 15",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_USER_SPECIFIC_16]          = "User Specific 16",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_USER_SPECIFIC_17]          = "User Specific 17",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_USER_SPECIFIC_18]          = "User Specific 18",
        [PROFINET_IO_CM_ENUMS::ErrorCode1CodeResource_USER_SPECIFIC_19]          = "User Specific 19"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_AR_BLOCK_REQ = {
        [PROFINET_IO_CM_ENUMS::FaultyArBlockReq_ERROR_PARAMETER_BLOCK_TYPE]      = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyArBlockReq_ERROR_PARAMETER_LENGTH]          = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyArBlockReq_ERROR_PARAMETER_NAME_OF_STATION] = "Error in Parameter NameOfStation"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_IOCR_BLOCK_REQ = {
        [PROFINET_IO_CM_ENUMS::FaultyIocrBlockReq_ERROR_PARAMETER_BLOCK_TYPE]        = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyIocrBlockReq_ERROR_PARAMETER_LENGTH]            = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyIocrBlockReq_ERROR_PARAMETER_IOCS_FRAME_OFFSET] = "Error in Parameter IOCSFrameOffset production"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_EXPECTED_SUBMODULE_BLOCK_REQ = {
        [PROFINET_IO_CM_ENUMS::FaultyExpectedSubmoduleBlockReq_ERROR_PARAMETER_BLOCK_TYPE]   = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyExpectedSubmoduleBlockReq_ERROR_PARAMETER_LENGTH]       = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyExpectedSubmoduleBlockReq_ERROR_PARAMETER_LENGTH_IOCS]  = "Error in Parameter LengthIOCS production"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_ALARM_CR_BLOCK_REQ = {
        [PROFINET_IO_CM_ENUMS::FaultyAlarmCrBlockReq_ERROR_PARAMETER_BLOCK_TYPE]                 = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyAlarmCrBlockReq_ERROR_PARAMETER_LENGTH]                     = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyAlarmCrBlockReq_ERROR_PARAMETER_ALARM_CR_TAG_HEADER_LOW]    = "Error in Parameter AlarmCRTagHeaderLow"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_PRM_SERVER_BLOCK = {
        [PROFINET_IO_CM_ENUMS::FaultyPrmServerBlock_ERROR_PARAMETER_BLOCK_TYPE]          = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyPrmServerBlock_ERROR_PARAMETER_LENGTH]              = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyPrmServerBlock_ERROR_PARAMETER_SERVER_STATION_NAME] = "Error in Parameter ParameterServerStationName"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_MCR_BLOCK_REQ = {
        [PROFINET_IO_CM_ENUMS::FaultyMcrBlockReq_ERROR_PARAMETER_BLOCK_TYPE]                 = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyMcrBlockReq_ERROR_PARAMETER_LENGTH]                     = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyMcrBlockReq_ERROR_PARAMETER_I_PROVIDER_STATION_NAME]    = "Error in Parameter ProviderStationName"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_ARRPC_BLOCK_REQ = {
        [PROFINET_IO_CM_ENUMS::FaultyArrpcBlockReq_ERROR_PARAMETER_BLOCK_TYPE]               = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyArrpcBlockReq_ERROR_PARAMETER_LENGTH]                   = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyArrpcBlockReq_ERROR_PARAMETER_INITATOR_RPC_SERVER_PORT] = "Error in Parameter InitatorRpcServerPort"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_RECORD = {
        [PROFINET_IO_CM_ENUMS::FaultyRecord_ERROR_PARAMETER_BLOCK_TYPE]      = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyRecord_ERROR_PARAMETER_LENGTH]          = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyRecord_ERROR_PARAMETER_TARGET_ARUUID]   = "Error in Parameter TargetARUUID"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_IR_INFO_BLOCK = {
        [PROFINET_IO_CM_ENUMS::FaultyIrInfoBlock_ERROR_PARAMETER_BLOCK_TYPE]     = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyIrInfoBlock_ERROR_PARAMETER_LENGTH]         = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyIrInfoBlock_ERROR_PARAMETER_IR_DATA_UUID]   = "Error in Parameter IRDataUUID"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_SR_INFO_BLOCK = {
        [PROFINET_IO_CM_ENUMS::FaultySrInfoBlock_ERROR_PARAMETER_BLOCK_TYPE]     = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultySrInfoBlock_ERROR_PARAMETER_LENGTH]         = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultySrInfoBlock_ERROR_PARAMETER_SR_PROPERTIES]  = "Error in Paramteter SRProperties"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_ARFSU_BLOCK = {
        [PROFINET_IO_CM_ENUMS::FaultyArfsuBlock_ERROR_PARAMETER_BLOCK_TYPE]  = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyArfsuBlock_ERROR_PARAMETER_LENGTH]      = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyArfsuBlock_FAST_START_UP_BLOCK]         = "FastStartUpBlock"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_AR_VENDOR_BLOCK_REQ = {
        [PROFINET_IO_CM_ENUMS::FaultyArVendorBlockReq_ERROR_PARAMETER_BLOCK_TYPE]    = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyArVendorBlockReq_ERROR_PARAMETER_LENGTH]        = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyArVendorBlockReq_ERROR_PARAMETER_API]           = "Error in Parameter Block Type",
        [PROFINET_IO_CM_ENUMS::FaultyArVendorBlockReq_ERROR_PARAMETER_DATA]          = "Error in Parameter Data"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_RS_INFO_BLOCK = {
        [PROFINET_IO_CM_ENUMS::FaultyRsInfoBlock_ERROR_PARAMETER_BLOCK_TYPE]     = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyRsInfoBlock_ERROR_PARAMETER_LENGTH]         = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyRsInfoBlock_ERROR_PARAMETER_RS_PROPERTIES]  = "Error in parameter RSProperties"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_CONTROL_BLOCK_CONNECT = {
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockConnect_ERROR_PARAMETER_BLOCK_TYPE]                 = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockConnect_ERROR_PARAMETER_LENGTH]                     = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockConnect_ERROR_PARAMETER_CONTROL_BLOCK_PROPERTIES]   = "Error in Parameter ControlBlockProperties"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_CONTROL_BLOCK_PLUG = {
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockPlug_ERROR_PARAMETER_BLOCK_TYPE]                = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockPlug_ERROR_PARAMETER_LENGTH]                    = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockPlug_ERROR_PARAMETER_CONTROL_BLOCK_PROPERTIES]  = "Error in Parameter ControlBlockProperties"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_CONTROL_BLOCK_CONNECT_AFTER = {
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockConnectAfter_ERROR_PARAMETER_BLOCK_TYPE]                = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockConnectAfter_ERROR_PARAMETER_LENGTH]                    = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockConnectAfter_ERROR_PARAMETER_CONTROL_BLOCK_PROPERTIES]  = "Error in Parameter ControlBlockProperties"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_CONTROL_BLOCK_PLUG_AFTER = {
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockPlugAfter_ERROR_PARAMETER_BLOCK_TYPE]               = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockPlugAfter_ERROR_PARAMETER_LENGTH]                   = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockPlugAfter_ERROR_PARAMETER_CONTROL_BLOCK_PROPERTIES] = "Error in Parameter ControlBlockProperties"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_CONTROL_BLOCK_PRM_BEGIN = {
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockPrmBegin_ERROR_PARAMETER_BLOCK_TYPE]                = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockPrmBegin_ERROR_PARAMETER_LENGTH]                    = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyControlBlockPrmBegin_ERROR_PARAMETER_CONTROL_BLOCK_PROPERTIES]  = "Error in Parameter ControlBlockProperties"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_SUBMODULE_LIST_BLOCK = {
        [PROFINET_IO_CM_ENUMS::FaultySubmoduleListBlock_ERROR_PARAMETER_BLOCK_TYPE]      = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultySubmoduleListBlock_ERROR_PARAMETER_LENGTH]          = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultySubmoduleListBlock_ERROR_PARAMETER_SUBSLOT_NUMBER]  = "Error in Parameter SubslotNumber"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_RELEASE_BLOCK = {
        [PROFINET_IO_CM_ENUMS::FaultyReleaseBlock_ERROR_PARAMETER_BLOCK_TYPE]                = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyReleaseBlock_ERROR_PARAMETER_LENGTH]                    = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyReleaseBlock_ERROR_PARAMETER_CONTROL_BLOCK_PROPERTIES]  = "Error in Parameter ControlBlockProperties"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_AR_BLOCK_RES = {
        [PROFINET_IO_CM_ENUMS::FaultyArBlockRes_ERROR_PARAMETER_BLOCK_TYPE]          = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyArBlockRes_ERROR_PARAMETER_LENGTH]              = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyArBlockRes_ERROR_PARAMTER_RESPONDER_UDPRT_PORT] = "Error in Paramter ResponderUDPRTPort"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_IOCR_BLOCK_RES = {
        [PROFINET_IO_CM_ENUMS::FaultyIocrBlockRes_ERROR_PARAMETER_BLOCK_TYPE]    = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyIocrBlockRes_ERROR_PARAMETER_LENGTH]        = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyIocrBlockRes_ERROR_PARAMETER_FRAME_ID]      = "Error in Parameter FrameId"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_ALARM_CR_BLOCK_RES = {
        [PROFINET_IO_CM_ENUMS::FaultyAlarmCrBlockRes_ERROR_PARAMETER_BLOCK_TYPE]             = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyAlarmCrBlockRes_ERROR_PARAMETER_LENGTH]                 = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyAlarmCrBlockRes_ERROR_PARAMTER_MAX_ALARM_DATA_LENGTH]   = "Error in Paramter MaxAlarmDataLength"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_MODULE_DIFF_BLOCK = {
        [PROFINET_IO_CM_ENUMS::FaultyModuleDiffBlock_ERROR_PARAMETER_BLOCK_TYPE]         = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyModuleDiffBlock_ERROR_PARAMETER_LENGTH]             = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyModuleDiffBlock_ERROR_PARAMETER_SUBMODULE_STATE]    = "Error in Parameter SubmoduleState"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_ARRPC_BLOCK_RES = {
        [PROFINET_IO_CM_ENUMS::FaultyArrpcBlockRes_ERROR_PARAMETER_BLOCK_TYPE]                   = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyArrpcBlockRes_ERROR_PARAMETER_LENGTH]                       = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyArrpcBlockRes_ERROR_PARAMETER_RESPONDER_RPC_SERVER_PORT]    = "Error in Parameter ResponderRPCServerPort"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_AR_SERVER_BLOCK_RES = {
        [PROFINET_IO_CM_ENUMS::FaultyArServerBlockRes_ERROR_PARAMETER_BLOCK_TYPE]                = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyArServerBlockRes_ERROR_PARAMETER_LENGTH]                    = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyArServerBlockRes_ERROR_PARAMETER_CM_RESPONDER_STATION_NAME] = "Error in Parameter CMResponderStationName"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const FAULTY_AR_VENDOR_BLOCK_RES = {
        [PROFINET_IO_CM_ENUMS::FaultyArVendorBlockRes_ERROR_PARAMETER_BLOCK_TYPE]    = "Error in Parameter BlockType",
        [PROFINET_IO_CM_ENUMS::FaultyArVendorBlockRes_ERROR_PARAMETER_LENGTH]        = "Error in Parameter Length",
        [PROFINET_IO_CM_ENUMS::FaultyArVendorBlockRes_ERROR_PARAMETER_API]           = "Error in Parameter API",
        [PROFINET_IO_CM_ENUMS::FaultyArVendorBlockRes_ERROR_PARAMETER_DATA]          = "Error in ParameterData"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const ALARM_ACK_ERROR_CODES = {
        [PROFINET_IO_CM_ENUMS::AlarmAckErrorCodes_ALARM_TYPE_NOT_SUPPORTED]  = "Alarm Type Not Supported",
        [PROFINET_IO_CM_ENUMS::AlarmAckErrorCodes_WRONG_SUBMODULE_STATE]     = "Wrong Submodule State",
        [PROFINET_IO_CM_ENUMS::AlarmAckErrorCodes_IOCARSR_BACKUP]            = "IOCARSR Bakcup - Alarm not executed"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const ALPMI = {
        [PROFINET_IO_CM_ENUMS::Alpmi_INVALID_STATE]  = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Alpmi_WRONG_ACK_PDU]  = "Wrong ACK-PDU",
        [PROFINET_IO_CM_ENUMS::Alpmi_INVALID]        = "Invalid",
        [PROFINET_IO_CM_ENUMS::Alpmi_WRONG_STATE]    = "Wrong state"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const ALPMR = {
        [PROFINET_IO_CM_ENUMS::Alpmr_INVALID_STATE]          = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Alpmr_WRONG_NOTIFICATION_PDU] = "Wrong Notification PDU",
        [PROFINET_IO_CM_ENUMS::Alpmr_INVALID]                = "Invalid",
        [PROFINET_IO_CM_ENUMS::Alpmr_WRONG_STATE]            = "Wrong state"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const RPC = {
        [PROFINET_IO_CM_ENUMS::Rpc_CLRPC_ERR_REJECTED]           = "Endpoint mapper or server did reject the call. For further details see Table 288 and Table 289",
        [PROFINET_IO_CM_ENUMS::Rpc_CLRPC_ERR_FAULTED]            = "Server had a fault while executing the call. For further details see Table 288 and Table 289",
        [PROFINET_IO_CM_ENUMS::Rpc_CLRPC_ERR_TIMEOUT]            = "Endpoint mapper or server did not respond",
        [PROFINET_IO_CM_ENUMS::Rpc_CLRPC_ERR_IN_ARGS]            = "Broadcast or maybe ndr_data too large",
        [PROFINET_IO_CM_ENUMS::Rpc_CLRPC_ERR_OUT_ARGS]           = "Server sent back more than alloc_len",
        [PROFINET_IO_CM_ENUMS::Rpc_CLRPC_ERR_DECODE]             = "Result of endpoint mapper lookup could not be decoded",
        [PROFINET_IO_CM_ENUMS::Rpc_CLRPC_ERR_PNIO_OUT_ARGS]      = "CLRPC_ERR_PNIO_OUT_ARGS",
        [PROFINET_IO_CM_ENUMS::Rpc_CLRPC_ERR_PNIO_APP_TIMEOUT]   = "RPC call was terminated after RPC application timeout"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const APMR = {
        [PROFINET_IO_CM_ENUMS::Apmr_INVALID_STATE]       = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Apmr_LMPM_SIGNALED_ERROR] = "LMPM signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const APMS = {
        [PROFINET_IO_CM_ENUMS::Apms_INVALID_STATE]       = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Apms_LMPM_SIGNALED_ERROR] = "LMPM signaled an error",
        [PROFINET_IO_CM_ENUMS::Apms_TIMEOUT]             = "Timeout"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CPM = {
        [PROFINET_IO_CM_ENUMS::Cpm_INVALID_STATE]    = "Invalid State"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const PPM = {
        [PROFINET_IO_CM_ENUMS::Ppm_INVALID_STATE]    = "Invalid State"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const DCPUCS = {
        [PROFINET_IO_CM_ENUMS::Dcpucs_INVALID_STATE]         = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Dcpucs_LMPM_SIGNALED_ERROR]   = "LMPM signaled an error",
        [PROFINET_IO_CM_ENUMS::Dcpucs_TIMEOUT]               = "Timeout"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const DCPUCR = {
        [PROFINET_IO_CM_ENUMS::Dcpucr_INVALID_STATE]         = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Dcpucr_LMPM_SIGNALED_ERROR]   = "LMPM signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const DCPMCS = {
        [PROFINET_IO_CM_ENUMS::Dcpmcs_INVALID_STATE]         = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Dcpmcs_LMPM_SIGNALED_ERROR]   = "LMPM signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const DCPMCR = {
        [PROFINET_IO_CM_ENUMS::Dcpmcr_INVALID_STATE]         = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Dcpmcr_LMPM_SIGNALED_ERROR]   = "LMPM signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMCTL = {
        [PROFINET_IO_CM_ENUMS::Cmctl_STATE_CONFLICT]     = "State conflict",
        [PROFINET_IO_CM_ENUMS::Cmctl_TIMEOUT]            = "Timeout",
        [PROFINET_IO_CM_ENUMS::Cmctl_NO_DATA_SEND]       = "No data send",
        [PROFINET_IO_CM_ENUMS::Cmctl_OUT_OF_RESOURCE]    = "Out of resource"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CTLDINA = {
        [PROFINET_IO_CM_ENUMS::Ctldina_NO_DCP_ACTIVE]                    = "No DCP active / No Link",
        [PROFINET_IO_CM_ENUMS::Ctldina_DNS_UNKNOWN]                      = "DNS unknown RealStationName",
        [PROFINET_IO_CM_ENUMS::Ctldina_DCP_NO_REAL_STATION_NAME]         = "DCP no RealStationName",
        [PROFINET_IO_CM_ENUMS::Ctldina_DCP_MULTIPLE_REAL_STATION_NAME]   = "DCP multiple RealStationName",
        [PROFINET_IO_CM_ENUMS::Ctldina_DCP_NO_STATION_NAME]              = "DCP no StationName",
        [PROFINET_IO_CM_ENUMS::Ctldina_NO_IP_ADDRESS]                    = "No IP address",
        [PROFINET_IO_CM_ENUMS::Ctldina_DCP_SET_ERROR]                    = "DCP set error",
        [PROFINET_IO_CM_ENUMS::Ctldina_ARP_MULTIPLE_IP_ADDRESSES]        = "ARP multiple IP-Addresses"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CTLSM = {
        [PROFINET_IO_CM_ENUMS::Ctlsm_INVALID_STATE]          = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Ctlsm_CTLSM_SIGNALED_ERROR]   = "CTLSM signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CTLRDI = {
        [PROFINET_IO_CM_ENUMS::Ctlrdi_INVALID_STATE]         = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Ctlrdi_CTLRDI_SIGNALED_ERROR] = "CTLRDI signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CTLRDR = {
        [PROFINET_IO_CM_ENUMS::Ctlrdr_INVALID_STATE]         = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Ctlrdr_CTLRDR_SIGNALED_ERROR] = "CTLRDR signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CTLWRI = {
        [PROFINET_IO_CM_ENUMS::Ctlwri_INVALID_STATE]         = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Ctlwri_CTLWRI_SIGNALED_ERROR] = "CTLWRI signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CTLWRR = {
        [PROFINET_IO_CM_ENUMS::Ctlwrr_INVALID_STATE]         = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Ctlwrr_CTLWRR_SIGNALED_ERROR] = "CTLWRR signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CTLIO = {
        [PROFINET_IO_CM_ENUMS::Ctlio_INVALID_STATE]          = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Ctlio_CTLIO_SIGNALED_ERROR]   = "CTLIO signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CTLSU = {
        [PROFINET_IO_CM_ENUMS::Ctlsu_INVALID_STATE]          = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Ctlsu_AR_PROVIDER_CONSUMER]   = "AR add provider or consumer failed",
        [PROFINET_IO_CM_ENUMS::Ctlsu_AR_ALARM_OPEN_FAILED]   = "AR alarm-open failed",
        [PROFINET_IO_CM_ENUMS::Ctlsu_AR_ALARM_ACK_SEND]      = "AR alarm-ack-send",
        [PROFINET_IO_CM_ENUMS::Ctlsu_AR_ALARM_SEND]          = "AR alarm-send",
        [PROFINET_IO_CM_ENUMS::Ctlsu_AR_ALARM_IND]           = "AR alarm-ind"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CTLRPC = {
        [PROFINET_IO_CM_ENUMS::Ctlrpc_INVALID_STATE]         = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Ctlrpc_CTLRPC_SIGNALED_ERROR] = "CTLRPC signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CTLPBE = {
        [PROFINET_IO_CM_ENUMS::Ctlpbe_INVALID_STATE]         = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Ctlpbe_CTLPBE_SIGNALED_ERROR] = "CTLPBE signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CTLSRL = {
        [PROFINET_IO_CM_ENUMS::Ctlsrl_INVALID_STATE]         = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Ctlsrl_CTLSRL_SIGNALED_ERROR] = "CTLSRL signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMDEV = {
        [PROFINET_IO_CM_ENUMS::Cmdev_STATE_CONFLICT] = "State conflict",
        [PROFINET_IO_CM_ENUMS::Cmdev_RESOURCE]       = "Resource"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMRPC = {
        [PROFINET_IO_CM_ENUMS::Cmrpc_ARGS_LENGTH_INVALID]            = "Argslength invalid",
        [PROFINET_IO_CM_ENUMS::Cmrpc_UNKNOWN_BLOCKS]                 = "Unknown blocks",
        [PROFINET_IO_CM_ENUMS::Cmrpc_IOCR_MISSING]                   = "IOCR missing",
        [PROFINET_IO_CM_ENUMS::Cmrpc_WRONG_BLOCK_COUNT]              = "Wrong block count (for example wrong Alarm CRBlock count)",
        [PROFINET_IO_CM_ENUMS::Cmrpc_OUT_AR_RESOURCE]                = "Out of AR resources",
        [PROFINET_IO_CM_ENUMS::Cmrpc_AR_UUID_UNKOWN]                 = "AR UUID unknown",
        [PROFINET_IO_CM_ENUMS::Cmrpc_STATE_CONFLICT]                 = "State conflict",
        [PROFINET_IO_CM_ENUMS::Cmrpc_OUT_PROVIDER_CONSUMER]          = "Out of Provider, Consumer, or Alarm Resources",
        [PROFINET_IO_CM_ENUMS::Cmrpc_OUT_MEMORY]                     = "Out of memory",
        [PROFINET_IO_CM_ENUMS::Cmrpc_PDEV_ALREADY_OWNED]             = "Pdev Already Owned",
        [PROFINET_IO_CM_ENUMS::Cmrpc_AR_SET_STATE_CONFLICT]          = "ARset State conflict during connection establishment",
        [PROFINET_IO_CM_ENUMS::Cmrpc_AR_SET_PARAMETER_CONFLICT]      = "ARset parameter conflict during connection establishment",
        [PROFINET_IO_CM_ENUMS::Cmrpc_PDEV_PORT_WITHOUT_INTERFACE]    = "Pdev, port(s) without interface"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMSM = {
        [PROFINET_IO_CM_ENUMS::Cmsm_INVALID_STATE]       = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Cmsm_CMSM_SIGNALED_ERROR] = "CMSM signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMRDR = {
        [PROFINET_IO_CM_ENUMS::Cmrdr_INVALID_STATE]          = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Cmrdr_CMRDR_SIGNALED_ERROR]   = "CMRDR signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMWRR = {
        [PROFINET_IO_CM_ENUMS::Cmwrr_INVALID_STATE]          = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Cmwrr_AR_NOT_PRIMARY]         = "AR is not in state Primary. In this case the write of a record is not allowed",
        [PROFINET_IO_CM_ENUMS::Cmwrr_CMWRR_SIGNALED_ERROR]   = "CMWRR signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMIO = {
        [PROFINET_IO_CM_ENUMS::Cmio_INVALID_STATE]       = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Cmio_CMIO_SIGNALED_ERROR] = "CMIO signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMSU = {
        [PROFINET_IO_CM_ENUMS::Cmsu_INVALID_STATE]               = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Cmsu_AR_ADD_PROVIDER_CONSUMER]    = "AR add provider or consumer failed",
        [PROFINET_IO_CM_ENUMS::Cmsu_AR_ALARM_OPEN_FAILED]        = "AR alarm-open failed",
        [PROFINET_IO_CM_ENUMS::Cmsu_AR_ALARM_SEND]               = "AR alarm-send",
        [PROFINET_IO_CM_ENUMS::Cmsu_AR_ALARM_ACK_SEND]           = "AR alarm-ack-send",
        [PROFINET_IO_CM_ENUMS::Cmsu_AR_ALARM_IND]                = "AR alarm-ind"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMINA = {
        [PROFINET_IO_CM_ENUMS::Cmina_INVALID_STATE]          = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Cmina_CMINA_SIGNALED_ERROR]   = "CMINA signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMPBA = {
        [PROFINET_IO_CM_ENUMS::Cmpba_INVALID_STATE]          = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Cmpba_CMPBA_SIGNALED_ERROR]   = "CMPBA signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMSRL = {
        [PROFINET_IO_CM_ENUMS::Cmsrl_INVALID_STATE]          = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Cmsrl_CMSRL_SIGNALED_ERROR]   = "CMSRL signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const CMDMC = {
        [PROFINET_IO_CM_ENUMS::Cmdmc_INVALID_STATE]          = "Invalid State",
        [PROFINET_IO_CM_ENUMS::Cmdmc_CMDMC_SIGNALED_ERROR]   = "CMDMC signaled an error"
    }&default = "unknown";

    # Based on Profinet Fieldbus Specification IEC 61158-6-10:2019 Section 5.2.6.4.3 Table 543
    const RTA_ERR_CLS_PROTOCOL = {
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_ERROR_WITHIN_COORDINATION]      = "Error within the coordination of sequence numbers (RTA_ERR_CODE_SEQ) error",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_INSTANCE_CLOSED]                = "Instance closed (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_OUT_MEMORY]                  = "AR out of memory (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_ADD_PROVIDER_CONSUMER]       = "AR add provider or consumer failed (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_CONSUMER_DHT_EXPIRED]        = "AR consumer DHT expired",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_CMI_TIMEOUT]                 = "AR cmi timeout (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_ALARM_OPEN_FAILED]           = "AR alarm-open failed",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_ALARM_SEND_CNF]              = "AR alarm-send.cnf (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_ALARM_ACK_SEND_CNF]          = "AR alarm-ack-send.cnf (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_ALARM_DATA_LONG]             = "AR alarm data too long (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_ALARM_IND]                   = "AR alarm.ind (err) (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_RPC_CLIENT_CALL]             = "AR rpc-client call.cnf (RTA_ERROR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_ABORT_REQ]                   = "AR abort.req (RTA_ERROR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_RE_RUN]                      = "AR re-run aborts existing (RTA_ERROR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_RELEASE_IND]                 = "AR release.ind received (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_DEVICE_DEACTIVATE]           = "AR device deactivated - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_REMOVED]                     = "AR removed - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_PROTOCOL_VIOLATION]          = "AR protocol violation - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_NAME_RESOLUTION]             = "AR name resolution error - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_RPC_BIND]                    = "AR RPC-Bind error - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_RPC_CONNECT]                 = "AR RPC-Connect error - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_RPC_READ]                    = "AR RPC-Read error - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_RPC_WRITE]                   = "AR RPC-Write error - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_RPC_CONTROL]                 = "AR RPC-Control error - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_FORBIDDEN]                   = "AR forbidden pull or plug after check.rsp and before in-data.ind - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_AP_REMOVED]                  = "AR AP removed - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_LINK_DOWN]                   = "AR link down (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_AR_NOT_REGISTER]                = "AR could not register multicast-mac address - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_NOT_SYNCHRONIZED]               = "Not synchronized (cannot start companion-ar) - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_WRONG_TOPOLOGY]                 = "Wrong topology (cannot start companion-ar) - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_DCP_STATION_NAME]               = "DCP, station-name changed - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_DCP_RESET_FACTORY]              = "DCP reset to factory or factory reset - (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_CANT_START_COMPANION_AR]        = "Can't start companion-AR because a OxLIPP submodule in the first AR... (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_NO_IR_DATA_RECORD]              = "No IRDATA record yet (RTA_ERR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_PDEV_OWNER_LEAVING]             = "Pdev, owner is leaving (RTA_ERROR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_PDEV_NO_PORT_OFFERS]            = "Pdev, no port offers required speed/duplexity (RTA_ERROR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_IP_SUITE_CHANGED]               = "IP-Suite [of the IOC] changed by means of DCP_set (IPParameter) or local engineering (RTA_ERROR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_IOCARSR_RDHT_EXPIRED]           = "IOCARSR RDHT expired (RTA_ERROR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_IOCARSR_PDEV_IMPOSSIBLE]        = "IOCARSR Pdev, parametrization impossible (RTA_ERROR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_REMOTE_APPLICATION_READY]       = "Remote application ready timeout expired (RTA_ERROR_ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_IOCARSR_REDUNDANT_INTERFACE]    = "IOCARSR Redundant interface lost or access to the peripherals impossible (RTA ERROR ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_IOCARSR_MTOT_EXPIRED]           = "IOCARSR MTOT expired (RTA ERROR ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_IOCRSR_AR_PROTOCOL_VIOLATION]   = "IOCARSR AR protocol violation (RTA ERROR ABORT)",
        [PROFINET_IO_CM_ENUMS::RtaErrClsProtocol_PDEV_PLUG_WITHOUT]              = "Pdev, plug port without CombinedObjectContainer (RTA ERROR ABORT)"
    }&default = "unknown";
}