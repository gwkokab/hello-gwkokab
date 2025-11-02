#!/bin/bash

f_sage_n_pls_m_gs \
	--seed 37 \
	--n-pl 1 \
	--n-g 0 \
	--posterior-regex "../generating_mock_posterior_estimates/data/realization_0/posteriors/event_*.dat" \
	--posterior-columns mass_1_source mass_2_source \
	--pmean-json pmean.json \
	--prior-json prior.json \
	--sampler-config flowMC_config.json \
	--n-buckets 10
