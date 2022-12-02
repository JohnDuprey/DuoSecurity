Build-Module
Remove-Module DuoSecurity
Import-Module .\Output\DuoSecurity\DuoSecurity.psd1
New-MarkdownHelp -Module DuoSecurity -OutputFolder .\Docs\ -Force