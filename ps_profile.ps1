###################################################################################################
######################################## VARIABLES ################################################
###################################################################################################
$KEYFILE_ZAX = "$HOME\.ssh\zax_sshkey"
$USR_ZAX = "eichinda"
$CONFIG_DIR = "$HOME/workspace/configs"
$STARTING_DIR = "$HOME"

#set-location $STARTING_DIR

###################################################################################################
################################################## Prompt #########################################
###################################################################################################
Import-Module Posh-Git
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { $Script:IsAdmin = $true }
 
function prompt {
    if (((Get-Item $pwd).parent.parent.name)) {
        $Path = '..\' + (Get-Item $pwd).parent.name + '\' + (Split-Path $pwd -Leaf)
    } else {
        $Path = $pwd.path
    }
 
    if($Script:IsAdmin) {
        # Write-Host "ADMN::" -ForegroundColor Black -BackgroundColor Green -NoNewline
        Write-Host "ADMN::" -ForegroundColor Green -BackgroundColor DarkBlue -NoNewline
    }
 
    Write-Host " $($MyInvocation.HistoryId) " -ForegroundColor white -BackgroundColor DarkBlue -NoNewline
    # Write-Host " | " -ForegroundColor DarkBlue -BackgroundColor Cyan -NoNewline
    # Write-Host "$([char]0xE0B0)$([char]0xE0B1) " -ForegroundColor DarkBlue -BackgroundColor Cyan -NoNewline
    Write-Host " $(($path).ToLower().TrimEnd('\')) " -ForegroundColor White -BackgroundColor Cyan -NoNewline
    if ((Write-VcsStatus *>&1).Length -gt 0) {
        # Write-Host "$([char]0xE0B0)$([char]0xE0B1)" -ForegroundColor Cyan -BackgroundColor DarkGray -NoNewline
        Write-Host (Write-VcsStatus) -NoNewline -BackgroundColor DarkGray
        # Write-Host "$([char]0xE0B0)$("$([char]0xE0B1)" * $NestedPromptLevel)" -ForegroundColor DarkGray -NoNewline
		Write-Host "$(" " * $NestedPromptLevel)" -ForegroundColor DarkGray -NoNewline
    } else {
		Write-Host "$(" " * $NestedPromptLevel)" -ForegroundColor DarkGray -NoNewline
        # Write-Host "| *$([char]0xE0B0)$("$([char]0xE0B1)" * $NestedPromptLevel)" -ForegroundColor Cyan -NoNewline
    }
	' '
}
###################################################################################################
########################################## Readline options #######################################
###################################################################################################
## Tab completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineOption -ShowToolTips
 
## Colours <-- don't work no more
#Set-PSReadlineOption -TokenKind Command -ForegroundColor Blue
#Set-PSReadlineOption -TokenKind Parameter -ForegroundColor DarkBlue
#Set-PSReadlineOption -TokenKind Comment -ForegroundColor Green
#Set-PSReadlineOption -TokenKind Operator -ForegroundColor Gray
#Set-PSReadlineOption -TokenKind Variable -ForegroundColor Magenta
#Set-PSReadlineOption -TokenKind Keyword -ForegroundColor Magenta
#Set-PSReadlineOption -TokenKind String -ForegroundColor DarkGray
#Set-PSReadlineOption -TokenKind Type -ForegroundColor DarkCyan
 
#AdvancedHistory
Import-Module AdvancedHistory
Enable-AdvancedHistory

Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit

###################################################################################################
######################################## GENERAL ALIASES ##########################################
###################################################################################################
set-alias 	which 	get-command
set-alias 	grep 	Select-string
set-alias 	find	get-childitem
set-alias 	run 	Invoke-History   # usage: run <cmd_id>
set-alias	hs		get-history
set-alias	open	invoke-item
set-alias	c		clear-host

