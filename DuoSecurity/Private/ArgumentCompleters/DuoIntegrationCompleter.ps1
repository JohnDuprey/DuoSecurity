$DuoIntegrationCompleter = {
    param (
        $CommandName,
        $ParamName,
        $Type,
        $CommandAst,
        $fakeBoundParameters
    )

    $Types = Get-Content "$PSScriptRoot\IntegrationTypes.json" | ConvertFrom-Json
    $Types.type | Where-Object { $_ -like "$Type*" }
}

Register-ArgumentCompleter -CommandName New-DuoIntegration -ParameterName Type -ScriptBlock $DuoIntegrationCompleter
