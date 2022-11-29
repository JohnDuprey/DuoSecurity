function Convert-Base32ToHex($base32) {
    $base32chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ234567';
    $bits = '';
    $hex = '';

    $bits = for ($i = 0; $i -lt $base32.Length; $i++) {
        $val = $base32chars.IndexOf($base32.Chars($i));
        $binary = [Convert]::ToString($val, 2)
        $staticLen = 5
        $padder = '0'
        # Write-Host $binary
        Add-LeftPad $binary.ToString() $staticLen $padder
    }


    for ($i = 0; $i + 4 -le $bits.Length; $i += 4) {
        $chunk = $bits.Substring($i, 4)
        # Write-Host $chunk
        $intChunk = [Convert]::ToInt32($chunk, 2)
        $hexChunk = Convert-IntToHex($intChunk)
        # Write-Host $hexChunk
        $hex = $hex + $hexChunk
    }
    return $hex;

}