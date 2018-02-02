# UtilitiesScript
This repo contains my scripts to accelarate my daily work if you find usefull just use it ;)
I use bash/powershell/LINQPad to achieve some things

List of scripts:
* TailTheNewestLogFile.ps1
This script finds the newest file in folder and write live content in console with coloring
* resolvePath.linq
This small program opens TortoiseGit in blame mode with specific path.
Unfortunatlety VisualStudio  `$(ItemPath)` doesn't provide proper case-sensite path, so I change it and pass to tortoise process
![UtilitiesScript/Resources/ExternalToolsBlameInVisualStudio.PNG](https://github.com/Andegawen/UtilitiesScript/blob/master/Resources/ExternalToolsBlameInVisualStudio.PNG)

References:
* [Managing External Tools in VS](https://msdn.microsoft.com/en-us/library/76712d27.aspx)




