<#
Author Tim Mitchell
Date 12/4/2016
Description: This script will print out the numbers 1 to 100, if the number is a multiple of 15, 5, or 3 it will say it.
Note that the breaks at the end of each switch will prevent numbers from listing that they are mutliples from both 3, 5, and 15.
If you want each number to say that they are a multiple of all up to all three of the switch statements then remove the semi colon and break.

#>

# The foreach will loop through each number from 1 to 100 and store it in a temporary variable $number for use in the switch statement
Foreach ($number in 1..100) 
    {
    switch ($number) 
        {
        # In each switch condition if the number does not have a remainder then write the output of the current object $_ which is $number at the time of the loop then go to the next number from the break 
        # else continue to the next condition until default.
        {-not ($_ % 15 ) } {"$_ is multiple of 15"; break }
        {-not ($_ % 5 ) } {"$_ is multiple of 5"; break }
        {-not ($_ % 3) } {"$_ is multiple of 3"; break }
        default { $_ }
        } 
    }
