/* -*- P4_16 -*- */
#include <core.p4>
#include <v1model.p4>

/*************************************************************************
*********************** H E A D E R S  ***********************************
*************************************************************************/
#include "include/headers.p4"
#define BUCKET_SIZE 6
#define COUNTER_WIDTH 16

/*************************************************************************
*********************** P A R S E R  ***********************************
*************************************************************************/
#include "include/parsers.p4"



/*************************************************************************
************   C H E C K S U M    V E R I F I C A T I O N   *************
*************************************************************************/

control MyVerifyChecksum(inout headers hdr, inout metadata meta) {
    apply {  }
}


/*************************************************************************
**************  I N G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control MyIngress(inout headers hdr,
                  inout metadata meta,
                  inout standard_metadata_t standard_metadata) {
    
    bit<32> virtual_ip = 0x0a0000fe;
    bit<48> client_mac = 0x00000a000001;

    //Counter for the WRR
    register<bit<COUNTER_WIDTH>>(1) bucket_counter;

    action fwd_to_server(bit<9> egress_port, bit<32> dip, bit<48> dmac) {
        hdr.ipv4.dstAddr = dip;
        hdr.ethernet.dstAddr = dmac;
        standard_metadata.egress_spec = egress_port;
    }
/*
    action fwd_to_client(bit<9> egress_port, bit<32> sip, bit<48> smac) {
        hdr.ipv4.srcAddr = virtual_ip;
        hdr.ethernet.dstAddr = client_mac;
        standard_metadata.egress_spec = egress_port;
    }
*/
    table get_server_from_bucket {
        key = {
            meta.bucket_id: exact;
        }
        actions = {
            fwd_to_server;
        }
        size = 1024;
   }

   table get_server_from_id_long_header {
        key = {
            hdr.quicLong.server_id: exact;
        }
        actions = {
            fwd_to_server;
        }
        size = 1024;
   }

   table get_server_from_id_short_header {
        key = {
            hdr.quicShort.server_id: exact;
        }
        actions = {
            fwd_to_server;
        }
        size = 1024;
   }
/*
   table get_client {
        key = {
            hdr.quicLong.server_id: exact;
        }
        actions = {
            fwd_to_client;
        }
        size = 1024;
   }
*/


    apply {
        if(hdr.ipv4.dstAddr == virtual_ip) {    //packet from client
            if(hdr.udpQuic.pkt_type == 0){      //Initial, or can check the first byte of dst_cid
                bucket_counter.read(meta.bucket_id, 0);
                
                // we use the bucket index to find the server
                get_server_from_bucket.apply();
              
                // new connection, update counter
                meta.bucket_id = meta.bucket_id + 1;

                //Do the wrapping
                if (meta.bucket_id == BUCKET_SIZE) {
                    meta.bucket_id = 0;
                }
                bucket_counter.write(0, meta.bucket_id);
            }
            else {                               //non-Initial, the dcid must have a server_id
                if (hdr.udpQuic.hdr_type == 1){
                    get_server_from_id_long_header.apply();
                }
                else{
                    get_server_from_id_short_header.apply();
                }
            }
        }

        else {                                   //packet from servers. Just forward to the client.
            hdr.ipv4.srcAddr = virtual_ip;
            hdr.ethernet.dstAddr = client_mac;
            standard_metadata.egress_spec = (bit<9>)1;
        }
    }

}


/*************************************************************************
****************  E G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control MyEgress(inout headers hdr,
                 inout metadata meta,
                 inout standard_metadata_t standard_metadata) {


    apply {  }
}

/*************************************************************************
*************   C H E C K S U M    C O M P U T A T I O N   **************
*************************************************************************/

control MyComputeChecksum(inout headers hdr, inout metadata meta) {
     apply {

    }
}


/*************************************************************************
***********************  S W I T C H  *******************************
*************************************************************************/

//switch architecture
V1Switch(
MyParser(),
MyVerifyChecksum(),
MyIngress(),
MyEgress(),
MyComputeChecksum(),
MyDeparser()
) main;