function Update-DuoGroup {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('group_id')]
        [string]$GroupId,

        [string]$Name,

        [string]$Description,

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

        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        }
        else {
            $Request.response
        }
    }
}
