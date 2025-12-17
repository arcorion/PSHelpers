# Disabled sleep functionality on Windows systems.
# Christopher Lee Crader - University of Washington - ccrader@uw.edu
# Taken from https://stackoverflow.com/questions/33790965/set-a-one-line-powershell-for-sleep-and-hibernate-to-turn-off
Import-Module .\Get-Administrator.psm1

function Disable-Sleep {
	<#
		.SYNOPSIS
		Disable all sleep modes, including hibernation, display sleep, and disk timeout.
		Requires Administrator.
	#>
	if (Get-Administrator) {
		powercfg.exe -x -monitor-timeout-ac 0
		powercfg.exe -x -monitor-timeout-dc 0
		powercfg.exe -x -disk-timeout-ac 0
		powercfg.exe -x -disk-timeout-dc 0
		powercfg.exe -x -standby-timeout-ac 0
		powercfg.exe -x -standby-timeout-dc 0
		powercfg.exe -x -hibernate-timeout-ac 0
		powercfg.exe -x -hibernate-timeout-dc 0
	} else {
		Write-Output "Administrator required to disable sleep modes."
	}
}