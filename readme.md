# Arc's Powershell Helpers
## Introduction
Just a collection of Powershell scripts I find useful for various projects.

## Contents
- Disable-Sleep.psm1 - Disables sleep modes (sleep, hibernate, disk, monitor). Requires Admin.
- Get-Administrator.psm1 - Returns whether the current shell is Admin or not as a T/F.
- Install-InstallTools.psm1 - Installs winget and PSWindowsUpdate, if needed. Needs admin.
- PSHelpers.psm1 - All of the helper functions in one module. Just imports the others.
- Read-YesNo.psm1 - Prompts a Y/N question and returns a T/F value (Yes is True, No is False)