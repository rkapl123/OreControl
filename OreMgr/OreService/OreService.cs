/* 
 * OreService Namespace
 *  
 * 
 * WindowsServiceInstaller: Used for installing the Windows Service (called with InstallUtil /i OreService.exe)
 * 
 * OreService: Windows Service Runtime Klasse
 * 
 */

using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Collections;
using System.ComponentModel;
using System.Configuration;
using System.Configuration.Install;
using System.Diagnostics;
using System.IO;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Data;


namespace OreService
{
    [RunInstaller(true)]
    public class WindowsServiceInstaller : Installer
    {
        /// <summary>
        /// Public Constructor for WindowsServiceInstaller.
        /// - Put all of your Initialization code here.
        /// </summary>
        public WindowsServiceInstaller()
        {
            ServiceProcessInstaller serviceProcessInstaller = new ServiceProcessInstaller();
            ServiceInstaller serviceInstaller = new ServiceInstaller();

            //# Service Account Information
            serviceProcessInstaller.Account = ServiceAccount.LocalSystem;
            serviceProcessInstaller.Username = null;
            serviceProcessInstaller.Password = null;

            //# Service Information
            serviceInstaller.DisplayName = "OreService";
            serviceInstaller.StartType = ServiceStartMode.Automatic;

            //# This must be identical to the WindowsService.ServiceBase name set in the constructor of WindowsService.cs
            serviceInstaller.ServiceName = "OreService";
            this.Installers.Add(serviceProcessInstaller);
            this.Installers.Add(serviceInstaller);
        }
    }

    // Windowsdienst Basisklasse
    public class OreService : System.ServiceProcess.ServiceBase
    {
        // Konstruktor: legt Basisdaten des Windowsdienstes fest
        public OreService()
        {
            try
            {
                this.ServiceName = "OreService";
                this.CanStop = true;
                this.CanPauseAndContinue = false;
                this.AutoLog = false;
            }
            catch (Exception ex)
            {
                EventLog.WriteEntry("OreService", ex.Message, EventLogEntryType.Error);
            }
        }

        // callback für Start des Windowsdienstes
        protected override void OnStart(string[] args)
        {
            try
            {
                this.EventLog.WriteEntry("OreService starting ...");
                this.EventLog.WriteEntry("OreService has started");
            }
            catch (Exception ex)
            {
                this.EventLog.WriteEntry(ex.Message,EventLogEntryType.Error);
            }
        }

        // callback für Beenden des Windowsdienstes
        protected override void OnStop()
        {
            this.EventLog.WriteEntry("OreService initiated shutdown ...");
            try
            {
                this.EventLog.WriteEntry("OreService completed shutdown.");
            }
            catch (Exception ex)
            {
                this.EventLog.WriteEntry(ex.Message, EventLogEntryType.Error);
            }
        }

        // Mainfunktion hat zwei Aufgaben:
        // 1) mit arg -e zum alternativen Aufruf des Bondbootsrap.exe um den "connection string" (user/password für Verbindung to SAP, user=Providername, passwd=Connectionstring) 
        // im Konfigurationsfile zu verschlüsseln.
        // 2) zum Starten des Services
        static void Main(string[] args)
        {
            ServiceBase.Run(new OreService());
        }
    }
}
