function Remove-DuoPhone {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('phone_id')]
        [string]$PhoneId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/phones/{0}' -f $PhoneId
        }

        if ($PSCmdlet.ShouldProcess($PhoneId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
