cd ~/.emacs.d/emacswiki
git checkout master
cd ~/.emacs.d/elpa
git checkout master
cd ~/.emacs.d/lisps
git checkout master
cd ~/.emacs.d/git-lisps/dictionary-el
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
cd ~/.emacs.d/git-lisps/dictionary-el
git checkout master
cd ~/.emacs.d/git-lisps/eictionary-el
git pull origin master
git submodule update
