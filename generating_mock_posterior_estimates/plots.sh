#!/bin/bash

dir=figs
mkdir $dir

gwk_scatter2d \
	--data data/realization_0/injections.dat \
	--output $dir/m1m2_inj_0.png \
	--x-value-column-name mass_1_source \
	--y-value-column-name mass_2_source \
	--xlabel "\$m_1 [M_\odot]\$" \
	--ylabel "\$m_2 [M_\odot]\$" \
	--use-latex \
	--dpi 200

gwk_batch_scatter2d \
	--data "data/realization_0/posteriors/*.dat" \
	--output $dir/m1m2_batch_0.png \
	--x-value-column-name mass_1_source \
	--y-value-column-name mass_2_source \
	--xlabel "\$m_1 [M_\odot]\$" \
	--ylabel "\$m_2 [M_\odot]\$" \
	--use-latex \
	--alpha 0.1 \
	--dpi 200

gwk_batch_scatter3d \
        --data "data/realization_0/posteriors/*.dat" \
        --output $dir/m1m2ecc_batch_0.png \
        --x-value-column-name mass_1_source \
        --y-value-column-name mass_2_source \
	--z-value-column-name eccentricity \
        --xlabel "\$m_1 [M_\odot]\$" \
        --ylabel "\$m_2 [M_\odot]\$" \
	--zlabel "\$\sigma_\epsilon\$" \
        --use-latex \
        --alpha 0.1 \
        --dpi 200
