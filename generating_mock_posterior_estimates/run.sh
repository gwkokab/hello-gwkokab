#!/bin/bash

genie_ecc_matters \
    --error-size 2000 \
    --num-realizations 1 \
    --seed $RANDOM \
    --model-json model.json \
    --pmean-json pmean.json \
    --err-json err.json