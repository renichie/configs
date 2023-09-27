function Git-Prune-Local-Branches {
    [CmdletBinding()]
    param (
        [Parameter()]
        [switch]$ForceDelete = $false
    )

    # Fetch from the remote to get the latest remote references
    git fetch --prune

    # Get a list of remote branches
    $remoteBranches = git branch -r | ForEach-Object { $_.trim().replace('origin/', '') } | Where-Object { $_ -ne 'HEAD' }

    # Get a list of all local branches
    $localBranches = git branch | ForEach-Object { $_.trim().replace('*', '').trim() }

    # Determine the currently checked-out branch (the one with the asterisk)
    $currentBranch = git branch | Where-Object { $_ -like '* *' } | ForEach-Object { $_.trim().replace('*', '').trim() }

    # Determine which local branches don't exist on the remote and delete them
    foreach ($branch in $localBranches) {
        if ($branch -ne $currentBranch -and $remoteBranches -notcontains $branch) {
            Write-Host "Deleting branch: $branch"
            if ($ForceDelete) {
                git branch -D $branch  # Force delete
            } else {
                git branch -d $branch  # Safe delete
            }
        }
    }
}
