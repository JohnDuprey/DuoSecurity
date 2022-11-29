function Invoke-DuoRequest {
    [CmdletBinding()]
    Param(
        [string]$Method = 'GET',

        [ValidateNotNullOrEmpty()]
        [string]$Path,
        $Params = @{}
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
        $ParamCollection.Add('account_id', $AccountId)
    }

    foreach ($Key in $Params.Keys | Sort-Object) {
        $ParamCollection.Add($key, $Params.$key)
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

    # Make API call URI
    $UriBuilder = [System.UriBuilder]('https://{0}{1}' -f $ApiHost, $Path)
    $UriBuilder.Query = $Request
    
    Write-Verbose ( '[{0}]' -f $UriBuilder.Uri )

    $Results = Invoke-RestMethod -Method $Method -Uri $UriBuilder.Uri -Headers $Headers -SkipHttpErrorCheck

    $Results
}
