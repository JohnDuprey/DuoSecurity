function ConvertTo-Base64 {
    <#
    .SYNOPSIS
    Convert file to Base64
    
    .DESCRIPTION
    Converts file to a byte stream and writes the contents as base64
    
    .PARAMETER Path
    Path to the file
    
    .EXAMPLE
    ConvertTo-Base64 -Path path/to/file.png
    #>
    Param(
        [Parameter(Mandatory = $true)]
        [String]$Path
    )
    [convert]::ToBase64String((Get-Content -LiteralPath $Path -AsByteStream -Raw))
}