function Remove-DuoAdminActivation {
    <#
    .SYNOPSIS
    Delete Pending Administrator Activation
    
    .DESCRIPTION
    Delete the pending admin activation with ID admin_activation_id from the system. Requires "Grant administrators" API permission.
    
    .PARAMETER AdminActivationId
    The ID of the Administrator activation
    
    .EXAMPLE
    Remove-DuoAdminActivation -AdminActivationId SOMEACTIVATIONID
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('admin_activation_id')]
        [string]$AdminActivationId
    )
    process {
        $DuoRequest = @{
            method = 'DELETE'
            path   = '/admin/v1/admins/activations/{0}' -f $AdminActivationId
        }
        if ($PSCmdlet.ShouldProcess($AdminId)) {
            Invoke-DuoRequest @DuoRequest
        }
    }
}
