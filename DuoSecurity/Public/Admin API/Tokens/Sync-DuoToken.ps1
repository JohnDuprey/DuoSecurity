function Sync-DuoToken {
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('token_id')]
        [string]$TokenId,

        [Parameter(Mandatory = $true)]
        [string]$Code1,

        [Parameter(Mandatory = $true)]
        [string]$Code2,

        [Parameter(Mandatory = $true)]
        [string]$Code3
    )

    process {
        $Params = @{
            code1 = $Code1
            code2 = $Code2
            code3 = $Code3
        }

        $DuoRequest = @{
            Method = 'POST'
            Path   = '/admin/v1/tokens/{0}/resync' -f $TokenId
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
