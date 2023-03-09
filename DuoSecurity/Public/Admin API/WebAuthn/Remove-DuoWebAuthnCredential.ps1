function Remove-DuoWebAuthnCredential {
    <#
    .SYNOPSIS
    Delete WebAuthn Credential

    .DESCRIPTION
    Delete the WebAuthn credential with key webauthnkey from the system. Requires "Grant write resource" API permission.

    .PARAMETER WebAuthnKey
    WebAuthn Key

    .EXAMPLE
    Remove-DuoWebAuthnCredential -WebAuthnKey SOMEWEBAUTHNKEY

    .LINK
    https://duo.com/docs/adminapi#delete-webauthn-credential
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [string]$WebAuthnKey
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/webauthncredentials/{0}' -f $WebAuthnKey
        }

        if ($PSCmdlet.ShouldProcess($WebAuthnKey)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
