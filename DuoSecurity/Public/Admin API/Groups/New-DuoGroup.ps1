function New-DuoGroup {
    <#
    .SYNOPSIS
    Create Group
    
    .DESCRIPTION
    Create a new group. Requires "Grant write resource" API permission.
    
    .PARAMETER Name
    The name of the group.
    
    .PARAMETER Description
    The description of the group.
    
    .PARAMETER Status
    The authentication status of the group.
    
    .EXAMPLE
    New-DuoGroup -Name 'Testing Group' -Description 'This is for testing purposes' -Status 'Active'
    
    .LINK
    https://duo.com/docs/adminapi#create-group
    
    .NOTES

    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter()]
        [string]$Description = '',

        [Parameter()]
        [ValidateSet('Active', 'Bypass', 'Disabled')]
        [string]$Status = 'Active'
    )

    process {
        $Params = @{
            name   = $Name
            desc   = $Description
            status = $Status.ToLower()
        }

        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/groups'
            Params = $Params
        }

        if ($PSCmdlet.ShouldProcess($Name)) {
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
