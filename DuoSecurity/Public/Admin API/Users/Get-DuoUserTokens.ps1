function Get-DuoUserTokens {
    <#
    .SYNOPSIS
    Retrieve Hardware Tokens by User ID

    .DESCRIPTION
    Returns a paged list of OTP hardware tokens associated with the user with ID user_id. To fetch all results, call repeatedly with the offset parameter as long as the result metadata has a next_offset value. Requires "Grant read resource" API permission.

    .PARAMETER UserId
    The ID of the user

    .EXAMPLE
    Get-DuoUserTokens -UserId SOMEUSERID

    .LINK
    https://duo.com/docs/adminapi#retrieve-hardware-tokens-by-user-id

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
            Path   = '/admin/v1/users/{0}/tokens' -f $UserId
        }
        Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest
    }
}
