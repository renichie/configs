param($configDir);

#Set-PSDebug -Trace 1

######################## SETUP (one time) ###################################################################
# with admin powershell:
#  Set-ExecutionPolicy -Scope LocalMachine RemoteSigned
#  find-module -name AdvancedHistory | install-module
#  find-module -name posh-git | install-module

######################## SETTING ENVIRONMENT ###################################################################
#$PROFILE = "$HOME\.ps_profile.ps1"

#write-output "copying powershell profile to $profile"
Invoke-Expression "copy-item $configDir\ps_profile.ps1 $profile"

######################################## copy vim configuration ###################################################
Write-Output "copying vimrc files..."
Invoke-Expression "copy-item $configDir/.vimrc $HOME/_vimrc"
Invoke-Expression "copy-item $configDir/.vimrc $HOME/.vimrc"
Invoke-Expression "copy-item $configDir/.vimrc $HOME/_ideavimrc"

######################################## copy vim configuration ###################################################
Write-Output "copying git config files..."
Invoke-Expression "copy-item $configDir/.gitconfig_global $HOME/.gitconfig"
#Invoke-Expression "copy-item $configDir/.gitconfig.work.sdk $HOME/.gitconfig.work.sdk"
Invoke-Expression "copy-item $configDir/.gitignore_global $HOME/.gitignore_global"

#echo "source $HOME/.vimrc" > $HOME/.ideavimrc

#write-output "copying posh-git profile to C:\Program Files\WindowsPowerShell\Modules\posh-git\0.7.3\GitPrompt.ps1"
#copy-item pwsh_profile.ps1 "C:\Program Files\WindowsPowerShell\Modules\posh-git\0.7.3\GitPrompt.ps1"

#.$profile

#Set-PSDebug -Trace 0
