#!/bin/bash

genie_n_pls_m_gs \
	--seed 37 \
	--error-size 10000 \
	--num-realizations 1 \
	--model-json model.json \
	--pmean-json pmean.json \
	--err-json err.json
