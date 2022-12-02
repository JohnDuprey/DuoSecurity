function Add-DuoUserPhone {
    <#
    .SYNOPSIS
    Associate Phone with User
    
    .DESCRIPTION
    Associate a phone with the user with ID user_id. Requires "Grant write resource" API permission.

Object limits: 100 phones per user; 100 users per phone.
    
    .PARAMETER UserId
    The ID of the user
    
    .PARAMETER PhoneId
    The ID of the phone to associate with the user.
    
    .EXAMPLE
    Add-DuoUserPhone -UserId SOMEUSERID -PhoneId SOMEPHONEID

    #>
    [CmdletBinding()]
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
            Method = 'POST'
            Path   = '/admin/v1/users/{0}/phones' -f $UserId
            Params = @{
                phone_id = $PhoneId
            }    
        }
        Invoke-DuoRequest @DuoRequest
    }
}
