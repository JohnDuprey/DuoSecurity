function Get-DuoPolicies {
    <#
    .SYNOPSIS
    Retrieve Policies

    .DESCRIPTION
    Retrieve a complete set of all policies. Includes all policy section data for each policy. Requires "Grant read resource" API permission.

    .PARAMETER PolicyKey
    The key for the Policy

    .EXAMPLE
    Get-DuoPolicies

    .LINK
    https://duo.com/docs/adminapi#retrieve-policies

    .LINK
    https://duo.com/docs/adminapi#retrieve-policy-by-id

    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias('policy_key')]
        [string]$PolicyKey
    )

    process {
        if ($PolicyKey) {
            $Path = '/admin/v2/policies/{0}' -f $PolicyKey
        } else {
            $Path = '/admin/v2/policies'
        }

        $DuoRequest = @{
            Method           = 'GET'
            Path             = $Path
            SignatureVersion = 5
        }

        if ($EndpointKey) {
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

Set-Alias -Name Get-DuoEndpoint -Value Get-DuoEndpoints
