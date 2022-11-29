function Remove-DuoUserPhone {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,
        
        [Parameter(Mandatory = $true)]
        [string]$PhoneId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/users/{0}/phones/{1}' -f $UserId, $PhoneId
        }

        if ($PSCmdlet.ShouldProcess($PhoneIds)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}