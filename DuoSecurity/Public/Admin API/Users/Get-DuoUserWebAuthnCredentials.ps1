function Get-DuoUserWebAuthnCredentials {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId
    )

    process { 
        $DuoRequest = @{
            Method = 'GET'
            Path   = '/admin/v1/users/{0}/webauthncredentials' -f $UserId    
        }
        Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest
    }
}
