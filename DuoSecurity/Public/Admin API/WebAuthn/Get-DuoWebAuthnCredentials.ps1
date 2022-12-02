function Get-DuoWebAuthnCredentials {
    <#
    .SYNOPSIS
    Retrieve WebAuthn Credentials by Key
    
    .DESCRIPTION
    Return the single WebAuthn credential with webauthnkey. Requires "Grant read resource" API permission.
    
    .PARAMETER WebAuthnKey
    WebAuthn Key
    #>
    [CmdletBinding(DefaultParameterSetName='List')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName='Single')]
        [Alias('webauthnkey')]
        [string]$WebAuthnKey
    )

    process {
        $DuoRequest = @{
            Method = 'GET'
            Params = $Params
        }

        switch ($PSCmdlet.ParameterSetName) {
            'Single' {
                $DuoRequest.Path = '/admin/v1/webauthncredentials/{0}' -f $WebAuthnKey
                $Request = Invoke-DuoRequest @DuoRequest
                if ($Request.stat -ne 'OK') {
                    $Request
                }
                else {
                    $Request.response
                } 
            }
            'List' {
                $DuoRequest.Path = '/admin/v1/webauthncredentials'
                Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest 
            }
        }
    }
} 

Set-Alias -Name Get-DuoWebAuthnCredential -Value Get-DuoTokens
