#!/bin/zsh

#brew install coreutils

#zsh ../build.zsh 

rm -rf multiplier2_js
rm -rf multiplier2_cpp
rm -rf output
mkdir output
if [ -n "$ZSH_VERSION" ]; then
    echo "Script is running in Zsh"
else
    echo "Please run this script in Zsh. \"zsh build.zsh\""
    exit 1
fi
source ~/.zshrc
nvm install v18.19.0
nvm use v18.19.0

time circom multiplier2.circom --r1cs --wasm --sym --c

mv *.r1cs output/
mv *.sym output/






time snarkjs groth16 setup output/multiplier2.r1cs ../tau/public/pot_final.ptau output/multiplier2_0000.zkey 

echo "4668c3e48205b158d4a40035b2260b4678137c5209156f6fd7ab8a42c9848648" | time snarkjs zkey contribute output/multiplier2_0000.zkey output/multiplier2_0001.zkey --name="1st Contributor Name" -v

time snarkjs zkey export verificationkey output/multiplier2_0001.zkey output/verification_key.json

start_time=$(gdate +%s.%N)
echo "prove..."
time node multiplier2_js/generate_witness.js multiplier2_js/multiplier2.wasm input.json output/witness.wtns
time snarkjs groth16 prove output/multiplier2_0001.zkey output/witness.wtns output/proof.json output/public.json
end_time=$(gdate +%s.%N)
elapsed_time=$((end_time - start_time))
echo "\n==== Elapsed time: $elapsed_time seconds ====\n"

echo "verify..."
time snarkjs groth16 verify output/verification_key.json output/public.json output/proof.json