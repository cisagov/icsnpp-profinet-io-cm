## main.zeek
##
## Zeek script type/record definitions describing the information
## that will be written to the log files.
##
## Author:   Taegan Williams
## Contact:  taegan.williams@inl.gov
##
## Copyright (c) 2024 Battelle Energy Alliance, LLC.  All rights reserved.

module PROFINET_IO_CM;

export {
    redef enum Log::ID += {
        LOG_PROFINET
    };

    global log_profinet: event(rec: Profinet_Header);

    ## Log policies for log filtering
    global log_policy_profinet: Log::PolicyHook;
}

# redefine connection record to contain one of each of the pnio_cm records
redef record connection += {
    profinet_proto: string &optional;
    log_profinet : Profinet_Header &optional;
};

event zeek_init() &priority=5 {
    Log::create_stream(LOG_PROFINET,[$columns=Profinet_Header,
                                     $ev=log_profinet,
                                     $path="profinet_io_cm",
                                     $policy=log_policy_profinet]);
}

function emit_header_log(c: connection) {
    if (! c?$log_profinet )
        return;
    if (c?$profinet_proto)
        c$log_profinet$proto = c$profinet_proto;
    Log::write(PROFINET_IO_CM::LOG_PROFINET, c$log_profinet);
    delete c$log_profinet;
}
