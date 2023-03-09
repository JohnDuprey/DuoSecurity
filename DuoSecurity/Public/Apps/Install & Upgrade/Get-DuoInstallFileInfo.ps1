function Get-DuoInstallFileInfo {
    [CmdletBinding()]
    Param(
        $Url
    )

    $Head = Invoke-WebRequest $Url -Method Head
    $ContentDisposition = @{}

    $Head.headers.'Content-Disposition' -split '\s*;\s*' | ForEach-Object { $Key, $Value = $_ -split '='; $ContentDisposition.$Key = $Value -replace '"' }
    $Filename = $ContentDisposition.filename

    (Invoke-WebRequest 'https://duo.com/docs/checksums').content -split "`n" | Where-Object { $_ -match "(:?<a href=`"(?<Url>.+)`">)?(?<Checksum>[a-z0-9]+)\s+?$Filename" }
    if ($Matches) {
        $Checksum = $Matches.Checksum
        $Url = $Matches.Url
    } else {
        $Checksum = $false
        $Url = $false
    }

    [PSCustomObject]@{
        Name     = $Filename
        Checksum = $Checksum
        Url      = $Url
    }
}
