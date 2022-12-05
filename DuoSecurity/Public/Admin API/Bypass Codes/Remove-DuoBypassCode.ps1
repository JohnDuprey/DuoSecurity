function Remove-DuoBypassCode {
    <#
    .SYNOPSIS
    Delete Bypass Code
    
    .DESCRIPTION
    Delete the bypass code with ID bypass_code_id from the system. Requires "Grant write resource" API permission.
    
    .PARAMETER BypassCodeId
    ID of bypass code to remove
    
    .EXAMPLE
    Remove-DuoBypassCode -BypassCodeId SOMEDUOID

    .LINK
    https://duo.com/docs/adminapi#delete-bypass-code
    
    #>
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
