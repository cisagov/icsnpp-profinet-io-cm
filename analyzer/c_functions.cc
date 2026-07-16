// c_functions.cc
//
// C functions for unique data types
// 
//
// Author:   Taegan Williams
// Contact:  taegan.williams@inl.gov
//
// Copyright (c) 2024 Battelle Energy Alliance, LLC.  All rights reserved.

#include <string>
#include <iostream>
#include <cstdint>
#include <random>
#include <hilti/rt/libhilti.h>
#include <spicy/rt/libspicy.h>

namespace c_functions
{
    // Spicy exports its version in `PROJECT_VERSION_NUMBER`.
    // hilti::rt::String was introduced in HILTI 1.16 (Zeek 8.2.1); on
    // earlier versions (e.g. Zeek 8.0.9 / HILTI 1.14.2) it doesn't exist,
    // so fall back to std::string there.
    //
    // Note: unlike std::string, hilti::rt::String on 8.2+ does NOT
    // publicly expose insert(), substr(), length(), c_str(), or
    // operator[] -- it privately inherits std::string, exposing only
    // construction, operator=, str(), the string_view conversion, and
    // operator+=. So all string manipulation below stays on
    // std::string internally; SpicyString is only touched at function
    // parameter/return boundaries.
#if PROJECT_VERSION_NUMBER >= 11600
    using SpicyString = hilti::rt::String;
#else
    using SpicyString = std::string;
#endif

    // Convert a SpicyString parameter/result to a std::string we can
    // freely manipulate.
    static inline std::string toStdString(const SpicyString& s) {
        return std::string(std::string_view(s));
    }

    //
    // Utility function used to generate unique id associated with the OpcUA logs.  While
    // this id is NOT part of the OpcUA documented spec, we use it to tie nested log files
    // together - e.g. any nested log files such as the status code detail log will contain
    // this id which can be used to reference back to the primary OpcUA log file.
    //
    // The implemenation was taken from: https://lowrey.me/guid-generation-in-c-11/
    //
    SpicyString generateId() {
        // Constructed once (function-static) rather than per-iteration:
        // random_device is a seed source, not a PRNG, and re-seeding a
        // fresh generator every iteration is both slow (repeated entropy
        // syscalls) and risks producing identical bytes if random_device
        // falls back to a deterministic sequence on a given platform.
        // Zeek's packet-analysis path is single-threaded, so static
        // (rather than thread_local) is safe here.
        static std::random_device rd;
        static std::mt19937 gen(rd());
        static std::uniform_int_distribution<> dis(0, 255);

        std::stringstream ss;
        for (auto i = 0; i < 9; i++) {
            const auto rc = dis(gen);

            // Hex representaton of random char
            std::stringstream hexstream;
            hexstream << std::hex << rc;
            auto hex = hexstream.str();
            ss << (hex.length() < 2 ? '0' + hex : hex);
        }
        std::string result = ss.str();
        return {result};
    }

    SpicyString bytesToHexString(const char* bytes, size_t size) {
        std::string hex_string;
        const char* hex_chars = "0123456789ABCDEF";

        for (size_t i = 0; i < size; ++i) {
            unsigned char byte = bytes[i];
            hex_string += hex_chars[(byte >> 4) & 0xF];
            hex_string += hex_chars[byte & 0xF];
        }
        return {hex_string};
    }

    SpicyString bytesToUuid(const hilti::rt::Bytes &data1,const hilti::rt::Bytes &data2,const hilti::rt::Bytes &data3,const hilti::rt::Bytes &vendorIdLow,const hilti::rt::Bytes &vendorIdHigh,const hilti::rt::Bytes &deviceIdLow,const hilti::rt::Bytes &deviceIdHigh,const hilti::rt::Bytes &instanceLow,const hilti::rt::Bytes &instanceHigh,const hilti::rt::Bytes &rpcObjectUUID){
        std::string result;
        result += toStdString(bytesToHexString(data1.data(),4));
        result += "-";
        result += toStdString(bytesToHexString(data2.data(),2));
        result += "-";
        result += toStdString(bytesToHexString(data3.data(),2));
        result += "-";
        result += toStdString(bytesToHexString(vendorIdLow.data(),1));
        result += toStdString(bytesToHexString(vendorIdHigh.data(),1));
        result += "-";
        result += toStdString(bytesToHexString(deviceIdLow.data(),1));
        result += toStdString(bytesToHexString(deviceIdHigh.data(),1));
        result += toStdString(bytesToHexString(instanceLow.data(),1));
        result += toStdString(bytesToHexString(instanceHigh.data(),1));
        result += toStdString(bytesToHexString(rpcObjectUUID.data(),2));
        return {result};
    }

    SpicyString macAddress(const hilti::rt::Bytes &byte_string) {
        std::string mac_string = toStdString(bytesToHexString(byte_string.data(),6));
        mac_string.insert(2,":");
        mac_string.insert(5,":");
        mac_string.insert(8,":");
        mac_string.insert(11,":");
        mac_string.insert(14,":");
        return {mac_string};
    }

    int hexToInt(SpicyString hexString) {
        std::string s = toStdString(hexString);
        int result = 0;
        for (char c : s) {
            result *= 16;
            if (c >= '0' && c <= '9') {
                result += c - '0';
            } else if (c >= 'a' && c <= 'f') {
                result += c - 'a' + 10;
            } else if (c >= 'A' && c <= 'F') {
                result += c - 'A' + 10;
            } else {
                return 0;
            }
        }
        return result;
    }

    SpicyString hexToAscii(SpicyString hexString) {
        std::string s = toStdString(hexString);
        std::string result;
        for (unsigned int i = 0; i < s.length(); i += 2) {
            std::string byteString = s.substr(i, 2);
            char byte = (char) strtol(byteString.c_str(), NULL, 16);
            result += byte;
        }
        return {result};
    }

    SpicyString bytesToString(const hilti::rt::Bytes& byteString) {
        std::string hexString = toStdString(bytesToHexString(byteString.data(),byteString.size()));
        return hexToAscii(SpicyString(hexString));
    }
}
