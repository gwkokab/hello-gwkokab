#!/bin/bash

source ../env.sh 

time taskset -c 1-30 genie_n_pls_m_gs \
	--seed 12949 \
	--error-size 10000 \
	--num-realizations 1 \
	--model-json model.json \
	--pmean-json pmean.json \
	--err-json err.json \
	--add-truncated-normal-eccentricity
