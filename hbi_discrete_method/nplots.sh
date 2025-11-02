#!/bin/bash

dir=figs_numpyro
mkdir $dir

labels="\$\alpha_m\$ \$\sigma_\epsilon\$ \$\ln{\mathcal{R}}\$ \$m_{\mathrm{max}}\$ \$m_{\mathrm{min}}\$"

truths="-1 0.15 4.605170186 50.0 10.0"

gwk_corner_plot \
	--data "./inference/samples.dat" \
	--output $dir/samples.png \
	--bin 30 \
	--scale 2 \
	--show-titles \
	--truths $truths \
	--labels $labels \

gwk_chain_plot \
	--data "./inference/chain_*.dat" \
	--output $dir/chains.png \
	--width 15 \
	--dpi 200 \
	--alpha 0.5 \
	--labels $labels

gwk_r_hat_plot \
	--chains-regex "./inference/chain_*.dat" \
	--output $dir/r_hat.png \
	--labels $labels

gwk_ess_evolution_plot \
	--chains-regex "./inference/chain_*.dat" \
	--output $dir/ess_evolution.png \
	--labels $labels
