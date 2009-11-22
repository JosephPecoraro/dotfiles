# Copy only files that are newer then the current files
[ ~/.bashrc -nt ./.bashrc ] && echo "Copying .bashrc" && cp ~/.bashrc .
[ ~/.bash_profile -nt ./.bash_profile ] && echo "Copying .bash_profile" && cp ~/.bash_profile .
[ ~/.bash_complete -nt ./.bash_complete ] && echo "Copying .bash_complete" && cp ~/.bash_complete .
[ ~/.inputrc -nt ./.inputrc ] && echo "Copying .inputrc" && cp ~/.inputrc .
[ ~/.irbrc -nt ./.irbrc ] && echo "Copying .irbrc" && cp ~/.irbrc .
[ ~/.gitconfig -nt ./.gitconfig ] && echo "Copying .gitconfig" && cp ~/.gitconfig .
[ ~/.whenever -nt ./.whenever ] && echo "Copying .whenever" && cp ~/.whenever .
