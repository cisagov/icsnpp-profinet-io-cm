# Valid Header
# Byte 0: Version = 0x04

# Byte 1: Packet Type = 0x00-0x0A
# Byte 2: RPC Flags = 0x00-0xFF
# Byte 3: RPC Flags = 0x00-0xFF
# Byte 4: Encoding = (0x00,0x01,0x11,0x10)
# Byte 5: FloatingPoint = [0x00-0x03]
# Byte 6: Serial High 0x00-0xff
# Byte 7: Serial Low 0x00-0xff
# Byte 8-24: UUID 0x00-0xff{16}

# Signature for DCE/RPC with packet type version 4
signature dce_rpc_profinet_io_cm_ip {
    payload /^[\x04][\x00-\x0A][\x00-\xff][\x00-\xff][\x00\x01\x11\x10][\x00-\x03][\x00-\xff][\x00-\xff][\x00-\xff]{16}/
}

signature dce_rpc_profinet_io_cm_message {
    ip-proto == udp
    requires-signature dce_rpc_profinet_io_cm_ip
    enable "spicy_PROFINET_IO_CM"
}