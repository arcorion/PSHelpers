# Helper Functions - A collection of functions which help with other scripts.
# Imports each component from inside this folder.
# Christopher Lee Crader - University of Washington - ccrader@uw.edu
Set-Location $(Split-Path -Parent $PSCommandPath)
Import-Module .\Read-YesNo.psm1
Import-Module .\Get-Administrator.psm1
function Get-Administrator {
	<#
		.SYNOPSIS
		Determine if the current shell is run with Administrator privileges
		in Windows.
		
		.DESCRIPTION
		The Get-Administrator function determines if the current shell is
		being run as an Administrator. If it is, it returns "True". If it is
		not, then "False" is returned.
	#>
	$currentRole = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent())
	$isAdmin = $currentRole.IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')

	return $isAdmin
}