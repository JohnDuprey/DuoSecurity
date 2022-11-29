function New-DuoUserBypassCodes {
    [CmdletBinding(DefaultParameterSetName = 'Count')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,
        
        [Parameter(ParameterSetName = 'Count')]
        [ValidateRange(1, 10)]
        [int]$Count = 10,

        [Parameter(ParameterSetName = 'Codes')]
        [string[]]$Codes = @(),

        [int]$ReuseCount = 1,
        [int]$ValidSecs = 0
    )

    process { 
        $Params = @{
            reuse_count = $ReuseCount
            valid_secs  = $ValidSecs
        }

        if ($Codes) {
            $Params.codes = $Codes -join ','
        }
        else {
            $Params.count = $Count
        }

        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/users/{0}/bypass_codes' -f $UserId
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