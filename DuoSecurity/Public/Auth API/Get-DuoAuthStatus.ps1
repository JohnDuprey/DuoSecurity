function Get-DuoAuthStatus {
    <#
    .SYNOPSIS
    Duo API Auth Status
    
    .DESCRIPTION
    The /auth_status endpoint "long-polls" for the next status update from the authentication process for a given transaction. That is to say, if no status update is available at the time the request is sent, it will wait until there is an update before returning a response.
    
    .PARAMETER TxId
    The transaction ID of the authentication attempt, as returned by the /auth endpoint.
    
    .EXAMPLE
    Get-DuoAuthStatus -TxId 66cc8d20-fdfa-41bc-8b74-1a3b095d55f7

    .LINK
    https://duo.com/docs/authapi#/auth_status
    
    .NOTES
    
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [string]$TxId
    )

    process { 
        $Params = @{
            txid = $TxId
        }
        
        $DuoRequest = @{
            Method = 'GET'
            Path   = '/auth/v2/auth_status'
            Params = $Params
        }

        $Response = Invoke-DuoRequest @DuoRequest
        if ($Response.stat -eq 'OK') {
            $Response.response
        }
        else { 
            $Response
        }
    }
}
