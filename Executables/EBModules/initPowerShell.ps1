$windir = [Environment]::GetFolderPath('Windows')

# Add EB OS' PowerShell modules
$env:PSModulePath += ";$windir\EBModules\Scripts\Modules"