function Remove-DuoPhone {
    <#
    .SYNOPSIS
    Delete Phone
    
    .DESCRIPTION
    Delete the phone with ID phone_id from the system. Requires "Grant write resource" API permission.
    
    .PARAMETER PhoneId
    Id of phone
    
    .EXAMPLE
    Remove-DuoPhone -PhoneId SOMEDUOID

    .LINK
    https://duo.com/docs/adminapi#delete-phone
    
    #>
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
