function Remove-DuoUserFromGroup {
    <#
    .SYNOPSIS
    Disassociate Group from User
    
    .DESCRIPTION
    Disassociate a group from the user with ID user_id. This method will return 200 if the group was found or if no such group exists. Requires "Grant write resource" API permission.
    
    .PARAMETER UserId
    The ID of the User
    
    .PARAMETER GroupId
    The ID of the Group
    
    .EXAMPLE
    Remove-DuoUserFromGroup -UserId SOMEUSERID -GroupId SOMEGROUPID

    .LINK
    https://duo.com/docs/adminapi#disassociate-group-from-user

    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,

        [Parameter(Mandatory = $true)]
        [string]$GroupId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/users/{0}/groups/{1}' -f $UserId, $GroupId
        }

        if ($PSCmdlet.ShouldProcess($GroupId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}