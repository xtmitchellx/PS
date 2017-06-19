<<<<<<< HEAD
﻿# LDAPTest.ps1
=======
# LDAPTest.ps1
>>>>>>> 024188b4a9b3838fb83adc5d676dc3d32d778b97
# Author: Timothy Mitchell
# Date: 6/17/2017
# This script will poll all Domain Controllers, if they are pingable then it will attempt an LDAP connection.

<<<<<<< HEAD
param
(
  [String]
  [Parameter(Mandatory=$true)]
  [string]
  $DomainName
)
=======
# Domain Name
$domainName = ''
>>>>>>> 024188b4a9b3838fb83adc5d676dc3d32d778b97

# Create Log
if (Test-Path $env:TEMP\dc.csv) {
    Remove-Item $env:TEMP\dc.csv -Force
}

"Domain Controllers unreachable over port 389" | Out-File $env:TEMP\dc.csv -Append -Force

# Find all Domain Controllers
$domain = ([system.net.dns]::resolve($domainName)).AddressList.IPAddressToString

# Query Domain Controllers for LDAP if ping is successful

ForEach ($DC in $domain) {
    if ( (Test-Connection -ComputerName $DC -count 2 -ErrorAction Ignore).IPV4Address.IPAddressToString -ne $null ) {
        Write-Host "Ping to $DC : UP" -ForegroundColor Green
        try { 
            $tcp=new-object System.Net.Sockets.TcpClient 
            $tcp.connect($DC,389) 
            $tcp.close() 
            } 
        catch { 
            Write-host "LDAP to $DC : DOWN" -ForegroundColor Red
            $DC | Out-File -FilePath $env:TEMP\dc.csv -Append -Force
            continue
            }
        Write-Host "LDAP to $DC : UP" -ForegroundColor Green
    }
}

# Open Log
notepad.exe $env:TEMP\dc.csv