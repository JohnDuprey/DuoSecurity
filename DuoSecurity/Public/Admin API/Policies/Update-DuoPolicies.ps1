function Update-DuoPolicies {
    <#
    .SYNOPSIS
    Update policy

    .DESCRIPTION
    Update policy section data for all policies or a set of specified policy_key values. Requires "Grant write resource" API permission.

    .PARAMETER policies_to_update
    The list of policies to update.

    Key/Value
    edit_all_policies	
    Is true if the changes should be applied to all policies (default). Otherwise false.

    edit_list	
    An array of policy keys to apply the changes to. Ignored if edit_all_policies is true.

    .PARAMETER policy_changes	Required	
    The list of changes to apply to the policies specified in policies_to_update.

    Key/Value
    sections	
    The list of policy sections to be updated, with associated keys/values for each section. See Policy Section Data for all sections and their keys/values.

    sections_to_delete	
    An array of section names to remove from the specified policies. Note that sections cannot be removed from the global policy.
    
    .EXAMPLE
    Update-DuoPolicies -policy_changes @{sections = @{authentication_methods = @{blocked_auth_list = @('webauthn-roaming', 'webauthn-platform')}};sections_to_delete = @()}

    .LINK
    https://duo.com/docs/adminapi#update-policies

    .NOTES
    General notes
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter()]
        [hashtable]$policies_to_update = @{edit_all_policies = $true },

        [Parameter(mandatory = $true)]
        [hashtable]$policy_changes
    )

    $Params = @{}
    if ($policies_to_update) { $Params.policies_to_update = $policies_to_update }
    if ($policy_changes) { $Params.policy_changes = $policy_changes }

    $DuoRequest = @{
        Method           = 'PUT'
        Path             = '/admin/v2/policies/update'
        SignatureVersion = 5
        Body             = $Params | ConvertTo-Json -Depth 10 -Compress
    }
    if ($PSCmdlet.ShouldProcess($policies_to_update)) {
        $Request = Invoke-DuoRequest @DuoRequest
        if ($Request.stat -ne 'OK') {
            $Request
        }
        else {
            $Request.response
        }
    }
}

Set-Alias -Name Update-DuoPolicy -Value Update-DuoPolicies