function Remove-DuoUser {
    <#
    .SYNOPSIS
    Delete User
    
    .DESCRIPTION
    Delete the user with ID user_id from the system. The API will not automatically delete phones associated with the user; remove them permanently with Delete Phone. This method returns 200 if the phone was found or if no such phone exists. Requires "Grant write resource" API permission.

    Users deleted by the API do not get moved into the Trash view as "Pending Deletion" as they would if removed by directory sync, inactive user expiration, or interactively from the Duo Admin Panel, and therefore are not available for restoration. Users deleted via the API are immediately and permanently removed from Duo.
    
    .PARAMETER UserId
    The ID of the User
    
    .EXAMPLE
    Remove-DuoUser -UserId SOMEUSERID
    
    .NOTES
    General notes
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/users/{0}' -f $UserId
        }

        if ($PSCmdlet.ShouldProcess($UserId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
