#!/bin/bash
cd ~/.emacs.d/my-lisps
rm loaddefs*
rm *.elc
cd ./init
rm loaddefs*
rm *.elc
cd
emacs -nw --debug-init
