
$Folders = Get-ChildItem .\DuoSecurity\Public

foreach ($Folder in $Folders) {
    Write-Output ('## {0}' -f $Folder.BaseName)
    $Items = Get-ChildItem -Path $Folder
    foreach ($Item in $Items) {
        if ($item.Extension -eq '.ps1') {
            Write-Output ('- [{0}](./Docs/{1}.md)' -f $Item.BaseName, $Item.BaseName)
        }
        else {
            Write-Output ('- {0}' -f $Item.BaseName)
            $Item | Get-ChildItem | ForEach-Object {
                 Write-Output ("  - [{0}](./Docs/{1}.md)" -f $_.BaseName, $_.BaseName)
            }
        }
    }
}