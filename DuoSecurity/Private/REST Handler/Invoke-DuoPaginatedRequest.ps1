function Invoke-DuoPaginatedRequest {
    <#
    .SYNOPSIS
    Paginated requests to Duo API
    
    .DESCRIPTION
    Wraps Invoke-DuoRequest setting offset to next_offset
    
    .PARAMETER DuoRequest
    Request to paginate
    
    #>
    [CmdletBinding()]
    Param(
        $DuoRequest
    )

    do { 
        $Request = Invoke-DuoRequest @DuoRequest
        $Request.response
        if ($Request.metadata.next_offset) {
            $DuoRequest.Params.offset = $Request.metadata.next_offset
        } 
    } while ($Request.metadata.next_offset -and $Request.stat -eq 'OK')

    if ($Request.stat -ne 'OK') {
        $Request
    }
}