###################################################################################################
######################################## Function Aliases #########################################
###################################################################################################
function 	ll 			{ Get-ChildItem -Force $args }
function	less()		{ out-host -paging } #TODO not working <-- needs parameters
function	ff()		{ param($d); if(!$d) { $d="." }; Invoke-Expression "find $d -name -r" }
function	ffs()		{ param($d=".", $p); Invoke-Expression "find $d -name -r | grep $p" }
function	configs()	{ $prev = pwd; $loc = "$HOME\workspace\configs\"; set-location $loc; echo "$prev --> $loc"}
function	updcs()		{ Invoke-Expression "$CONFIG_DIR/upd_win_cfgs.ps1 $CONFIG_DIR"; .$profile; } #TODO laden des profils tut irgendiwe noch nicht
function	ws()		{ change-directory "$HOME/workspace" }
function	wiki()		{ set-location $HOME/workspace/wiki }
function	ahs()		{ cat (Get-PSReadlineOption).HistorySavePath }

###################################################################################################
######################################### navigation ##############################################
###################################################################################################
function 	zamfe()	{ change-directory "$HOME\workspace\zam-frontend\" }
function 	zaxfe()	{ change-directory "$HOME\workspace\zax-frontend\" }
function 	zambe()	{ change-directory "$HOME\workspace\zam-backend\" }
function 	zaxbe()	{ change-directory "$HOME\workspace\zax-backend\" }
function 	bmwfe()	{ change-directory "$HOME\workspace\clarwegpt\" }
function 	home() 	{ $prev = pwd; $loc = "$HOME"; set-location $loc; write-output "$prev --> $loc"}
function	..()	{ change-directory ".." }
function	...()	{ change-directory "../.." }
function	....()	{ change-directory "../../.." }
function	work()	{ change-directory "$HOME\workspace\" }
function	jenkins	{ change-directory "$HOME\workspace\jenkins_workflows\" }
set-alias	be		zambe
set-alias	fe		zamfe
set-alias	bmw		bmwfe

###################################################################################################
######################################### docker/ZAX specific aliases #############################
###################################################################################################
#function	go()	{ $cmd = "mvn"; $prms = "clean install"; write-output "Invoking `"$cmd $prms`""; Invoke-Expression "$cmd $prms" }
function 	rmai()	{ docker rmi $(docker images -q -a) }
function	rmallc(){ docker rm -f $(docker ps -a -q) }
function	stopallc() 	{ docker stop $(docker ps -a -q) }
function	sshdock	{ param ($a); docker exec -it $a /bin/bash }
function	sshz	{ ssh -i $KEYFILE_ZAX $USR_ZAX@zax }
#function	ssht	{ ssh -i $KEYFILE_ZAX $USR_ZAX@zax -Command "~/.tmux_startup.sh" }
function	scpz	{ param($src, $dest) scp -i $KEYFILE_ZAX $src $USR_ZAX@zax:$dest } #copy to zax
function	scpzr	{ param($src, $dest) scp -i $KEYFILE_ZAX $USR_ZAX@zax:$src $dest } #copy from zax
function	slog	{ while ($true){ cat .\target\liberty\wlp\usr\servers\defaultServer\logs\console.log; sleep 15 } }
function	mpackage{ param ($profile); Invoke-Expression "mvn com.spotify:dockerfile-maven-plugin:build -P $profile"; }
#--> looks for pattern $p in all files contained in folder $d
function	grepr	{ param ($d, $p); Get-ChildItem $d -Recurse * | Select-String -Pattern "$p" }
#--> looks for pattern $p in all files contained in folder $d and gives out only the file location in which the pattern is found
function	grepro	{ param ($d, $p); Get-ChildItem $d -Recurse * | Select-String -Pattern "$p" | Select-Object -Unique Path }


# some of those aliases only work in combination with git_aliases.ps1 script, where some of the git cmds are specified
###################################################################################################
######################################### GIT CMDs ################################################
###################################################################################################
function	gst()	{ git status $args }
set-alias	gs		gst

function	glg()	{ git lg $args }
function	glog()	{ git log1 $args}
function	glb()	{ git log2 $args }

function	gco()	{ git checkout $args}
set-alias	go		gco

function	gsh		{ git show $args}

set-alias	got		git
set-alias	get 	git

function	ga()	{ git add $args}

function	gcom()	{ git commit $args }

function	gb()	{ git branch $args }

function	gmt		{ git mergetool $args }

###################################################################################################
######################################### HELPER FUNCTIONS ########################################
###################################################################################################
function	change-directory() #mit Ausgabe vorher-nachher
{
	param($dst)
	$prev = pwd
	set-location $dst
	write-output "$prev --> $dst"
}

###################################################################################################
######################################### USEFUL CMDS #############################################
###################################################################################################
#Get-ChildItem . -Attributes Directory+Hidden -ErrorAction SilentlyContinue -Include ".git" -Recurse
#Get-ChildItem . -Attributes Directory+Hidden -ErrorAction SilentlyContinue -Filter ".git" -Recurse