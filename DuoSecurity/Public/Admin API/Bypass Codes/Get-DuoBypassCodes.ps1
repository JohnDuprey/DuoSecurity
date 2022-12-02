function Get-DuoBypassCodes {
    <#
    .SYNOPSIS
    Retrieve Bypass Codes
    
    .DESCRIPTION
    Returns information about a single bypass code or a paged list of information about all bypass codes. Output does not include the actual bypass codes. Requires "Grant read resource" API permission.
    
    .PARAMETER BypassCodeId
    Bypass Code Id to retrieve
    
    .EXAMPLE
    Get-DuoBypassCodes
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias('bypass_code_id')]
        [string]$BypassCodeId
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

        if ($BypassCodeId) {
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

Set-Alias -Name Get-DuoBypassCode -Value Get-DuoBypassCodes
