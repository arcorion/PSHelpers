# Install-InstallTools - Checks to see if install tools (winget and PSWindowsUpdate) are available.
# If not, it installs them.
# Christopher Lee Crader - University of Washington - ccrader@uw.edu
Import-Module .\Get-Administrator

function Install-InstallTools {
	<#
		.SYNOPSIS
		Checks to see if install tools (winget and PSWindowsUpdate) are available.
		If not, it installs them.
	#>
	Get-Administrator -CloseWithMessage
	
	# Make sure PSGallery is trusted, so the modules can be installed.
	$repository = Get-Repository -Name "PSGallery"
	if (!($repository.InstallationPolicy -eq "Trusted")) {
		Set-Repository -Name "PSGallery" -InstallationPolicy "Trusted"
	}
	
	# Check for winget - check for module, but it's possible
	# WinGet was installed via other means, so check for command as
	# well.
	$wingetInstalled = Get-Module -Name Microsoft.WinGet.Client
	if (!($wingetInstalled)) {
		$wingetInstalled = Get-Command winget
	}
	if (!($wingetInstalled)) {
		Install-Module -Name Microsoft.WinGet.Client
	}
	
	# Check for PSWindowsUpdate
	$pswuInstalled = Get-Module -Name PSWindowsUpdate
	if (!($pswuInstalled)) {
		Install-Module -Name PSWindowsUpdate
	}
}