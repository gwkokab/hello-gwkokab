#!/bin/bash

genie_n_pls_m_gs \
	--seed $RANDOM \
	--add-truncated-normal-eccentricity \
	--error-size 10000 \
	--num-realizations 1 \
	--seed $RANDOM \
	--model-json model.json \
	--pmean-json pmean.json \
	--err-json err.json
