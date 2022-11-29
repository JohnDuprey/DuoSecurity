function Remove-DuoGroup {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('group_id')]
        [string]$GroupId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/groups/{0}' -f $GroupId
        }

        if ($PSCmdlet.ShouldProcess($GroupId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
