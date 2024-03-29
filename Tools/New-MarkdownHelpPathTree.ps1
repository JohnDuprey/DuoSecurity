
$Readme = Get-Content .\README.md -Raw
$NewReadme = ($Readme -split '# Cmdlet Help')[0]

$Folders = Get-ChildItem .\DuoSecurity\Public
$NewReadme = $NewReadme + '# Cmdlet Help'
foreach ($Folder in $Folders) {
    $NewReadme = $NewReadme + ("`n## {0}" -f $Folder.BaseName)
    $Items = Get-ChildItem -Path $Folder
    foreach ($Item in $Items) {
        if ($item.Extension -eq '.ps1') {
            $NewReadme = $NewReadme + ("`n- [{0}](./Docs/{1}.md)" -f $Item.BaseName, $Item.BaseName)
        } else {
            $NewReadme = $NewReadme + ("`n- {0}" -f $Item.BaseName)
            $Item | Get-ChildItem | ForEach-Object {
                $NewReadme = $NewReadme + ("`n  - [{0}](./Docs/{1}.md)" -f $_.BaseName, $_.BaseName)
            }
        }
    }
}

$NewReadme | Set-Content -Path .\README.md