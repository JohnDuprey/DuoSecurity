function Install-DuoApplication {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    Param(
        [Parameter(Mandatory = $true)]
        [ValidateSet('AuthProxy', '')]
        [string]$Application
    )

    if ($PSCmdlet.ShouldProcess($Application)) {

    }
}
