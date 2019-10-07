##################################### GIT CONFIGURATION ###################################
git config --global core.autocrlf true # important for work in unix/win environments

##################################### ALIASES #############################################
#sets global aliases for git. CMDs are independet of OS
git config --global alias.lg1 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all --date=short"
git config --global alias.lg2 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''%C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
git config --global alias.lg "!`"git lg1`""
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an] %Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --graph --date=short"
git config --global alias.log2 "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hs hist