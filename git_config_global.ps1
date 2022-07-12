##################################### GIT CONFIGURATION ###################################
git config  core.autocrlf false # important for work in unix/win environments

##################################### ALIASES #############################################
#sets global aliases for git. CMDs are independet of OS
git config  --global alias.lg1 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all --date=short"	
git config  --global alias.lg2 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''%C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
git config  --global alias.lg "!`"git lg1`""
git config  --global alias.log3 "log --pretty=format:'%h %ad | %s%d [%an] %Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --graph --date=short"
git config  --global alias.log2 "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
git config  --global alias.hist "for-each-ref --sort=committerdate refs/heads/ --format='%(color: red)%(committerdate:short) %(color: cyan)%(refname:short)'"
git config  --global alias.st status
git config  --global alias.sh show
git config  --global alias.s show
git config  --global alias.co checkout
git config  --global alias.ci commit
git config  --global alias.st status
git config  --global alias.br branch
git config  --global alias.b branch
git config  --global alias.hs hist
git config  --global alias.r	reset
git config  --global alias.names 'show --name-status'


##################################### TYPO ALIASES #############################################
git config  --global alias.glo	log
git config  --global alias.olg	log
git config  --global alias.gol	log
git config  --global alias.lgo	log
git config  --global alias.glo2	log2
git config  --global alias.ogl2	log2
git config  --global alias.glo2	log2
git config  --global alias.lgo2	log2