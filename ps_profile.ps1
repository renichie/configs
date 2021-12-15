###################################################################################################
######################################## VARIABLES ################################################
###################################################################################################
$KEYFILE_ZAX = "$HOME\.ssh\zax_sshkey"
$USR_ZAX = "eichinda"
$STARTING_DIR = "$HOME"
$WORKSPACE = "$HOME/workspace"
$CONFIG_DIR = "$HOME/configs"

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
function	updcs()		{ Invoke-Expression "$CONFIG_DIR/upd_win_cfgs.ps1 $CONFIG_DIR"; .$profile; } #TODO laden des profils tut irgendiwe noch nicht
function	ahs()		{ cat (Get-PSReadlineOption).HistorySavePath }
function	hgrep()		{ get-history | grep $args }
set-alias 	hg			hgrep

###################################################################################################
######################################### navigation ##############################################
###################################################################################################
function	configs() { change-directory-verbose "$WORKSPACE\configs\" }
function 	zamfe()	{ change-directory-verbose "$WORKSPACE\audi\zam-frontend\" }
function 	zaxfe()	{ change-directory-verbose "$WORKSPACE\ZAx\zax-frontend\" }
function 	zambe()	{ change-directory-verbose "$WORKSPACE\audi\zam-backend\" }
function 	zaxbe()	{ change-directory-verbose "$WORKSPACE\ZAx\zax-backend\" }
function 	pb()	{ change-directory-verbose "$WORKSPACE\bmw\primaerbedarfe\" }
function 	bmwdev()	{ change-directory-verbose "C:\bmwdev\repo" }
function 	wiki()	{ change-directory-verbose "$WORKSPACE\wiki.wiki\" }
function 	scripts()	{ change-directory-verbose "$WORKSPACE\scripts\" }
function	configs()	{ change-directory-verbose "$HOME\configs\"}
function 	home() 	{ change-directory-verbose "$HOME"}
function	ws()	{ change-directory-verbose "$WORKSPACE" }
function	work()	{ change-directory-verbose "$WORKSPACE\" }
function	jenkins	{ change-directory-verbose "$WORKSPACE\audi\jenkins_workflows\" }
function	..()	{ change-directory-verbose ".." }
function	...()	{ change-directory-verbose "../.." }
function	....()	{ change-directory-verbose "../../.." }
function	audi()	{ change-directory-verbose "$WORKSPACE/audi" }
function	heatvs()	{ change-directory-verbose "$WORKSPACE/heat_hvs" }
function	hvsfe()	{ change-directory-verbose "$WORKSPACE/heat_hvs\fe-hvs" }
function	heatfe()	{ change-directory-verbose "$WORKSPACE/heat_hvs\fe-heat" }
function	heatps()	{ change-directory-verbose "C:\bmwdev\repo\ps-heat\ps-heat" }
function	hvsps()	{ change-directory-verbose "C:\bmwdev\repo\ps-hvs\ps-hvs" }
function	heatfecommon()	{ change-directory-verbose "$WORKSPACE/heat_hvs\fe-heat-hvs-common\heat-hvs-common" }
function	demo() { change-directory-verbose "$workspace/angular-demo-final/" }
function	msfe() { change-directory-verbose "$workspace/bmw/mobile-scanner/fe-mobile-scanner/" }
function	msps() { change-directory-verbose "$workspace/bmw/mobile-scanner/ps-mobile-scanner/" }
set-alias	confs	configs
function	pcs()	{ change-directory-verbose "C:\bmwdev\repo\ps-common-service" }
function	pms()	{ change-directory-verbose "C:\bmwdev\repo\ps-mobile-scanner" }
function	pb()	{ change-directory-verbose "C:\bmwdev\repo\ps-bom" }

###################################################################################################
######################################### docker/ZAX specific aliases #############################
###################################################################################################
#function	go()	{ $cmd = "mvn"; $prms = "clean install"; write-output "Invoking `"$cmd $prms`""; Invoke-Expression "$cmd $prms" }
function 	rmai()	{ docker rmi $(docker images -q -a) }
function	rmallc(){ docker rm -f $(docker ps -a -q) }
function	stopallc() 	{ docker stop $(docker ps -a -q) }
function	sshdock	{ param ($a); docker exec -it $a /bin/bash }
function	sshz	{ ssh $USR_ZAX@zax }
#function	ssht	{ ssh -i $KEYFILE_ZAX $USR_ZAX@zax -Command "~/.tmux_startup.sh" }
function	scpz	{ param($src, $dest) scp $src $USR_ZAX@zax:$dest } #copy to zax
function	scpzr	{ param($src, $dest) scp $USR_ZAX@zax:$src $dest } #copy from zax
function	slog	{ while ($true){ cat .\target\liberty\wlp\usr\servers\defaultServer\logs\console.log; sleep 15 } }
function	mpackage{ param ($profile); Invoke-Expression "mvn com.spotify:dockerfile-maven-plugin:build -P $profile"; }
#--> looks for pattern $p in all files contained in folder $d
function	grepr	{ param ($d, $p); Get-ChildItem $d -Recurse * | Select-String -Pattern "$p" }
#--> looks for pattern $p in all files contained in folder $d and gives out only the file location in which the pattern is found
function	grepro	{ param ($d, $p); Get-ChildItem $d -Recurse * | Select-String -Pattern $p | Select-Object -Unique Path }


# some of those aliases only work in combination with git_aliases.ps1 script, where some of the git cmds are specified
###################################################################################################
######################################### GIT CMDs/ALIASES ########################################
###################################################################################################
function	gst()	{ git status $args }
set-alias	gs		gst

function	glg()	{ git lg $args }
function	glog()	{ git log1 $args }
function	glb()	{ git log2 $args }

function	gco()	{ git checkout $args }
set-alias	go		gco

function	gsh		{ git show $args }

# maybe, just maybe a little bit too much
set-alias	got		git
set-alias	get 	git
set-alias	g 		git
set-alias	gti 	git
set-alias	tgi 	git
set-alias	igt 	git
set-alias	ig 		git
set-alias	gt 		git
set-alias 	gut 	git
set-alias	gid		git

function	ga()	{ git add $args }
function	gaa()	{ git add -u $args }

function	gcom()	{ git commit $args }

function	gb()	{ git branch $args }

function	gmt()	{ git mergetool $args }

function	gr()	{ git reset $args }

function	bl()	{ git branch -avv }

function	gdc()	{ git diff --cached $args }

function	gfa()	{ git fetch --all $args }
function	gca()	{ git commit --amend $args }
function	gcane()	{ git commit --amend --no-edit $args }


###################################################################################################
######################################### HELPER FUNCTIONS ########################################
###################################################################################################
function	change-directory-verbose() #mit Ausgabe der Verzeichnisse vorher-nachher
{
	param($dst)
	$prev = pwd
	set-location $dst
	write-output "$prev --> $dst"
}

###################################################################################################
######################################### BMW §§§§§§§§§§§§§########################################
###################################################################################################
function resetHeatDbAndRestartServer() {
	docker stop docker-local_psdb_1; 
	docker rm docker-local_psdb_1; 
	docker-compose -f C:\bmwdev\repo\ps-common\ps-common-server\docker-local\docker-compose.yml up -d;
	$cwd = pwd;
	cd C:\bmwdev\repo\ps-heat\ps-heat-flyway;
	mvn properties:read-project-properties gplus:execute flyway:migrate flyway:info -P LOCAL_SERVER_COMPLETE;
	cd C:\bmwdev\repo\ps-hvs\ps-hvs-flyway;
	mvn properties:read-project-properties gplus:execute flyway:migrate flyway:info -P LOCAL_SERVER_COMPLETE;
	
	cd C:\bmwdev\repo\ps-heat\ps-heat;
	mvn -Pmicro_ui_tests payara-micro:stop clean package payara-micro:start;
	cd $cwd;
}

function resetHeatDb() {
	docker stop docker-local_psdb_1; 
	docker rm docker-local_psdb_1; 
	docker-compose -f C:\bmwdev\repo\ps-common\ps-common-server\docker-local\docker-compose.yml up -d;
	$cwd = pwd;
	cd C:\bmwdev\repo\ps-heat\ps-heat-flyway;
	mvn properties:read-project-properties gplus:execute flyway:migrate flyway:info -P LOCAL_SERVER_COMPLETE;
	cd $cwd;
}

function resetTestSetupHeat() {
	docker stop docker-local_psdb_1; 
	docker rm docker-local_psdb_1; 
	docker-compose -f C:\bmwdev\repo\ps-common\ps-common-server\docker-local\docker-compose.yml up -d;
	$cwd = pwd;
	cd C:\bmwdev\repo\ps-heat\ps-heat-flyway;
	mvn properties:read-project-properties gplus:execute flyway:migrate flyway:info -P LOCAL_SERVER_COMPLETE;
	cd C:\bmwdev\repo\ps-heat\ps-heat;
	mvn -Pmicro_ui_tests payara-micro:stop clean package payara-micro:start;
	cd $cwd;
}

function resetTestSetupHvs() {
	docker stop docker-local_psdb_1; 
	docker rm docker-local_psdb_1; 
	docker-compose -f C:\bmwdev\repo\ps-common\ps-common-server\docker-local\docker-compose.yml up -d;
	$cwd = pwd;
	cd C:\bmwdev\repo\ps-hvs\ps-hvs-flyway;
	mvn properties:read-project-properties gplus:execute flyway:migrate flyway:info -P LOCAL_SERVER_COMPLETE;	
	cd C:\bmwdev\repo\ps-hvs\ps-hvs;
	mvn -Pmicro_ui_tests payara-micro:stop clean package payara-micro:start;
	cd $cwd;
}

function resetHvsDb() {
	docker stop docker-local_psdb_1; 
	docker rm docker-local_psdb_1; 
	docker-compose -f C:\bmwdev\repo\ps-common\ps-common-server\docker-local\docker-compose.yml up -d;
	$cwd = pwd;
	cd C:\bmwdev\repo\ps-hvs\ps-hvs-flyway;
	mvn properties:read-project-properties gplus:execute flyway:migrate flyway:info -P LOCAL_SERVER_COMPLETE;
	cd $cwd;
}

function resetHeatHvsDbs() {
	docker stop docker-local_psdb_1; 	
	docker rm docker-local_psdb_1; 
	docker-compose -f C:\bmwdev\repo\ps-common\ps-common-server\docker-local\docker-compose.yml up -d;
	$cwd = pwd;
	cd C:\bmwdev\repo\ps-heat\ps-heat-flyway;
	mvn properties:read-project-properties gplus:execute flyway:migrate flyway:info -P LOCAL_SERVER_COMPLETE;
	cd C:\bmwdev\repo\ps-hvs\ps-hvs-flyway;
	mvn properties:read-project-properties gplus:execute flyway:migrate flyway:info -P LOCAL_SERVER_COMPLETE;
	cd $cwd;
}

function updateHeatHvsPSRepos() {
	$cwd = pwd;
	cd C:\bmwdev\repo\ps-heat\ps-heat-flyway; 	git pull --rebase;
	cd C:\bmwdev\repo\ps-heat\ps-heat; 			git pull --rebase;
	cd C:\bmwdev\repo\ps-hvs\ps-hvs-flyway; 	git pull --rebase;
	cd C:\bmwdev\repo\ps-common; 				git pull --rebase;
	cd $cwd;
}

function stopTestServers() {
	$cwd = pwd;	
	cd C:\bmwdev\repo\ps-hvs\ps-hvs;
	mvn -Pmicro_ui_tests payara-micro:stop;
	cd C:\bmwdev\repo\ps-heat\ps-heat;
	mvn -Pmicro_ui_tests payara-micro:stop;
	cd $cwd;
}


###################################################################################################
######################################### install4j #############################################
###################################################################################################
function i4jCompleteBuild() {
	$cwd = pwd;
	cd C:\bmwdev\repo\dave;
	mvn -f com.bmw.dave.root-pom/pom.xml clean install;
	mvn -f dave-common/pom.xml clean install;
	mvn -f dave-client/repository/pom.xml clean verify;
	mvn -f dave-client/pom.xml clean verify -Ddave-environment=INTEGRATION;
	Expand-Archive -Force dave-client\releng\com.bmw.dave.client.tycho.product\target\products\com.bmw.dave.client.feature.product-win32.win32.x86_64.zip -DestinationPath dave-client\releng\com.bmw.dave.client.installer\
	cp -Recurse -Force .\dave-client\releng\com.bmw.dave.client.installer\DAVE\* dave-client\releng\com.bmw.dave.client.installer\dave-client-build-artefacts
	mvn -f releng/com.bmw.dave.client.installer/pom.xml package
	#& "C:\Program Files\install4j9\bin\install4jc.exe" dave-client\releng\com.bmw.dave.client.installer\dave-client-installer-build_x86.install4j -v -D installDirectory=${HOME}\AppData\Roaming
	#& "C:\Program Files\install4j9\bin\install4jc.exe" dave-client\releng\com.bmw.dave.client.installer\dave-client-installer-build_x86_64.install4j -v -D installDirectory=${HOME}\AppData\Roaming
	cd $cwd;
}

function i4jappBuildx64 {
	param($stage);
	$cwd = pwd;
	cd C:\bmwdev\repo\dave;
	mvn -f com.bmw.dave.root-pom/pom.xml clean install;
	mvn -f dave-common/pom.xml clean install;
	mvn -f dave-client/repository/pom.xml clean verify;
	mvn -f dave-client/pom.xml clean verify -Ddave-environment=$stage;
	#Expand-Archive -Force dave-client\releng\com.bmw.dave.client.tycho.product\target\products\com.bmw.dave.client.feature.product-win32.win32.x86_64.zip -DestinationPath dave-client\releng\com.bmw.dave.client.installer\
	#cp -Recurse -Force .\dave-client\releng\com.bmw.dave.client.installer\DAVE\* dave-client\releng\com.bmw.dave.client.installer\build-artefacts\DAVE_x64
	#mvn -f releng/com.bmw.dave.client.installer/pom.xml versions:set "-DnewVersion=21.7.3"; mvn clean package "-Dinstaller.envFile=environment/DEVELOPMENT.INT2" "-Dinstaller.architecture=x86"; 
	#	moveDaveUpdate;
	cd $cwd;
}

function i4jappBuildx86 {
	param($stage);
	$cwd = pwd;
	cd C:\bmwdev\repo\dave;
	mvn -f com.bmw.dave.root-pom/pom.xml clean install;
	mvn -f dave-common/pom.xml clean install;
	mvn -f dave-client/repository/pom.xml clean verify;
	mvn -f dave-client/pom.xml clean verify -Ddave-environment=$stage;
	#& "C:\Program Files\install4j9\bin\install4jc.exe" dave-client\releng\com.bmw.dave.client.installer\dave-client-installer-build_x86.install4j -v -D installDirectory=${HOME}\AppData\Roaming -D installStage=INT
	#cp -Recurse -Force .\dave-client\releng\com.bmw.dave.client.installer\DAVE\* dave-client\releng\installer\dave-client-build-artefacts
	#& "C:\Program Files\install4j9\bin\install4jc.exe" dave-client\releng\com.bmw.dave.client.installer\dave-client-installer-build_x86_64.install4j -v -D installDirectory=${HOME}\AppData\Roaming -D installStage=INT
	#mvn -f releng/com.bmw.dave.client.installer/pom.xml clean package
	cd $cwd;
}


function moveDaveUpdate() {
	$upddir = "$home/desktop/updates";
	$mediadir = "C:\bmwdev\repo\dave\dave-client\releng\com.bmw.dave.client.installer/target/media";
	
	#rm -recurse -force $upddir/*;
	cp -recurse $mediadir/* $upddir/;
}

function moveSpeedUpdate() {
	$upddir = "$home/desktop/updates";
	$mediadir = "C:\bmwdev\repo\speed\BMW_Speed_Client_Installer/target/media";
	
	#rm -recurse -force $upddir/*;
	cp -recurse $mediadir/* $upddir/;
}

function speed() {
	change-directory-verbose C:\bmwdev\repo\speed\BMW_Speed_Client_Installer
}

function dave-client-installer() {
	change-directory-verbose C:\bmwdev\repo\dave\dave-client\releng\com.bmw.dave.client.installer
}

###################################################################################################
######################################### USEFUL CMDS #############################################
###################################################################################################
#Get-ChildItem . -Attributes Directory+Hidden -ErrorAction SilentlyContinue -Include ".git" -Recurse
#Get-ChildItem . -Attributes Directory+Hidden -ErrorAction SilentlyContinue -Filter ".git" -Recurse