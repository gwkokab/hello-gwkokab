#!/bin/bash

dir=figs_numpyro
mkdir $dir


labels="\$\alpha\$ \$\beta\$ \$\epsilon_\mu\$ \$\epsilon_\sigma\$ \$\ln{\mathcal{R}}\$ \$m_{\mathrm{max}}\$ \$m_{\mathrm{min}}\$"

truths="2.0 0.0 0.0 0.15 5.0 50.0 10.0"

gwk_corner_plot \
	--data "./numpyro_inference/samples.dat" \
	--output $dir/samples.png \
	--bin 30 \
	--scale 2 \
	--show-titles \
	--truths $truths \
	--labels $labels

gwk_chain_plot \
	--data "./numpyro_inference/chain_*.dat" \
	--output $dir/chains.png \
	--width 15 \
	--dpi 200 \
	--alpha 0.5 \
	--labels $labels

gwk_r_hat_plot \
	--chains-regex "./numpyro_inference/chain_*.dat" \
	--output $dir/r_hat.png \
	--labels $labels

gwk_ess_evolution_plot \
	--chains-regex "./numpyro_inference/chain_*.dat" \
	--output $dir/ess_evolution.png \
	--labels $labels
