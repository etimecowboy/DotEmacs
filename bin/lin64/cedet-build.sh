#!/bin/bash
cd ~/.emacs.d/lisps
tar -zxvf ~/.emacs.d/backup/cedet-8112.tar.gz
cd ~/.emacs.d/lisps/cedet
emacs -nw -Q -l "cedet-build.el" -f cedet-build
