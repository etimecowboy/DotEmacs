cd ~/.emacs.d/emacswiki
git checkout master
cd ~/.emacs.d/elpa
git checkout master
cd ~/.emacs.d/lisps
git checkout master
cd ~/.emacs.d/git-lisps/anything-config
git checkout master
cd ~/.emacs.d/git-lisps/o-blog
git checkout master
cd ~/.emacs.d/git-lisps/org2blog
git checkout master
cd ~/.emacs.d
git pull origin master
git submodule init
git submodule update
cd ~/.emacs.d/emacswiki
git checkout master
git pull origin master
cd ~/.emacs.d/elpa
git checkout master
git pull origin master
cd ~/.emacs.d/lisps
git checkout master
git pull origin master
cd ~/.emacs.d/git-lisps/anything-config
git pull origin master
cd ~/.emacs.d/git-lisps/o-blog
git pull origin master
git submodule update
cd ~/.emacs.d/git-lisps/org2blog
git pull origin master
git submodule update
