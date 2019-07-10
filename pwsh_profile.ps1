#############################################################################################################################
# Prompt
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
        Write-Host " $([char]0xE0A0)" -ForegroundColor Black -BackgroundColor Green -NoNewline
        Write-Host "$([char]0xE0B0)$([char]0xE0B1)" -ForegroundColor Green -BackgroundColor DarkBlue -NoNewline
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

# Readline options
## Tab completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineOption -ShowToolTips
 
## Colours
Set-PSReadlineOption -TokenKind Command -ForegroundColor Blue
Set-PSReadlineOption -TokenKind Parameter -ForegroundColor DarkBlue
Set-PSReadlineOption -TokenKind Comment -ForegroundColor Green
Set-PSReadlineOption -TokenKind Operator -ForegroundColor Gray
Set-PSReadlineOption -TokenKind Variable -ForegroundColor Magenta
Set-PSReadlineOption -TokenKind Keyword -ForegroundColor Magenta
Set-PSReadlineOption -TokenKind String -ForegroundColor DarkGray
Set-PSReadlineOption -TokenKind Type -ForegroundColor DarkCyan
 
# AdvancedHistory
Import-Module AdvancedHistory
Enable-AdvancedHistory -Unique

#############################################################################################################################

$keyfile_zax = "$HOME\.ssh\zax_sshkey"
$usr_zax = "eichinda"



Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit


######################################## ALIASES #######################################
set-alias 	which 	get-command
set-alias 	grep 	Select-string
set-alias 	find	get-childitem
set-alias 	run 	Invoke-History
set-alias	hs		get-history
set-alias	be		zambe
set-alias	fe		zamfe
#set-alias	-Name 'dps'	-Value 'docker ps' 
# Aliases
function 	ll 			{ Get-ChildItem -Force $args }
function	less()		{ out-host -paging } #TODO not working <-- needs parameters
function	ff()		{ param($p); Invoke-Expression "find . -name -r | grep $p" }
function	configs()	{ $prev = pwd; $loc = "$HOME\workspace\configs\"; set-location $loc; echo "$prev --> $loc"}


######################################### navigation ###########################################
function 	home() 	{ $prev = pwd; $loc = "$HOME"; set-location $loc; write-output "$prev --> $loc"}
function 	home2()	{ $prev = pwd; $loc = "$HOME\workspace\zax-backend\rest\"; set-location $loc; echo "$prev --> $loc"} 

#============================== docker/ZAx specific aliases ============================
function	go()	{ $cmd = "mvn"; $prms = "clean install"; write-output "Invoking `"$cmd $prms`""; Invoke-Expression "$cmd $prms" }
function 	zamfe()	{ change-directory "$HOME\workspace\zam-frontend\" }
function 	zaxfe()	{ change-directory "$HOME\workspace\zax-frontend\" }
function 	zambe()	{ change-directory "$HOME\workspace\zam-backend\" }
function 	zaxbe()	{ change-directory "$HOME\workspace\zax-backend\rest\" }
function 	zamfe()	{ change-directory "$HOME\workspace\zam-frontend\" }
function 	rmai()	{ docker rmi $(docker images -q -a) }
function	killalld() 	{ docker rm -f $(docker ps -a -q) }
function	stopalld() 	{ docker stop $(docker ps -a -q) }
function	sshdock	{ param ($a); docker exec -it $a /bin/bash }
function	sshz	{ ssh -i $keyfile_zax $usr_zax@zax }
function	scpz	{ param($src, $dest) scp -i $keyfile_zax $src $usr_zax@zax:$dest }

######################################### HELPER FUNCTIONS ###########################################
#todo invoke command mit ausgabe was invoked wird
function	change-directory() #mit Ausgabe vorher-nachher
{
	param($dst)
	$prev = pwd
	set-location $dst
	echo "$prev --> $dst"
}


######################################### GIT ###########################################
#global:GitPromptSettings.WorkingForegroundColor    = [ConsoleColor]::Yellow 
