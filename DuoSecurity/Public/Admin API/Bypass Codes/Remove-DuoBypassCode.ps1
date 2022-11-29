function Remove-DuoBypassCode {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('bypass_code_id')]
        [string]$BypassCodeId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/bypass_codes/{0}' -f $BypassCodeId
        }
        if ($PSCmdlet.ShouldProcess($BypassCodeId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
