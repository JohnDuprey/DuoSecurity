function Get-DuoUsers {
    [CmdletBinding(DefaultParameterSetName = 'List')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true, ParameterSetName = 'Single')]
        [Alias('user_id')]
        $UserId,
        [Parameter(ParameterSetName = 'List')]
        $Username
    )

    process {
        switch ($PSCmdlet.ParameterSetName) {
            'List' {
                $Path = '/admin/v1/users'
            }
            'Single' {
                $Path = '/admin/v1/users/{0}' -f $UserId
            }
        }

        $Params = @{}
        if ($Username) {
            $Params.username = $Username
        }
        
        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
            Params = $Params
        }

        switch ($PSCmdlet.ParameterSetName) {
            'List' { 
                Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest 
            }
            'Single' {
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
} 

Set-Alias -Name Get-DuoUser -Value Get-DuoUsers