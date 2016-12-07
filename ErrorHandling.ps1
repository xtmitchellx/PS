<#
Author: Tim Mitchell
Date: 12/7/2016
Description: This script is for basic error catching for future use.

#>



#Declare variables 
$logfile = "results.txt"
$path = "C:\temp3"


#Try to change the location, if it doesnt exit it will catch and throw an error to the console as well as the log file. 
try {
    Set-Location $path -ErrorAction STOP
}
catch {
    Get-Date | Out-File $logfile -Append
    $message = "The filepath $path  was not found and Ben is dumb"
    $message | Out-File $logfile -Append
    throw $message
}