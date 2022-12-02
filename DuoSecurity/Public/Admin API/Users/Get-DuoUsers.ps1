function Get-DuoUsers {
    <#
    .SYNOPSIS
    Retrieve Users
    
    .DESCRIPTION
    Returns a single user or a paged list of users. If username is not provided, the list will contain all users. If username is provided, the list will either contain a single user (if a match was found) or no users. Requires "Grant read resource" API permission.
    
    .PARAMETER UserId
    Specify a user id
    
    .PARAMETER Username
    Specify a user name (or username alias) to look up a single user.
    
    .EXAMPLE
    Get-DuoUser -Username bob

    .LINK 
    https://duo.com/docs/adminapi#retrieve-users

    #>
    [CmdletBinding(DefaultParameterSetName = 'List')]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true, Mandatory = $true, ParameterSetName = 'Single')]
        [Alias('user_id')]
        [string]$UserId,

        [Parameter(ParameterSetName = 'List')]
        [string]$Username
    )

    process {
        switch ($PSCmdlet.ParameterSetName) {
            'List' {
                $Path = '/admin/v1/users'
            }
            'Single' {
                $Path = '/admin/v1/users/{0}' -f $UserId
            }
        }

        $Params = @{}
        if ($Username) {
            $Params.username = $Username
        }
        
        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
            Params = $Params
        }

        switch ($PSCmdlet.ParameterSetName) {
            'List' { 
                Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest 
            }
            'Single' {
                $Request = Invoke-DuoRequest @DuoRequest
                if ($Request.stat -ne 'OK') {
                    $Request
                }
                else {
                    $Request.response
                } 
            }
        }
    }
} 

Set-Alias -Name Get-DuoUser -Value Get-DuoUsers