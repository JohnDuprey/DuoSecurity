function Remove-DuoGroup {
    <#
    .SYNOPSIS
    Delete Group
    
    .DESCRIPTION
    Delete a group. Requires "Grant write resource" API permission.
    
    .PARAMETER GroupId
    Group Id to remove
    
    .EXAMPLE
    Remove-DuoGroup -GroupId SOMEDUOID

    .LINK
    https://duo.com/docs/adminapi#delete-group
    
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('group_id')]
        [string]$GroupId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/groups/{0}' -f $GroupId
        }

        if ($PSCmdlet.ShouldProcess($GroupId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
