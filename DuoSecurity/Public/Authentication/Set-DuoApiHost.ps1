function Set-DuoApiHost {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        $ApiHost
    )
    $script:DuoApiHost = $ApiHost
}