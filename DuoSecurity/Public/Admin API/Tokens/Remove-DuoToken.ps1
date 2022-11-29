function Remove-DuoToken {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('token_id')]
        [string]$TokenId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/tokens/{0}' -f $TokenId
        }

        if ($PSCmdlet.ShouldProcess($TokenId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
