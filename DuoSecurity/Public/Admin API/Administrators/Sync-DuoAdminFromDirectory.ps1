function Sync-DuoAdminFromDirectory {
    <#
    .SYNOPSIS
    Synchronize Admin from Directory
    
    .DESCRIPTION
    Initiate a sync to create, update, or mark for deletion the administrator specified by email against the directory specified by the directory_key. The directory_key for a directory can be found by navigating to Administrators → Admin Directory Sync in the Duo Admin Panel, and then clicking on the configured directory. Learn more about syncing individual admins from Active Directory, OpenLDAP, or Azure Active Directory. Requires "Grant administrators" API permission.
    
    .PARAMETER DirectoryKey
    The directory key to sync from

    .PARAMETER Email
    Email address of the admin to update or create via directory sync. This should be the same as the value for the admin's email attribute in the source directory as configured in the sync. Administrators with "Owner" role may not be synced.
    
    .EXAMPLE
    Sync-DuoAdminFromDirectory -DirectoryKey 123456 -Email admin@domain.com

    .LINK
    https://duo.com/docs/adminapi#synchronize-admin-from-directory
    
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [Alias('directory_key')]
        [string]$DirectoryKey,

        [Parameter(Mandatory = $true)]
        [string]$Email
    )

    Process {
        $Params = @{
            email = $Email
        }

        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/admins/directorysync/{0}/syncadmin' -f $DirectoryKey
            Params = $Params
        }

        if ($PSCmdlet.ShouldProcess($Email)) {
            $Request = Invoke-DuoRequest @DuoRequest
            if ($Request.stat -ne 'OK') {
                $Request
            }
            else {
                $Request.response
            }
        }
    }
}
