#!/bin/bash
cd ~/.emacs.d
git submodule init
git submodule update
cd ~/.emacs.d/lisps
tar -zxvf ~/.emacs.d/backup/cedet-1.1.tar.gz
mv cedet-1.1 cedet
cd ~/.emacs.d/lisps/cedet
emacs -nw -Q -l "cedet-build.el" -f cedet-build -f save-buffers-kill-terminal
cd ~/.emacs.d
emacs -nw -f xy/emacs-build -f xy/emacs-build -f save-buffers-kill-terminal
emacs -nw -f xy/emacs-build -f xy/emacs-build -f save-buffers-kill-terminal
emacs -nw -f xy/emacs-build -f xy/emacs-build -f save-buffers-kill-terminal
cd ~/.emacs.d/git-lisps/anything-config/
git checkout master
cd ~/.emacs.d/git-lisps/org2blog/
git checkout master
cd ~/.emacs.d
git submodule sync
cd ~/

# org-protocol setup
gconftool-2 -s /desktop/gnome/url-handlers/org-protocol/command '/usr/local/bin/emacsclient %s' --type String
gconftool-2 -s /desktop/gnome/url-handlers/org-protocol/enabled --type Boolean true
