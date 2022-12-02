function Update-DuoGroup {
    <#
    .SYNOPSIS
    Update Group
    
    .DESCRIPTION
    Update information about a group. Requires "Grant write resource" API permission.
    
    .PARAMETER GroupId
    Group Id to update
    
    .PARAMETER Name
    Update the name of the group.
    
    .PARAMETER Description
    Update the description of the group.
    
    .PARAMETER Status
    The authentication status of the group.
    
    .EXAMPLE
    Update-DuoGroup -GroupId 'SOMEDUOID' -Status 'Disabled'
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('group_id')]
        [string]$GroupId,

        [Parameter()]
        [string]$Name,

        [Parameter()]
        [string]$Description,

        [Parameter()]
        [ValidateSet('Active', 'Bypass', 'Disabled')]
        [string]$Status
    )

    process {
        $Params = @{}
        if ($Name) { $Params.name = $Name }
        if ($Description) { $Params.desc = $Description }
        if ($Status) { $Params.status = $Status.ToLower() }

        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/groups/{0}' -f $GroupId
            Params = $Params
        }

        if ($PSCmdlet.ShouldProcess($GroupId)) {
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
