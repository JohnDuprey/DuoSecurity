function Sync-DuoToken {
    <#
    .SYNOPSIS
    Resync Hardware Token
    
    .DESCRIPTION
    Resynchronize the hardware token with ID token_id by providing three successive codes from the token. Only HOTP and Duo-D100 tokens can be resynchronized. YubiKey tokens operating in their native AES mode do not need resynchronization. Requires "Grant write resource" API permission.
    
    .PARAMETER TokenId
    Id of token
    
    .PARAMETER Code1
    The first code from the token.
    
    .PARAMETER Code2
    The second code from the token.
    
    .PARAMETER Code3
    The third code from the token.
    
    .EXAMPLE
    Sync-DuoToken -TokenId SOMEDUOID -Code1 123456 -Code2 789012 -Code3 345678
    #>
    [CmdletBinding(SupportsShouldProcess)]
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

        if ($PSCmdlet.ShouldProcess($TokenId)) {
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
