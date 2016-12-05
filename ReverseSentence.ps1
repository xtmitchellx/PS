
<#
Author: Tim Mitchell
Date: 12/4/2016
Description: There are two version of this script that pull the reverse order of words from a sentence.
Version 1 uses a while loop to cycle through the $split array from -1 to the total amount in the count of $split negative.
Version 2 simply calls the $split array and counts the total number of objets backwards to 0
#>

# Version 1

function Get-ReverseV1
    {
    param (
        $phrase,
        $counter = 0,
        $result = ''
        )

    $split = $phrase.split(" ")
    while($counter -lt $split.count){
        $result += $split[-($counter)-1] + " "
        $counter += 1
    }

    $result
}

Get-ReverseV1 -phrase "Choppa","The","To","Get"

# Version 2

function Get-ReverseV2
    {
        param(
            [Parameter(Mandatory=$true)]
            [String[]]$sentence
        )
        $split = $sentence.Split(" ")
        $split[$split.Count..0] -join " " 
    } # End Function Get-Reverse2

Get-ReverseV2 -sentence "Choppa","The","To","Get"



