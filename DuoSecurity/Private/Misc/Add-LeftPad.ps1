function Add-LeftPad($str, $len, $pad) {
    if (($len + 1) -ge $str.Length) {
        while (($len - 1) -ge $str.Length) {
            $str = ($pad + $str)
        }
    }
    return $str;
}