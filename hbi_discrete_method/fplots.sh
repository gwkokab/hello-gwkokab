#!/bin/bash

dir=figs_flowMC
mkdir $dir
labels="\$\alpha\$ \$\beta\$ \$\epsilon_\mu\$ \$\epsilon_\sigma\$ \$\ln{\mathcal{R}}\$ \$m_{\mathrm{max}}\$ \$m_{\mathrm{min}}\$"

truths="2.0 0.0 0.0 0.15 5.0 50.0 10.0"

gwk_corner_plot \
	--data "./flowMC_inference/samples.dat" \
	--output $dir/nf_samples_unweighted.png \
	--bin 30 \
	--scale 1.5 \
	--show-titles \
	--truths $truths \
	--labels $labels

gwk_chain_plot \
	--data "./flowMC_inference/*_accs.dat" \
	--output $dir/accs.png \
	--label "training" "production" \
	--title "Local/Global Acceptance Rates" \
	--width 10 \
	--dpi 200 \
	--alpha 0.5

gwk_chain_plot \
	--data "./flowMC_inference/local_accs.dat" \
	--output $dir/local_accs.png \
	--label "training" "production" \
	--title "Local Acceptance Rates" \
	--width 10 \
	--dpi 200 \
	--alpha 1.0

gwk_chain_plot \
	--data "./flowMC_inference/global_accs.dat" \
	--output $dir/global_accs.png \
	--label "training" "production" \
	--title "Global Acceptance Rates" \
	--width 10 \
	--dpi 200 \
	--alpha 1.0

gwk_chain_plot \
	--data "./flowMC_inference/train_chains_*.dat" \
	--output $dir/train_chains.png \
	--title "Training Chains" \
	--width 10 \
	--dpi 200 \
	--alpha 0.5 \
	--labels $labels

gwk_chain_plot \
	--data "./flowMC_inference/prod_chains_*.dat" \
	--output $dir/prod_chains.png \
	--title "Production Chains" \
	--width 10 \
	--dpi 200 \
	--alpha 0.5 \
	--labels $labels

gwk_chain_plot \
	--data "./flowMC_inference/log_prob_*.dat" \
	--output $dir/log_prob.png \
	--label "training" "production" \
	--title "log probs" \
	--width 10 \
	--dpi 200

gwk_chain_plot \
	--data "./flowMC_inference/loss.dat" \
	--output $dir/loss.png \
	--label "nf loss" \
	--title "NF Sampler Loss" \
	--width 7 \
	--height 7 \
	--dpi 200 \
	--alpha 1.0

gwk_r_hat_plot \
	--chains-regex "./flowMC_inference/prod_chains_*.dat" \
	--output $dir/r_hat_prod.png \
	--labels $labels \
	--n-split 20

gwk_r_hat_plot \
	--chains-regex "./flowMC_inference/train_chains_*.dat" \
	--output $dir/r_hat_train.png \
	--labels $labels \
	--n-split 20

gwk_ess_plot \
	--train-chain-regex "./flowMC_inference/train_chains_*.dat" \
	--production-chain-regex "./flowMC_inference/prod_chains_*.dat" \
	--output $dir/ess.png \
	--width 10 \
	--height 5 \
	--labels $labels

gwk_ess_evolution_plot \
	--chains-regex "./flowMC_inference/prod_chains_*.dat" \
	--output $dir/ess_evolution_prod.png \
	--labels $labels \
	--n-split 20

gwk_ess_evolution_plot \
	--chains-regex "./flowMC_inference/train_chains_*.dat" \
	--output $dir/ess_evolution_train.png \
	--labels $labels \
	--n-split 20
