param($configDir);

Set-PSDebug -Trace 1

#write-output "copying powershell profile to $profile"
Invoke-Expression "copy-item $configDir/ps_profile.ps1 $profile"

Invoke-Expression "copy-item $configDir/.vimrc $HOME/.vimrc"
Invoke-Expression "copy-item $configDir/.vimrc $HOME/.ideavimrc"
#copy-item .vimrc $HOME/.vimrc

#echo "source $HOME/.vimrc" > $HOME/.ideavimrc

#write-output "copying posh-git profile to C:\Program Files\WindowsPowerShell\Modules\posh-git\0.7.3\GitPrompt.ps1"
#copy-item pwsh_profile.ps1 "C:\Program Files\WindowsPowerShell\Modules\posh-git\0.7.3\GitPrompt.ps1"
Set-PSDebug -Trace 0
