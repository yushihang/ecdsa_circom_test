pragma circom 2.0.2;

include "./circuits/ecdsa.circom";

component main {} = ECDSAPrivToPub(64, 4);
