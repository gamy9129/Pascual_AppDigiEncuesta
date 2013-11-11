using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using Microsoft.Phone.Controls;
using System.IO.IsolatedStorage;

namespace DigiEncuesta.App
{
    public partial class Encuestas : PhoneApplicationPage
    {
        public Encuestas()
        {
            InitializeComponent();
            this.Loaded += new RoutedEventHandler(Encuestas_Loaded);
        }

        void Encuestas_Loaded(object sender, RoutedEventArgs e)
        {
            IsolatedStorageSettings configuracion = IsolatedStorageSettings.ApplicationSettings;
            if (configuracion.Contains("Usuario"))
            {
                Proxy.Service1Client cliente = new Proxy.Service1Client();
                cliente.ConsultarUsuarioCompleted += new EventHandler<Proxy.ConsultarUsuarioCompletedEventArgs>(cliente_ConsultarUsuarioCompleted);
                cliente.ConsultarUsuarioAsync(Convert.ToInt32(configuracion["Usuario"]));
            }
            else
            {
                NavigationService.Navigate(new Uri("/MainPage.xaml", UriKind.Relative));
            }
        }

        void cliente_ConsultarUsuarioCompleted(object sender, Proxy.ConsultarUsuarioCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                MessageBox.Show("Hola " + e.Result.Nombre);
            }
        }
    }
}