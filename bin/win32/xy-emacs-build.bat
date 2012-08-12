cd %HOME%/.emacs.d
git submodule init
git submodule update
cd  %HOME%/.emacs.d/git-lisps/o-blog/
git submodule init
git submodule update
cd %HOME%/.emacs.d/lisps
tar -zxvf %HOME%/.emacs.d/backup/cedet-1.1.tar.gz
mv cedet-1.1 cedet
cd %HOME%/.emacs.d/lisps/cedet
emacs -nw -Q -l "cedet-build.el" -f cedet-build -f save-buffers-kill-terminal
cd %HOME%/.emacs.d
emacs -nw -f xy/emacs-build -f xy/emacs-build -f save-buffers-kill-terminal
emacs -nw -f xy/emacs-build -f xy/emacs-build -f save-buffers-kill-terminal
emacs -nw -f xy/emacs-build -f xy/emacs-build -f save-buffers-kill-terminal
cd %HOME%/.emacs.d/git-lisps/anything-config/
git checkout master
cd %HOME%/.emacs.d/git-lisps/o-blog/
git checkout master
cd %HOME%/.emacs.d/git-lisps/o-blog/bootstrap/
git checkout master
cd %HOME%/.emacs.d/git-lisps/o-blog/Font-Awesome/
git checkout master
cd %HOME%/.emacs.d/git-lisps/o-blog/less.js/
git checkout master
cd %HOME%/.emacs.d/git-lisps/org2blog/
git checkout master
cd %HOME%/.emacs.d
git submodule sync
cd %HOME%/
