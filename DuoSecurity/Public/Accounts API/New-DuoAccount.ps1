function New-DuoAccount {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        $Name
    )
    $DuoRequest = @{
        Method = 'POST'
        Path   = '/accounts/v1/account/create'
        Params = @{
            name = $Name
        }
    }
    Invoke-DuoRequest @DuoRequest

}