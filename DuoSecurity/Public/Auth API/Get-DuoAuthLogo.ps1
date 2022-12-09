function Get-DuoAuthLogo {
    <#
    .SYNOPSIS
    Duo Auth Logo
    
    .DESCRIPTION
    The /logo endpoint provides a programmatic way to retrieve your stored logo.
    
    .PARAMETER FilePath
    Where to save the logo
    
    .EXAMPLE
    Get-DuoAuthLogo -FilePath ./logo.png

    .LINK
    https://duo.com/docs/authapi#/logo
    
    .NOTES
    
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$FilePath
    )

    process {        
        $DuoRequest = @{
            Method = 'GET'
            Path   = '/auth/v2/logo'
            Params = @{
                FilePath = $FilePath
            }
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
