# Read-YesNo - A module providing "True/False" based on a prompt asking a
# yes or no quesiton.
# Christopher Lee Crader - University of Washington - ccrader@uw.edu

function Read-YesNo
{
	<#
		.SYNOPSIS
		Prompt user and return truth or falseness based on a y/n answer.
		
		.DESCRIPTION
		The Read-YesNo function prompts a user with a passed prompt requiring
		a yes or no answer, then returns $true if "yes" and $false if "no".
		
		It just cleans up the text and grabs the first character as either
		'y' or 'n'.
		
		.PARAMETER Prompt
		A string used to prompt the user for a Y/N response. Note that it does
		not needed to provide the (Y/N) component - that's appended by this function.
		
		.EXAMPLE
		Read-YesNo -Prompt "Will this return true?"
		PS > Will this return true? (Y/N): yeah
		Out> True
	#>
	
	param (
		[String]$Prompt
	)
	
	$response = $null
	while (!($response -eq 'y') -and (!($response -eq 'n')))
	{
		$response = Read-Host $Prompt, "(Y/N)"
		$response = $response.Trim().ToLower()[0]
	} 

	if ($response -eq 'y')
	{
		return $true
	} else {
		return $false
	}
}