$DuoAuthProxyLogCompleter = {
    param (
        $CommandName,
        $ParamName,
        $LogName,
        $CommandAst,
        $fakeBoundParameters
    )
    Get-DuoAuthProxyLogs -ListLogs | Where-Object { $_ -match "$LogName" }
}

Register-ArgumentCompleter -CommandName Get-DuoAuthProxyLogs -ParameterName LogName -ScriptBlock $DuoAuthProxyLogCompleter
