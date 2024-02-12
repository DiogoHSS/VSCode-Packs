# Specify the target directory where symbolic links will be created
$targetDirectory = "C:\Users\Diogo Henriques\.vscode\extensions\"

# Get a list of all directories in the current directory
$sourceDirectories = Get-ChildItem -Directory

# Iterate over each directory and create symbolic link
foreach ($directory in $sourceDirectories) {
    # Form the path for the symbolic link
    $linkPath = Join-Path -Path $targetDirectory -ChildPath $directory.Name

    # Check if the symbolic link already exists, if so, remove it
    if (Test-Path $linkPath) {
        Remove-Item $linkPath -Force -Recurse
    }

    # Create the symbolic link
    New-Item -ItemType SymbolicLink -Path $linkPath -Target $directory.FullName -Force
}
