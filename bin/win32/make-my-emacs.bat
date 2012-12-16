REM start bash shell before your run
cd ~/.emacs.d
git submodule init
git submodule update
cd ~/.emacs.d/lisps
tar -zxvf ~/.emacs.d/backup/cedet-1.1.tar.gz
mv cedet-1.1 cedet
cd ~/.emacs.d/lisps/cedet
emacs -nw -Q -l "cedet-build.el" -f cedet-build -f save-buffers-kill-terminal
cd ~/.emacs.d
cd ~/.emacs.d/git-lisps/anything-config/
git checkout master
cd ~/.emacs.d
git submodule sync
cd ~/
emacs -f xy/emacs-build -f xy/emacs-build -f save-buffers-kill-terminal
emacs -f xy/emacs-build -f xy/emacs-build -f save-buffers-kill-terminal
cd ~/.emacs.d/git-lisps/anything-config/
git checkout master
cd ~/
