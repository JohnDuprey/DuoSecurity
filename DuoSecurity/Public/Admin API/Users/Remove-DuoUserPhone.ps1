function Remove-DuoUserPhone {
    <#
    .SYNOPSIS
    Disassociate Phone from User
    
    .DESCRIPTION
    Disassociate a phone from the user with ID user_id. The API will not automatically delete the phone after removing the last user association; remove it permanently with Delete Phone. This method returns 200 if the phone was found or if no such phone exists. Requires "Grant write resource" API permission.
    
    .PARAMETER UserId
    The ID of the User
    
    .PARAMETER PhoneId
    The ID of the Phone
    
    .EXAMPLE
    Remove-DuoUserPhone -UserId SOMEUSERID -PhoneId SOMEPHONEID
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('user_id')]
        [string]$UserId,
        
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true)]
        [Alias('phone_id')]
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