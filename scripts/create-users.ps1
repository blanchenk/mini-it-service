Import-Module ActiveDirectory

$csv = Import-Csv -Path ".\users.csv" -Delimiter ","
$domain = "company.local"
$ou = "OU=Users,OU=Company,DC=company,DC=local"
$password = Read-Host "Temporary password" -AsSecureString

foreach ($u in $csv) {
    $login = ("{0}.{1}" -f $u.firstname, $u.lastname).ToLower()

    if (Get-ADUser -Filter "SamAccountName -eq '$login'" -ErrorAction SilentlyContinue) {
        Write-Host "Already exists: $login" -ForegroundColor Yellow
        continue
    }

    New-ADUser -Name "$($u.firstname) $($u.lastname)" -GivenName $u.firstname -Surname $u.lastname -SamAccountName $login -UserPrincipalName "$login@$domain" -Path $ou -AccountPassword $password -Enabled $true -ChangePasswordAtLogon $true

    Add-ADGroupMember -Identity "GG-$($u.department)" -Members $login
    Write-Host "Created: $login ($($u.department))" -ForegroundColor Green
}