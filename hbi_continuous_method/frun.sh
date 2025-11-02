#!/bin/bash

f_monk_n_pls_m_gs \
	--seed 37 \
	--n-pl 1 \
	--n-g 0 \
	--data-filename "../generating_mock_posterior_estimates/data/realization_0/means_covs.hdf5" \
	--n-samples 100 \
	--minimum-mc-error 0.01 \
	--n-checkpoints 10 \
	--n-max-steps 3 \
	--pmean-json pmean.json \
	--prior-json prior.json \
	--sampler-config flowMC_config.json
