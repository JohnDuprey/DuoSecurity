$DuoAccountCompleter = {
    param (
        $CommandName,
        $ParamName,
        $AccountName,
        $CommandAst,
        $fakeBoundParameters
    )
    if (!$script:DuoAccountsList) {
        Get-DuoAccounts | Out-Null
    }
    ($script:DuoAccountsList).name | Where-Object { $_ -like "$AccountName*" } | ForEach-Object { "'$_'" }
}

$DuoAccountIdCompleter = {
    param (
        $CommandName,
        $ParamName,
        $AccountId,
        $CommandAst,
        $fakeBoundParameters
    )
    if (!$script:DuoAccountsList) {
        Get-DuoAccounts | Out-Null
    }
    ($script:DuoAccountsList).account_id | Where-Object { $_ -like "$AccountId*" }
}

Register-ArgumentCompleter -CommandName Select-DuoAccount -ParameterName AccountId -ScriptBlock $DuoAccountIdCompleter
Register-ArgumentCompleter -CommandName Select-DuoAccount -ParameterName Name -ScriptBlock $DuoAccountCompleter