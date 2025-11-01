#!/bin/bash

dir=figs_flowMC
mkdir $dir

labels="\$\alpha_m\$ \$\ln{\mathcal{R}}\$ \$m_{\mathrm{max}}\$ \$m_{\mathrm{min}}\$ \$\sigma_\epsilon\$"

truths="-1 4.605170186 50.0 10.0 0.15"

gwk_corner_plot \
	--data "./inference/nf_samples_unweighted.dat" \
	--output $dir/nf_samples_unweighted.png \
	--bin 30 \
	--scale 1.5 \
	--show-titles \
	--truths $truths \
	--labels $labels \
	--range -4.5 1.5 \
	--range 4.0 5.6 \
	--range 47.0 55.0 \
	--range 0.0 11.0 \
	--range 0.1 0.18

gwk_chain_plot \
	--data "./inference/*_accs.dat" \
	--output $dir/accs.png \
	--label "training" "production" \
	--title "Local/Global Acceptance Rates" \
	--width 10 \
	--dpi 200 \
	--alpha 0.5

gwk_chain_plot \
	--data "./inference/local_accs.dat" \
	--output $dir/local_accs.png \
	--label "training" "production" \
	--title "Local Acceptance Rates" \
	--width 10 \
	--dpi 200 \
	--alpha 1.0

gwk_chain_plot \
	--data "./inference/global_accs.dat" \
	--output $dir/global_accs.png \
	--label "training" "production" \
	--title "Global Acceptance Rates" \
	--width 10 \
	--dpi 200 \
	--alpha 1.0

gwk_chain_plot \
	--data "./inference/train_chains_*.dat" \
	--output $dir/train_chains.png \
	--title "Training Chains" \
	--width 10 \
	--dpi 200 \
	--alpha 0.5 \
	--labels $labels

gwk_chain_plot \
	--data "./inference/prod_chains_*.dat" \
	--output $dir/prod_chains.png \
	--title "Production Chains" \
	--width 10 \
	--dpi 200 \
	--alpha 0.5 \
	--labels $labels

gwk_chain_plot \
	--data "./inference/log_prob_*.dat" \
	--output $dir/log_prob.png \
	--label "training" "production" \
	--title "log probs" \
	--width 10 \
	--dpi 200

gwk_chain_plot \
	--data "./inference/loss.dat" \
	--output $dir/loss.png \
	--label "nf loss" \
	--title "NF Sampler Loss" \
	--width 7 \
	--height 7 \
	--dpi 200 \
	--alpha 1.0

gwk_r_hat_plot \
	--chains-regex "./inference/prod_chains_*.dat" \
	--output $dir/r_hat_prod.png \
	--labels $labels

gwk_r_hat_plot \
	--chains-regex "./inference/train_chains_*.dat" \
	--output $dir/r_hat_train.png \
	--labels $labels

gwk_ess_plot \
	--train-chain-regex "./inference/train_chains_*.dat" \
	--production-chain-regex "./inference/prod_chains_*.dat" \
	--output $dir/ess.png \
	--width 10 \
	--height 5 \
	--labels $labels

gwk_ess_evolution_plot \
	--chains-regex "./inference/prod_chains_*.dat" \
	--output $dir/ess_evolution_prod.png \
	--labels $labels

gwk_ess_evolution_plot \
	--chains-regex "./inference/train_chains_*.dat" \
	--output $dir/ess_evolution_train.png \
	--labels $labels
