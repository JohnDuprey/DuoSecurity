function Get-DuoPhones {
    <#
    .SYNOPSIS
    Retrieve Phones
    
    .DESCRIPTION
    Returns a single phone or a paged list of phones. If no number or extension parameters are provided, the list will contain all phones. Otherwise, the list will contain either single phone (if a match was found), or no phones. Requires "Grant read resource" API permission.
    
    .PARAMETER PhoneId
    Id of phone

    .PARAMETER Number
    Specify a phone number in E.164 format to look up a single phone.

    .PARAMETER Extension
    The extension, if necessary.
    
    .EXAMPLE
    Get-DuoPhones
    #>
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias('phone_id')]
        [string]$PhoneId,

        [Parameter()]
        [string]$Number,

        [Parameter()]
        [int]$Extension
    )

    process {
        if ($GroupId) {
            $Path = '/admin/v2/phones/{0}' -f $PhoneId
        }
        else {
            $Path = '/admin/v1/phones'
            $Params = @{}
            if ($Number) { $Params.number = $Number }
            if ($Extension) { $Params.extension = $Extension }
        }
    
        $DuoRequest = @{
            Method = 'GET'
            Path   = $Path
        }
        if ($Params) {
            $DuoRequest.Params = $Params
            Invoke-DuoPaginatedRequest -DuoRequest $DuoRequest
        }
        else {
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

Set-Alias -Name Get-DuoPhone -Value Get-DuoPhones
