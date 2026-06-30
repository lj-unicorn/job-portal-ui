# Claude Code status line script
# Displays: model name and context usage with a progress bar
# Runs via PowerShell, reads JSON from stdin

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$raw = $input | Out-String
try {
    $json = $raw | ConvertFrom-Json
} catch {
    exit 0
}

$model   = $json.model.display_name
$usedPct = $json.context_window.used_percentage
$projDir = "D:\Temp\job-portal-ui-main\job-portal-ui-main"

# Get current git branch gracefully
$branch = $null
try {
    $branch = git -C "$projDir" --no-optional-locks rev-parse --abbrev-ref HEAD 2>$null
    if ($LASTEXITCODE -ne 0) { $branch = $null }
} catch {
    $branch = $null
}

# Build progress bar (10 chars wide)
$barWidth = 10
if ($null -ne $usedPct) {
    $filled   = [math]::Round($usedPct / 100 * $barWidth)
    $empty    = $barWidth - $filled
    $bar      = "[" + ("#" * $filled) + ("." * $empty) + "]"
    $pctLabel = "{0:F0}%" -f $usedPct
    $line     = "$model  $bar $pctLabel ctx used"
} else {
    $line = "$model"
}

if ($branch) {
    $branchSymbol = [char]0x2387
    $line = "$line  $branchSymbol $branch"
}

Write-Host -NoNewline $line