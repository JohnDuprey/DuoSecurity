function Get-DuoUserBypassCodes {
    <#
    .SYNOPSIS
    Retrieve Bypass Codes by User ID

    .DESCRIPTION
    Returns a paged list of bypass code metadata associated with the user with ID user_id. Does not return the actual bypass codes. Requires "Grant read resource" API permission.

    .PARAMETER UserId
    The ID of the user

    .EXAMPLE
    Get-DuoUserBypassCodes -UserId SOMEUSERID

    .LINK
    https://duo.com/docs/adminapi#retrieve-bypass-codes-by-user-id

    .NOTES

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
            Path   = '/admin/v1/users/{0}/bypass_codes' -f $UserId
        }
        Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest
    }
}
