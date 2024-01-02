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
        [string]$FilePath,

        [Parameter()]
        $AdditionalHeaders = @{},

        [Parameter()]
        [string]$SignatureVersion = 2,

        [Parameter()]
        $Body = ''
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
        throw 'API Credentials not set, run Set-DuoApiAuth'
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
    foreach ($Item in ($Params.GetEnumerator() | Sort-Object -CaseSensitive -Property Key)) {
        $ParamCollection.Add($Item.Key, $Item.Value)
    }

    # Query string
    $Request = $ParamCollection.ToString() -replace '%7E', '~' -replace '\+', '%20'
    $Request = [regex]::Replace($Request, '(%[0-9A-Fa-f][0-9A-Fa-f])', { $args[0].Value.ToUpperInvariant() })
    $Request = [regex]::Replace($Request, "([!'()*])", { '%' + [System.Convert]::ToByte($args[0].Value[0]).ToString('X') })

    # Build Duo signature body linefeed separated
    if ($SignatureVersion -eq 5) {
        $HeaderCollection = [System.Collections.Generic.List[string]]::new()
        $AdditionalHeaderString = ''
        $AdditionalHeaders.'x-duo-date' = $XDuoDate
        if ($AdditionalHeaders) {
            foreach ($Header in ($AdditionalHeaders.GetEnumerator() | Sort-Object -Property Key)) {
                $HeaderCollection.Add($Header.Key.ToLower()) | Out-Null
                $HeaderCollection.Add($Header.Value) | Out-Null
            }
        }
        $AdditionalHeaderString = $HeaderCollection -join "`0"

        $SignatureParts = @(
            $XDuoDate
            $Method.ToUpper()
            $ApiHost.ToLower()
            $Path
            $Request
            (Get-Sha512HexDigest -String $Body)
            (Get-Sha512HexDigest -String $AdditionalHeaderString)
        )
    }
    else {
        $SignatureParts = @(
            $XDuoDate
            $Method.ToUpper()
            $ApiHost.ToLower()
            $Path
            $Request
        )
    }

    $SignatureBody = $SignatureParts -join "`n"

    Write-Verbose "`n---Canon signature---`n$SignatureBody`n-------"

    # Encode signature with secretbytes
    [byte[]]$KeyBytes = [System.Text.Encoding]::UTF8.GetBytes($SecretKey.ToCharArray())
    [byte[]]$DataBytes = [System.Text.Encoding]::UTF8.GetBytes($SignatureBody.ToCharArray())

    # Generate an HMAC SHA1 hash

    if ($SignatureVersion -eq 5) {
        $HashLib = New-Object System.Security.Cryptography.HMACSHA512
    }
    else {
        $HashLib = New-Object System.Security.Cryptography.HMACSHA1
    }
    $HashLib.Key = $KeyBytes
    $null = $HashLib.ComputeHash($DataBytes)
    $HashHex = [System.BitConverter]::ToString($HashLib.Hash)

    $Signature = $HashHex.Replace('-', '').ToLower()

    Write-Verbose "Signature: $signature"

    # Build base64 encoded auth string with IntegrationKey and Signature
    $AuthString = 'Basic ' + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(('{0}:{1}' -f $IntegrationKey, $Signature)))

    # Assembled auth headers
    $Headers = @{
        'X-Duo-Date'    = $XDuoDate
        'Authorization' = $AuthString
    }
    if ($Method -eq 'POST') {
        $Headers.'Content-Type' = 'application/x-www-form-urlencoded'
        $Body = $Request
        Write-Verbose $Request
    }
    if ($Method -eq 'PUT') {
        $Headers.'Content-Type' = 'application/json'
        Write-Verbose $Body
    }


    if ($NoAuth) {
        $Headers = @{}
    }

    # Make API call URI
    $UriBuilder = [System.UriBuilder]('https://{0}{1}' -f $ApiHost, $Path)

    if ($Method -ne 'POST') {
        $UriBuilder.Query = $Request
    }

    Write-Verbose ( '{0} [{1}]' -f $Method, $UriBuilder.Uri )
    Write-Verbose ( 'Headers: {0}' -f ($Headers | ConvertTo-Json) )

    $RestMethod = @{
        Method             = $Method
        Uri                = $UriBuilder.Uri
        Headers            = $Headers
        SkipHttpErrorCheck = $true
    }

    if ($Body) {
        $RestMethod.Body = $Body
    }

    if ($FilePath) {
        $RestMethod.OutFile = $FilePath
    }

    $Results = Invoke-RestMethod @RestMethod

    $Results
}
