function Sync-DuoUserFromDirectory {
    <#
    .SYNOPSIS
    Synchronize User from Directory

    .DESCRIPTION
    Initiate a sync to create, update, or mark for deletion the user specified by username against the directory specified by the directory_key. The directory_key for a directory can be found by navigating to Users -> Directory Sync in the Duo Admin Panel, and then clicking on the configured directory. Learn more about syncing individual users from Active Directory, OpenLDAP, or Azure Active Directory. Requires "Grant write resource" API permission.

    .PARAMETER DirectoryKey
    The directory key to sync from

    .PARAMETER Username
    The user to update or create via directory sync. This should be the same as the value for the user's username attribute in the source directory as configured in the sync.

    .EXAMPLE
    Sync-DuoUserFromDirectory -DirectoryKey 123456 -Username mbolton

    .LINK
    https://duo.com/docs/adminapi#synchronize-admin-from-directory

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [Alias('directory_key')]
        [string]$DirectoryKey,

        [Parameter(Mandatory = $true)]
        [string]$Username
    )

    Process {
        $Params = @{
            username = $Username
        }

        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/users/directorysync/{0}/syncuser' -f $DirectoryKey
            Params = $Params
        }

        if ($PSCmdlet.ShouldProcess($Email)) {
            $Request = Invoke-DuoRequest @DuoRequest
            if ($Request.stat -ne 'OK') {
                $Request
            } else {
                $Request.response
            }
        }
    }
}
