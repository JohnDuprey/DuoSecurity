function Remove-DuoWebAuthnCredential {
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
