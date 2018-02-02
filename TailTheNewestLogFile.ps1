function Get-LogColor {
    Param([Parameter(Position=0)]
    [String]$LogEntry)

    process {
        if ($LogEntry.Contains("DEBUG")) {Return "Green"}
        elseif ($LogEntry.Contains("WARN")) {Return "Yellow"}
        elseif ($LogEntry.Contains("ERROR")) {Return "Red"}
        else {Return "White"}
    }
}

function GetTheNewestLogFile {
    [CmdletBinding()]
    param(
        [string] $PathToLogDir
    )

    $files = Get-ChildItem $PathToLogDir | Where-Object { !$_.PsIsContainer } | Sort-Object { $_.CreationTime }
    return $($files[-1].FullName)
}

function ShowLogInConsole {
    [CmdletBinding()]
    param(
        [string] $LogFile
    )

    Get-Content $LogFile -Wait | ForEach {Write-Host -ForegroundColor (Get-LogColor $_) $_}
}

$logFile=GetTheNewestLogFile -PathToLogDir "{someDirToLogsDIrectory}"
ShowLogInConsole -LogFile $logFile