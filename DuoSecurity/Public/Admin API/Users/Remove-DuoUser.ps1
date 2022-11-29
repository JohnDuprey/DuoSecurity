function Remove-DuoUser {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/users/{0}' -f $UserId
        }

        if ($PSCmdlet.ShouldProcess($UserId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
