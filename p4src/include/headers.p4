/*************************************************************************
*********************** H E A D E R S  ***********************************
*************************************************************************/
const bit<16> TYPE_IPV4 = 0x0800;

typedef bit<9>  egressSpec_t;
typedef bit<48> macAddr_t;
typedef bit<32> ip4Addr_t;
typedef bit<64> connID_t;

header ethernet_t {
    macAddr_t dstAddr;
    macAddr_t srcAddr;
    bit<16>   etherType;
}

header ipv4_t {
    bit<4>  version;
    bit<4>  ihl;
    bit<8>  diffserv;
    bit<16> totalLen;
    bit<16> identification;
    bit<3>  flags;
    bit<13> fragOffset;
    bit<8>  ttl;
    bit<8>  protocol;
    bit<16> hdrChecksum;
    bit<32> srcAddr;
    bit<32> dstAddr;
}

header udpQuic_t {
    bit<16> srcPort;
    bit<16> dstPort;
    bit<16> length;
    bit<16> checksum;
    bit<1> format;
    bit<7> packetType;
}


header quicShort_t{
    bit<64> connID;
    bit<32> pktNum;
}

header quicLong_t{
    bit<64> connID;
    bit<32> version;
    bit<32> pktNum;
}



struct metadata {
    ip4Addr_t addr;

}

struct headers {
    ethernet_t   ethernet;
    ipv4_t ipv4;
    udpQuic_t udpQuic;
    
    quicShort_t quicShort;
    quicLong_t quicLong;
}
