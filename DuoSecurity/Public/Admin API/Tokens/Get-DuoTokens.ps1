function Get-DuoTokens {
    [CmdletBinding(DefaultParameterSetName='List')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'Single')]
        [Alias('token_id')]
        [string]$TokenId,

        [Parameter(ParameterSetName = 'List')]
        [ValidateSet('h6', 'h8', 't6', 't8', 'yk', 'd1')]
        [string]$Type,

        [Parameter(ParameterSetName = 'List')]
        [string]$Serial
    )

    process {
        switch ($PSCmdlet.ParameterSetName) {
            'Single' {
                $Path = '/admin/v1/tokens/{0}' -f $TokenId
            }
            'List' {
                $Path = '/admin/v1/tokens'
            }
        }

        $Params = @{}
        if ($Type) { $Params.type = $Type }
        if ($Serial) { $Params.serial = $Serial }
    
        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
            Params = $Params
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

Set-Alias -Name Get-DuoToken -Value Get-DuoTokens
