function ConvertFrom-Base64 {
    <#
    .SYNOPSIS
    Convert Base64 string to file

    .DESCRIPTION
    Converts file to a byte stream and writes the contents as base64

    .PARAMETER Base64
    File contents in Base64 string

    .PARAMETER Path
    Path to the file

    .EXAMPLE
    ConvertTo-Base64 -Path path/to/file.png
    #>
    Param(
        [Parameter(Mandatory = $true)]
        [String]$Base64,

        [Parameter(Mandatory = $true)]
        [String]$Path
    )
    $Bytes = [Convert]::FromBase64String($Base64)
    [IO.File]::WriteAllBytes($Path, $Bytes)
}
