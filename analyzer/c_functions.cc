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
    //
    // Utility function used to generate unique id associated with the OpcUA logs.  While
    // this id is NOT part of the OpcUA documented spec, we use it to tie nested log files
    // together - e.g. any nested log files such as the status code detail log will contain
    // this id which can be used to reference back to the primary OpcUA log file.
    //
    // The implemenation was taken from: https://lowrey.me/guid-generation-in-c-11/
    //
    std::string generateId() {
        std::stringstream ss;
        for (auto i = 0; i < 9; i++) {
            // Generate a random char
            std::random_device rd;
            std::mt19937 gen(rd());
            std::uniform_int_distribution<> dis(0, 255);
            const auto rc = dis(gen);

            // Hex representaton of random char
            std::stringstream hexstream;
            hexstream << std::hex << rc;
            auto hex = hexstream.str();
            ss << (hex.length() < 2 ? '0' + hex : hex);
        }
        return ss.str();
    }

    std::string bytesToHexString(const char* bytes, size_t size) {
        std::string hex_string;
        const char* hex_chars = "0123456789ABCDEF";

        for (size_t i = 0; i < size; ++i) {
            unsigned char byte = bytes[i];
            hex_string += hex_chars[(byte >> 4) & 0xF];
            hex_string += hex_chars[byte & 0xF];
        }
        return hex_string;
    }

    std::string bytesToUuid(const hilti::rt::Bytes &data1,const hilti::rt::Bytes &data2,const hilti::rt::Bytes &data3,const hilti::rt::Bytes &vendorIdLow,const hilti::rt::Bytes &vendorIdHigh,const hilti::rt::Bytes &deviceIdLow,const hilti::rt::Bytes &deviceIdHigh,const hilti::rt::Bytes &instanceLow,const hilti::rt::Bytes &instanceHigh,const hilti::rt::Bytes &rpcObjectUUID){
        std::string result = "";
        result += bytesToHexString(data1.data(),4);
        result += "-";
        result += bytesToHexString(data2.data(),2);
        result += "-";
        result += bytesToHexString(data3.data(),2);
        result += "-";
        result += bytesToHexString(vendorIdLow.data(),1);
        result += bytesToHexString(vendorIdHigh.data(),1);
        result += "-";
        result += bytesToHexString(deviceIdLow.data(),1);
        result += bytesToHexString(deviceIdHigh.data(),1);
        result += bytesToHexString(instanceLow.data(),1);
        result += bytesToHexString(instanceHigh.data(),1);
        result += bytesToHexString(rpcObjectUUID.data(),2);
        return result;
    }

    std::string macAddress(const hilti::rt::Bytes &byte_string) {
        std::string mac_string = "";
        mac_string = bytesToHexString(byte_string.data(),6);
        mac_string.insert(2,":");
        mac_string.insert(5,":");
        mac_string.insert(8,":");
        mac_string.insert(11,":");
        mac_string.insert(14,":");
        return mac_string;
    }

    int hexToInt(std::string hexString) {
        int result = 0;
        for (char c : hexString) {
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

    std::string hexToAscii(std::string hexString) {
        std::string result = "";
        for (unsigned int i = 0; i < hexString.length(); i += 2) {
            std::string byteString = hexString.substr(i, 2);
            char byte = (char) strtol(byteString.c_str(), NULL, 16);
            result += byte;
        }
        return result;
    }

    std::string bytesToString(const hilti::rt::Bytes& byteString) {
        std::string hexString = "";
        hexString = bytesToHexString(byteString.data(),byteString.size());
        return hexToAscii(hexString);
    }
}
