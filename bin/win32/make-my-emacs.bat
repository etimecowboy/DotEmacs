cd ~/.emacs.d
git submodule init
git submodule update
cd ~/.emacs.d/lisps
# tar -zxvf ~/.emacs.d/backup/cedet-1.1.tar.gz
# cd ~/.emacs.d/lisps/cedet-1.1
# emacs -nw -Q -l "cedet-build.el" -f cedet-build -f save-buffers-kill-terminal
# cd ~/.emacs.d
# git submodule sync
cd ~/
emacs -f xy/emacs-build -f xy/emacs-build -f save-buffers-kill-terminal
emacs -f xy/emacs-build -f xy/emacs-build -f save-buffers-kill-terminal
