function Invoke-DuoRequest {
    <#
    .SYNOPSIS
    Main Duo API function
    
    .DESCRIPTION
    Calls Duo API with signed token for request
    
    .PARAMETER Method
    GET,POST,DELETE
    
    .PARAMETER Path
    Path to API endpoint
    
    .PARAMETER Params
    Hashtable of parameters

    .PARAMETER NoAuth
    Do not send authorization header

    .PARAMETER FilePath
    Path to save output file to
    
    .EXAMPLE
    Invoke-DuoRequest -Path '/admin/v1/users' -Method GET
    #>
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string]$Method = 'GET',

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Path,

        [Parameter()]
        [hashtable]$Params = @{},

        [Parameter()]
        [switch]$NoAuth,

        [Parameter()]
        [string]$FilePath
    )

    # Get API credentials
    if ($Path -match '/admin' -and $Script:DuoApiHost) {
        $ApiHost = $script:DuoApiHost
        $IntegrationKey = $script:DuoIntegrationKey
        $SecretKey = $script:DuoSecretKey
        
        if ($script:DuoAccountId) {
            $AccountId = $script:DuoAccountId
        }
    }

    # Replace api host with parent account api host when switching between accounts
    elseif ($Path -match '/accounts' -and $script:DuoAccountsApiHost) {
        $AccountId = ''
        $ApiHost = $script:DuoAccountsApiHost
        $IntegrationKey = $script:DuoAccountsIntegrationKey
        $SecretKey = $script:DuoAccountsSecretKey
    }

    # Replace api host with parent account api host when switching between accounts
    elseif ($Path -match '/auth' -and $script:DuoAuthIntegrationKey) {
        $AccountId = ''
        $ApiHost = $script:DuoAuthApiHost
        $IntegrationKey = $script:DuoAuthIntegrationKey
        $SecretKey = $script:DuoAuthSecretKey
    }

    # Check credentials exists
    if (!$ApiHost -or !$IntegrationKey -or !$SecretKey) {
        Write-Error 'API Credentials not set, run Set-DuoApiAuth'
        return $false
    }

    # RFC 2822 date format in UTC
    $XDuoDate = (Get-Date).ToUniversalTime().ToString('ddd, dd MMM yyyy HH:mm:ss -0000')
    
    # Assemble parameters
    $ParamCollection = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)

    if ($AccountId) {
        Write-Verbose "account_id = $AccountId"
        $ParamCollection.Add('account_id', $AccountId)
    }
    
    # Sort parameters
    foreach ($Item in ($Params.GetEnumerator() | Sort-Object -Property Key)) {
        $ParamCollection.Add($Item.Key, $Item.Value)
    }

    # Query string
    $Request = $ParamCollection.ToString() -replace '%7E', '~' -replace '\+', '%20'

    # Build Duo signature body linefeed separated
    $SigantureParts = @(
        $XDuoDate
        $Method.ToUpper()
        $ApiHost.ToLower()
        $Path
        $Request
    )
    $SignatureBody = $SigantureParts -join "`n"

    # Encode signature with secretbytes
    [byte[]]$KeyBytes = [System.Text.Encoding]::UTF8.GetBytes($SecretKey)
    [byte[]]$DataBytes = [System.Text.Encoding]::UTF8.GetBytes($SignatureBody)

    # Generate an HMAC SHA1 hash
    $HmacSha1 = New-Object System.Security.Cryptography.HMACSHA1
    $HmacSha1.Key = $KeyBytes
    $null = $HmacSha1.ComputeHash($DataBytes)
    $HashHex = [System.BitConverter]::ToString($HmacSha1.Hash)
    $Signature = $HashHex.Replace('-', '').ToLower()

    # Build base64 encoded auth string with IntegrationKey and Signature
    $AuthString = 'Basic ' + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(('{0}:{1}' -f $IntegrationKey, $Signature)))

    # Assembled auth headers
    $Headers = @{
        'X-Duo-Date'    = $XDuoDate
        'Authorization' = $AuthString
    }

    if ($NoAuth) {
        $Headers = @{}
    }

    # Make API call URI
    $UriBuilder = [System.UriBuilder]('https://{0}{1}' -f $ApiHost, $Path)
    $UriBuilder.Query = $Request
    
    Write-Verbose ( '[{0}]' -f $UriBuilder.Uri )

    $RestMethod = @{
        Method             = $Method
        Uri                = $UriBuilder.Uri
        Headers            = $Headers
        SkipHttpErrorCheck = $true
    }

    if ($FilePath) {
        $RestMethod.OutFile = $FilePath
    }
    
    $Results = Invoke-RestMethod @RestMethod

    $Results
}
