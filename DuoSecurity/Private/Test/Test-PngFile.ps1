function Test-PngFile {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string]$Path
    )
    $PngHeaders = @( "89", "50", "4E", "47", "0D", "0A", "1A", "0A" );

    $Bytes = Get-Content -LiteralPath $Path -AsByteStream -ReadCount 1 -TotalCount 8 -ErrorAction Ignore

    $FileHeader = $Bytes | Select-Object -First $PngHeaders.Length | ForEach-Object { $_.ToString("X2") }

    $Diff = Compare-Object -ReferenceObject $PngHeaders -DifferenceObject $FileHeader

    ($Diff | Measure-Object).Count -eq 0
}
