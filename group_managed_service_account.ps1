#Creating a Group Managed Service Accounts
Add-KdsRootKey -EffectiveTime ((Get-Date).AddHours(-10))

#Creat a Security Group for GMSA and add computers, example computers_gmsa_test
# Create gmsa service account and added to computer group
New-ADServiceAccount -Name gmsa_test -DNSHostName dc1.contoso.com `
-PrincipalsAllowedToRetrieveManagedPassword computers_gmsa_test -PassThru

#Verify with ADSI Edit (adsi.msc)

#Add service account to other computer
Add-ADComputerServiceAccount -Identity srv1 -ServiceAccount gmsa_test -PassThru



#From Security, add computers with read permission.
shutdown /r domain controller

Set-ADServiceAccount -Identity gmsa_test -PrincipalsAllowedToRetrieveManagedPassword server_name$

#On the other computer, require Active Directory Power-Module 
Install-WindowsFeature rsat

Install-ADServiceAccount -Identity gmsa_test