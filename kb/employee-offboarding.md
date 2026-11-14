# Employee offboarding

Disable the account of an employee who leaves the company and remove their access to shared folders.

**Where:** SRV-AD01, PowerShell as administrator
**Time:** about 3 minutes

## Steps

1. Get the login of the employee, for example `bruno.durand` (format: `firstname.lastname`, lowercase).
2. Open PowerShell as administrator and go to the scripts folder: `cd C:\Scripts`
3. Run the script with the login: `.\disable-user.ps1 -Login bruno.durand`
4. Check the result. The script prints `Account bruno.durand disabled and removed from all groups.` in green. If the login does not exist, it prints `Error:` in red and changes nothing.
5. In Active Directory Users and Computers, check that the account has a down arrow icon (disabled) and that the `Member Of` tab no longer shows any `GG-` group.
6. Record the departure in the ticket of the request, with the date and the technician name.

## Why we disable instead of delete

The account is kept disabled so its data and history can be recovered if needed. It is deleted only after the retention period defined by the company.

## Result

The employee can no longer log in and has no access to any share.