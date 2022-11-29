function Convert-IntToHex([int]$num) {
    return ('{0:x}' -f $num)
}