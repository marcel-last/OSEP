# MSbuild C# AppLocker Bypass
Define a new task within the XML, then specify the C# code to compile and run. This C# code must be a class that implements the Task interface. Specfically it must have a method called Execute that returns a boolean. We also need to specify in the XML what other namespaces we use, and in our case the location of the .NET assembly containing the PowerShell object (System.Management.Automation.dll). 

# Build and Execution
This file can then be run using MSBuild C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe for 64 bit and C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe for 32 bit. The command to run this is:

```powershell
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe msbuild-powershell.xml
```
