#!/bin/bash
export CUDA_VISIBLE_DEVICES=0
export NPROC=4
export OPENBLAS_NUM_THREADS=1

# JAX Configuration
export JAX_COMPILATION_CACHE_DIR="$HOME/jax_cache"

time genie_n_pls_m_gs \
	--seed 37 \
	--error-size 10000 \
	--num-realizations 1 \
	--model-json model.json \
	--pmean-json pmean.json \
	--err-json err.json \
	--add-truncated-normal-eccentricity
