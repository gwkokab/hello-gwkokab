#!/bin/bash

f_sage_ecc_matters \
    --seed $RANDOM \
    --posterior-regex "../generating_mock_posterior_estimates/data/realization_0/posteriors/event_*.dat" \
    --posterior-columns mass_1_source mass_2_source eccentricity \
    --pmean-json pmean.json \
    --prior-json prior.json \
    --sampler-config flowMC_config.json \
    --n-buckets 1