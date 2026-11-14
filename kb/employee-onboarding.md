# Employee onboarding

Create the Active Directory account of a new employee and give them access to their department share.

**Where:** SRV-AD01, PowerShell as administrator
**Time:** about 5 minutes

## Steps

1. Open `C:\Scripts\users.csv` and add one line for the new employee: `firstname,lastname,department`. The department must be `Accounting`, `HR` or `IT`.
2. Open PowerShell as administrator and go to the scripts folder: `cd C:\Scripts`
3. Run the script: `.\create-users.ps1`
4. Enter a temporary password when asked. It must have at least 10 characters and respect the complexity rules.
5. Check the result. The script prints `Created: login (department)` in green. If the account already exists, it prints `Already exists` in yellow and does nothing.
6. In Active Directory Users and Computers, check that the user is in `Company > Users` and a member of the right `GG-` group.
7. Give the temporary password to the employee. They must choose a new one at first login.
8. On a company PC, ask the employee to log in and open their department share, for example `\\SRV-AD01\Accounting`.

## Result

The employee can log in, and only sees the share of their department.