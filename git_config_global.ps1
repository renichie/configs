##################################### GIT CONFIGURATION ###################################
git config  core.autocrlf true # important for work in unix/win environments

##################################### ALIASES #############################################
#sets global aliases for git. CMDs are independet of OS
git config  alias.lg1 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all --date=short"
git config  alias.lg2 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''%C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
git config  alias.lg "!`"git lg1`""
git config  alias.log3 "log --pretty=format:'%h %ad | %s%d [%an] %Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --graph --date=short"
git config  alias.log2 "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
git config  alias.hist "for-each-ref --sort=committerdate refs/heads/ --format='%(color: red)%(committerdate:short) %(color: cyan)%(refname:short)'"
git config  alias.st status
git config  alias.sh show
git config  alias.s show
git config  alias.co checkout
git config  alias.ci commit
git config  alias.st status
git config  alias.br branch
git config  alias.b branch
git config  alias.hs hist
git config  alias.r	reset
git config  alias.names 'show --name-status'


##################################### TYPO ALIASES #############################################
git config  alias.glo	log
git config  alias.olg	log
git config  alias.gol	log
git config  alias.lgo	log
git config  alias.glo2	log2
git config  alias.ogl2	log2
git config  alias.glo2	log2
git config  alias.lgo2	log2