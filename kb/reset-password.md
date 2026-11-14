# Reset a user password

Reset the password of an employee who forgot it, after checking their identity.

**Where:** SRV-AD01, PowerShell as administrator
**Time:** about 3 minutes

## Steps

1. Verify the identity of the user before any change. Call them back on a known phone number, or ask a colleague or the manager to confirm. Never reset a password on a simple email request.
2. Open PowerShell as administrator on SRV-AD01.
3. Reset the password: `Set-ADAccountPassword -Identity alice.martin -Reset -NewPassword (Read-Host "New password" -AsSecureString)`
4. Type the temporary password when asked. It must have at least 10 characters and respect the complexity rules.
5. Force a new password at next login: `Set-ADUser -Identity alice.martin -ChangePasswordAtLogon $true`
6. Unlock the account in case it was locked by too many failed attempts: `Unlock-ADAccount -Identity alice.martin`
7. Give the temporary password to the user by phone, never by email.
8. Ask the user to log in and choose a new password. Check that the login works.
9. Document the action in the GLPI ticket (followup and solution).

## Result

The user can log in again and has chosen a new private password.