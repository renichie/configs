# Define the list of folders to operate on
$baseDir = "C:\Users\UB422\workspace\SDK"
$folders = @(
"sdk-common",
"storage-manager",
"metadata",
"organizationmanager",
"accessmanager",
"storage-schemas",
"search"
)

# For each folder in the list
foreach ($folder in $folders)
{
    # Check if the folder exists
    if (Test-Path $baseDir/$folder)
    {
        # Navigate to the folder
        Set-Location -Path $folder

        # Check if it's a valid Git repository
        if (Test-Path .git)
        {
            # Add all changes
            git add --all

            # Commit changes with a generic message
            git commit -m "Automated commit from script"

            # Push changes
            git push
        }
        else
        {
            Write-Host "$folder is not a valid Git repository."
        }

        Set-Location ..
    }
    else
    {
        Write-Host "$folder does not exist."
    }
}
