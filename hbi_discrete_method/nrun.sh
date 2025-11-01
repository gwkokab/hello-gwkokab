#!/bin/bash

n_sage_n_pls_m_gs \
	--seed $RANDOM \
	--n-pl 1 \
	--n-g 0 \
	--add-truncated-normal-eccentricity \
	--posterior-regex "../generating_mock_posterior_estimates/data/realization_0/posteriors/event_*.dat" \
	--posterior-columns mass_1_source mass_2_source eccentricity \
	--pmean-json pmean.json \
	--prior-json prior.json \
	--sampler-config numpyro_config.json \
	--n-buckets 10
