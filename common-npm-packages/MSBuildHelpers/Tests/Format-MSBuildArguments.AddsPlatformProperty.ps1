[CmdletBinding()]
param()

# Arrange.
. $PSScriptRoot\..\..\..\Tests\lib\Initialize-Test.ps1
Microsoft.PowerShell.Core\Import-Module $PSScriptRoot\..

Register-Mock Get-VstsTaskVariable { '' } -- -Name AZURE_HTTP_USER_AGENT

# Act.
$actual = Format-MSBuildArguments -MSBuildArguments 'Some arguments' -Platform 'Some platform'

# Assert.
Assert-AreEqual "Some arguments /p:platform=`"Some platform`"" $actual
