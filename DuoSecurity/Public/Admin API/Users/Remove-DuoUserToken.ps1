function Remove-DuoUserToken {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,
        
        [Parameter(Mandatory = $true)]
        [string]$TokenId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/users/{0}/tokens/{1}' -f $UserId, $TokenId
        }

        if ($PSCmdlet.ShouldProcess($TokenId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}