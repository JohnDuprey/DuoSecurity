function Get-DuoBypassCodes {
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

        switch ($PSCmdlet.ParameterSetName) {
            'Single' {
                $Request = Invoke-DuoRequest @DuoRequest
                if ($Request.stat -ne 'OK') {
                    $Request
                }
                else {
                    $Request.response
                } 
            }
            default { 
                Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest 
            }
        }
    }
} 

Set-Alias -Name Get-DuoBypassCode -Value Get-DuoBypassCodes
