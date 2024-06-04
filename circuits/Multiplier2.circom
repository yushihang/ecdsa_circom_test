pragma circom 2.0.2;

include "./circuits/eth_addr.circom";

component main  = ECDSAPrivToPubNew(64, 4);
