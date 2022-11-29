function Remove-DuoUserFromGroup {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,

        [Parameter(Mandatory = $true)]
        [string]$GroupId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/users/{0}/groups/{1}' -f $UserId, $GroupId
        }

        if ($PSCmdlet.ShouldProcess($GroupId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}