function Add-DuoUserPhone {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,

        [Parameter(Mandatory = $true)]
        [string]$PhoneId
    )

    process { 
        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/users/{0}/phones' -f $UserId
            Params = @{
                phone_id = $PhoneId
            }    
        }
        Invoke-DuoRequest @DuoRequest
    }
}
