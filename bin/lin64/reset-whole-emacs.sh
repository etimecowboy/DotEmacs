cd ~/.emacs.d/my-lisps
rm loaddefs*
rm *.elc
cd init
rm loaddefs*
rm *.elc
cd ../../lisps
rm loaddefs*
rm *.elc
cd themes
rm loaddefs*
rm *.elc
cd ../../emacswiki
rm loaddefs*
rm *.elc
cd ../elpa
rm loaddefs*
rm *.elc
cd ../themes
rm loaddefs*
rm *.elc
cd
emacs -nw --debug-init
