function Get-DuoWebAuthnCredentials {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias('webauthnkey')]
        [string]$WebAuthnKey
    )

    process {
        switch ($PSCmdlet.ParameterSetName) {
            'Single' {
                $Path = '/admin/v1/webauthncredentials/{0}' -f $TokenId
            }
            'List' {
                $Path = '/admin/v1/webauthncredentials'
            }
        }
    
        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
            Params = $Params
        }

        switch ($PSCmdlet.ParameterSetName) {
            'Single' {
                $Request = Invoke-DuoRequest @DuoRequest
                if ($Request.stat -ne 'OK') {
                    $Request
                }
                else {
                    $Request.response
                } 
            }
            default { 
                Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest 
            }
        }
    }
} 

Set-Alias -Name Get-DuoWebAuthnCredential -Value Get-DuoTokens
