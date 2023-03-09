function Add-DuoUserToGroup {
    <#
    .SYNOPSIS
    Associate Group with User

    .DESCRIPTION
    Associate a group with ID group_id with the user with ID user_id. Requires "Grant write resource" API permission.

    Object limits: 100 groups per user.

    .PARAMETER UserId
    The ID of the user

    .PARAMETER GroupId
    The ID of the group to associate with the user.

    .EXAMPLE
    Add-DuoUserToGroup -UserId SOMEUSERID -GroupId SOMEGROUPID

    .LINK
    https://duo.com/docs/adminapi#associate-group-with-user

    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,

        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('group_id')]
        [string]$GroupId
    )

    process {
        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/users/{0}/groups' -f $UserId
            Params = @{
                group_id = $GroupId
            }
        }
        Invoke-DuoRequest @DuoRequest
    }
}
