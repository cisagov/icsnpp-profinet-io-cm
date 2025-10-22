# Build Status

| Source       | `main` Status | `main` Timestamp |
|--------------|--------------|------------|
| **CISAGOV** | ![Build Status](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fcisagov%2Ficsnpp-profinet-io-cm%2Fcommits%2Fmain%2Fstatus&query=state&label=build) | ![Last Build](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fcisagov%2Ficsnpp-profinet-io-cm%2Fcommits%2Fmain%2Fstatus&query=statuses[0].updated_at&label=last%20build&color=lightgrey) |
| **Development** | ![Build Status](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fparsitects%2Ficsnpp-profinet-io-cm%2Fcommits%2Fmain%2Fstatus&query=state&label=build) | ![Last Build](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fparsitects%2Ficsnpp-profinet-io-cm%2Fcommits%2Fmain%2Fstatus&query=statuses[0].updated_at&label=last%20build&color=lightgrey) |

# ICSNPP-PROFINET-IO-CM

Industrial Control Systems Network Protocol Parsers (ICSNPP) - PROFINET-IO-CM (Profinet I/O Context Manager) using DCE/RPC over UDP.

## Overview

ICSNPP-PROFINET-IO-CM is a Zeek plugin (written in [Spicy](https://docs.zeek.org/projects/spicy/en/latest/)) for parsing and logging fields used by the Profinet I/O Context Manager protocol from Real Automation, (as defined in Profinet Fieldbus Specification IEC 61158-6-10:2019) defining the configuration of Application Relations (AR) and Communication Relations (CR) between a controller and an I/O device.

This parser produces the following log files, defined in [analyzer/main.zeek](analyzer/main.zeek):

* `profinet_io_cm.log`

For additional information on this log file, see the *Logging Capabilities* section below.

## Installation

### Package Manager

This script is available as a package for [Zeek Package Manager](https://docs.zeek.org/projects/package-manager/en/stable/index.html). Zeek includes Spicy support by default as of [v6.0.0](https://github.com/zeek/zeek/releases/tag/v6.0.0).

```bash
$ zkg refresh
$ zkg install icsnpp-profinet-io-cm
```

If this package is installed from ZKG, it will be added to the available plugins. This can be tested by running `zeek -NN`. If installed correctly, users will see `ANALYZER_SPICY_PROFINET_IO_CM` under the list of `Zeek::Spicy` analyzers.

If users have ZKG configured to load packages (see `@load packages` in the [ZKG Quickstart Guide](https://docs.zeek.org/projects/package-manager/en/stable/quickstart.html)), this plugin and these scripts will automatically be loaded and ready to go.

## Installation (via git clone)

```bash
git clone https://github.com/cisagov/icsnpp-profinet-io-cm.git
cd icsnpp-profinet-io-cm
mkdir build && cd build && cmake .. && make && cd ..
```

From here you can install the locally built files through `zkg install ./icsnpp-profinet-io-cm` and run it like you would normally.

Or you can manually run the parser without installing it: `zeek ./build/profinet_io_cm.hlto ./analyzer/__load__.zeek  -Cr <pcap>`

## Logging Capabilities

### Profinet I/O CM DCE/RPC Log (profinet_io_cm.log)

#### Overview

This log summarizes, by connection, DCE/RPC frames transmitted using version 4 to `profinet_io_cm.log`.

#### Fields Captured

| Field                          | Type            | Description                                                                    |
| -------------------------------|-----------------|--------------------------------------------------------------------------------|
| ts                             | time            | Timestamp (network time)                                                       |
| uid                            | string          | Uinque ID for this connection                                                  |
| id                             | conn_id         | Default Zeek connection info (IP Addresses, Ports, etc.)                       |
| source_h                       | address         | Source IP address (see *Source and Destination Fields*)                        |
| source_p                       | port            | Source Port (see *Source and Destination Fields*)                              |
| destination_h                  | address         | Destination IP address (see *Source and Destination Fields*)                   |
| destination_p                  | port            | Destination Port (see *Source and Destination Fields*)                         |
| proto                          | string          | Transport protocol                                                             |
| rpc_version                    | count           | Used RPC version                                                               |
| packet_type                    | string          | Packet Type: Request, Response, Fault, etc.                                    |
| reserved_for_impl_1            | bool            | Flag 1 Bit 0 Reserved for implementation                                       |
| last_fragment                  | bool            | Flag 1 Bit 1 Last Fragment                                                     |
| fragment                       | bool            | Flag 1 Bit 2 Fragment                                                          |
| no_fragment_requested          | bool            | Flag 1 Bit 3 No fragment acknowledge requested                                 |
| maybe                          | bool            | Flag 1 Bit 4 Maybe                                                             |
| idempotent                     | bool            | Flag 1 Bit 5 Idempotent                                                        |
| broadcast                      | bool            | Flag 1 Bit 6 Broadcast                                                         |
| reserved_for_impl_2            | bool            | Flag 1 Bit 7 Reserved for implementation                                       |
| cancel_was_pending_at_call_end | bool            | Flag 2 Bit 1 Cancel was pending at call end                                    |
| integer_encoding               | string          | Integer encoding: Big Endian or Little Endian                                  |
| character_encoding             | string          | Character encoding: ASCII, EBCDIC                                              |
| floating_point_encoding        | string          | Floating point representations: IEEE, VAX, CRAY, etc.                          |
| serial_high                    | count           | The high octet of the fragment number of the call                              |
| object_uuid                    | string          | Object instance within a physical device                                       |
| interface_uuid                 | string          | Identifies the interface of an IO device, controller, etc.                     |
| activity_uuid                  | string          | Identifies communication relationships                                         |
| server_boot_time               | count           | Server boot time                                                               |
| interface_vers_major           | count           | Interface version major                                                        |
| interface_vers_minor           | count           | Interface version minor                                                        |
| sequence_num                   | count           | Used with activity_UUID to uniquely identify a RPC call.                       |
| operation_num                  | string          | Operation number identifies the PNIO service supported by the PNIO interfaces. |
| interface_hint                 | count           | Interface hint                                                                 |
| activity_hint                  | count           | Activity hint                                                                  |
| len_of_body                    | count           | Length of body set to the number of octets of NDRDdata in the current frame.   |
| fragment_num                   | count           | Fragment number set to the number of the current fragment.                     |
| auth_protocol                  | count           | Authentication protocol - set to 0 for no authentication                       |
| serial_low                     | count           | The low octet of the fragment number of the call                               |
| vers_fack                      | string          | Version Fack                                                                   |
| window_size                    | count           | Window size                                                                    |
| max_tsdu                       | count           | Maximum Tsdu                                                                   |
| max_frag_size                  | count           | Maximum fragment size                                                          |
| serial_number                  | count           | Serial number                                                                  |
| sel_ack_len                    | count           | Selective ACK length                                                           |
| array_of_sel_ack               | vector of count | Array of selective ACK                                                         |

### Source and Destination Fields

Zeek's typical behavior is to focus on and log packets from the originator and not log packets from the responder. However, most ICS protocols contain useful information in the responses, so the ICSNPP parsers log both originator and responses packets. Zeek's default behavior, defined in its `id` struct, is to never switch these originator/responder roles which leads to inconsistencies and inaccuracies when looking at ICS traffic that logs responses.

The default Zeek `id` struct contains the following logged fields:
* id.orig_h (Original Originator/Source Host)
* id.orig_p (Original Originator/Source Port)
* id.resp_h (Original Responder/Destination Host)
* id.resp_p (Original Responder/Destination Port)

To not break existing platforms that utilize the default `id` struct functionality, the ICSNPP team has added four new fields to each log file instead of changing Zeek's default behavior. These four new fields provide the accurate information regarding source and destination IP addresses and ports:
* source_h (True Originator/Source Host)
* source_p (True Originator/Source Port)
* destination_h (True Responder/Destination Host)
* destination_p (True Responder/Destination Port)

## Coverage
Roughly 10% of the defined protocol specification is covered by this parser.  The intent of the parser is to provide an intiial implementation that covers primarily header information to inlucde the transport protocol, RPC version, packet type, etc.  See the [Logging Capabilities](#logging-capabilities) section for detailed information of the parser coverage.

## ICSNPP Packages

All ICSNPP Packages:
* [ICSNPP](https://github.com/cisagov/icsnpp)

### License

Copyright 2024 Battelle Energy Alliance, LLC. Released under the terms of the 3-Clause BSD License (see [`LICENSE.txt`](./LICENSE.txt)).

