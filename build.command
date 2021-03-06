#!/bin/bash

rm bin/*.*

cp -r res bin/
cp -r img bin/
cp -r src bin/

cp sty/* bin/

cp histogram.gnu bin/
cp fov_rt_et.* bin/

cd bin/

gnuplot -e "arg_data='res/foveated_sum';arg_terminal='epslatex';arg_output='gnu_foveated.tex'" histogram.gnu

gnuplot -e "arg_data='res/non-foveated_sum';arg_terminal='epslatex';arg_output='gnu_non-foveated.tex'" histogram.gnu

pdflatex fov_rt_et
bibtex fov_rt_et
pdflatex fov_rt_et
pdflatex fov_rt_et

cp fov_rt_et.pdf ../
