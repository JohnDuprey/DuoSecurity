function Get-DuoUserWebAuthnCredentials {
    <#
    .SYNOPSIS
    Retrieve WebAuthn Credentials by User ID

    .DESCRIPTION
    Returns a list of WebAuthn credentials associated with the user with ID user_id. Requires "Grant read resource" API permission.

    .PARAMETER UserId
    The User ID to use

    .EXAMPLE
    Get-DuoUserWebAuthnCredentials -UserId SOMEUSERID

    .LINK
    https://duo.com/docs/adminapi#retrieve-webauthn-credentials-by-user-id

    #>
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
