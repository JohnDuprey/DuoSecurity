function Get-DuoEndpoints {
    <#
    .SYNOPSIS
    Retrieve Endpoints
    
    .DESCRIPTION
    Returns a single endpoint or a paged list of endpoints. Requires "Grant read resource" API permission.

    Information for a given endpoint is purged after 30 days of inactivity.

    Endpoint information retrievable by Duo Beyond and Duo Access customers. In addition, some response information is available only with Duo Beyond.

    .PARAMETER EndpointKey
    The key for the endpoint
   
    .EXAMPLE
    Get-DuoEndpoints

    .LINK
    https://duo.com/docs/adminapi#retrieve-endpoints

    .LINK
    https://duo.com/docs/adminapi#retrieve-endpoint-by-id
    
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias('epkey')]
        [string]$EndpointKey
    )

    process {
        if ($BypassCodeId) {
            $Path = '/admin/v1/bypass_codes/{0}' -f $BypassCodeId
        }
        else {
            $Path = '/admin/v1/bypass_codes'
        }
    
        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
        }

        if ($EndpointKey) {
            $Request = Invoke-DuoRequest @DuoRequest
            if ($Request.stat -ne 'OK') {
                $Request
            }
            else {
                $Request.response
            } 
        }
        else { 
            Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest 
        }  
    }
} 

Set-Alias -Name Get-DuoEndpoint -Value Get-DuoEndpoints
