function Get-DuoAdminActivations {
    <#
    .SYNOPSIS
    Retrieve Pending Administrator Activations
    
    .DESCRIPTION
    Returns a paged list of pending administrator activations. Requires "Grant administrators" API permission.

    .EXAMPLE
    Get-DuoAdminActivations
    #>
    [CmdletBinding()]
    Param()

    process {
        $Path = '/admin/v1/admins/activations'
    
        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
        }

        Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest 
          
    }
} 
