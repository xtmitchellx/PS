<#
Author Tim Mitchell
Date 12/4/2016
Description: This script will print out the numbers 1 to 100 and find the multiples of those numbers in three different versions. 
The first version will loop through 1 to 100 and find out if it is mutiple of 15, then 5, and then 3 but not all of them.
The second version will loop through 1 to 100 and find out if it is a multiple of 15, 5, and 3.
The third version will loop through 1 to 100 and find out if it is a multiple of any numbers between 1 and 100. 


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



#This version allows for a number to report if its a multiple of more than one of the numbers 15, 5, or 3. 
Foreach ($number in 1..100) 
    {
    switch ($number) 
        {
        # In each switch condition if the number does not have a remainder then write the output of the current object $_ which is $number at the time of the loop then go to the next number from the break 
        # else continue to the next condition until default.
        {-not ($_ % 15 -or $_ % 5 -or $_ % 3 ) } {"$_ is multiple of 15, 5, and 3"; break }
        {-not ($_ % 15 -or $_ % 5 ) } {"$_ is multiple of 15 and 5"; break }
        {-not ($_ % 15 -or $_ % 3 ) } {"$_ is multiple of 15 and 3"; break }
        {-not ($_ % 5 -or $_ % 3 ) } {"$_ is multiple of 5 and 3"; break }
        {-not ($_ % 15 ) } {"$_ is multiple of 15"; break }
        {-not ($_ % 5 ) } {"$_ is multiple of 5"; break }
        {-not ($_ % 3) } {"$_ is multiple of 3"; break }
        default { $_ }
        } 
    }



# This version will get all the multiples of the numbers 1 to 100 using two foreach loops and an if statement

# Run a foreach loop going through each number 1 through 100 and assigning it to a temporary variable $number
Foreach ($number in 1..100) 
    {
    # Declare variable called $multiples as an array
    $multiples = @()

    # Run a foreach loop going through each number 1 through 100 and assigning it to a temporary variable $multiple to hold the multiple values
    Foreach ($multiple in 1..100)
    {
        # If Statement that ensures that there is no remainder from dividing $number by $multiple then stores it in a temporary array $multiples
        If (-not ($number % $multiple))
        {
            $multiples += $multiple

        } # end if statement

    } # End Foreach $multiple

    # Output multiples of current $number
    "$number is a multiple of $multiples"

    # Delete the $mltiples array to reuse on next $number
    Remove-Item variable:multiples

} # End Foreach $number


