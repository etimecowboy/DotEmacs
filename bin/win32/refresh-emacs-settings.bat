rm -rf ~/.emacs.d/elpa/org-201*
cd ~/.emacs.d/my-lisps/init
rm xy-rcroot-env.elc*
rm xy-rc-utils.elc*
rm loaddefs*
runemacs.exe --debug-init
