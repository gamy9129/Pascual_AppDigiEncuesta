﻿#pragma checksum "D:\GitHub\Pascual_AppDigiEncuesta\Codigo\DigiEncuesta\DigiEncuesta.App\MainPage.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "DA5BCE0718F55369745839A5E1CCE865"
//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.225
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

using Microsoft.Phone.Controls;
using Microsoft.Phone.Shell;
using System;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Automation.Peers;
using System.Windows.Automation.Provider;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Resources;
using System.Windows.Shapes;
using System.Windows.Threading;


namespace DigiEncuesta.App {
    
    
    public partial class MainPage : Microsoft.Phone.Controls.PhoneApplicationPage {
        
        internal Microsoft.Phone.Shell.ApplicationBarIconButton btnAdicionar;
        
        internal System.Windows.Controls.Grid LayoutRoot;
        
        internal System.Windows.Controls.StackPanel TitlePanel;
        
        internal System.Windows.Controls.TextBlock ApplicationTitle;
        
        internal System.Windows.Controls.TextBlock PageTitle;
        
        internal System.Windows.Controls.Grid ContentPanel;
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Windows.Application.LoadComponent(this, new System.Uri("/DigiEncuesta.App;component/MainPage.xaml", System.UriKind.Relative));
            this.btnAdicionar = ((Microsoft.Phone.Shell.ApplicationBarIconButton)(this.FindName("btnAdicionar")));
            this.LayoutRoot = ((System.Windows.Controls.Grid)(this.FindName("LayoutRoot")));
            this.TitlePanel = ((System.Windows.Controls.StackPanel)(this.FindName("TitlePanel")));
            this.ApplicationTitle = ((System.Windows.Controls.TextBlock)(this.FindName("ApplicationTitle")));
            this.PageTitle = ((System.Windows.Controls.TextBlock)(this.FindName("PageTitle")));
            this.ContentPanel = ((System.Windows.Controls.Grid)(this.FindName("ContentPanel")));
        }
    }
}
