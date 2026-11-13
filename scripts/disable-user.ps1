param(
    [Parameter(Mandatory=$true)]
    [string]$Login
)

try {
    Disable-ADAccount -Identity $Login -ErrorAction Stop

    $groups = (Get-ADUser $Login -Properties MemberOf -ErrorAction Stop).MemberOf
    foreach ($group in $groups) {
        Remove-ADGroupMember -Identity $group -Members $Login -Confirm:$false -ErrorAction Stop
    }

    Write-Host "Account $Login disabled and removed from all groups." -ForegroundColor Green
}
catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}