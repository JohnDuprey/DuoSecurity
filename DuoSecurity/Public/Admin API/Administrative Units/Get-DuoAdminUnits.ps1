function Get-DuoAdminUnits {
    <#
    .SYNOPSIS
    Retrieve Administrative Units

    .DESCRIPTION
    Returns a single administrative unit or a paged list of all administrative units if no parameters specified. Requires "Grant administrators" API permission.

    Optionally specify at most one parameter to return a list of administrative units associated with the given administrator, group, or integration.

    .PARAMETER AdminUnitId
    The ID of the Adminstrative Unit

    .LINK
    https://duo.com/docs/adminapi#retrieve-administrative-units

    .LINK
    https://duo.com/docs/adminapi#retrieve-administrative-unit-details

    .EXAMPLE
    Get-DuoAdminUnits
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias('admin_unit_id')]
        [string]$AdminUnitId
    )

    process {
        if ($AdminId) {
            $Path = '/admin/v1/administrative_units/{0}' -f $AdminId
        } else {
            $Path = '/admin/v1/administrative_units'
        }

        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
        }

        if ($AdminId) {
            $Request = Invoke-DuoRequest @DuoRequest
            if ($Request.stat -ne 'OK') {
                $Request
            } else {
                $Request.response
            }
        } else {
            Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest
        }
    }
}

Set-Alias -Name Get-DuoAdministrativeUnit -Value Get-DuoAdmininstrativeUnits
