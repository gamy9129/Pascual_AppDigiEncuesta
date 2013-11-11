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
    public partial class MainPage : PhoneApplicationPage
    {
        // Constructor
        public MainPage()
        {
            InitializeComponent();
        }

        private void btnAdicionar_Click(object sender, System.EventArgs e)
        {
            try
            {
                Proxy.Service1Client cliente = new Proxy.Service1Client();
                cliente.IniciarSesionCompleted += new EventHandler<Proxy.IniciarSesionCompletedEventArgs>(cliente_IniciarSesionCompleted);
                cliente.IniciarSesionAsync(Convert.ToInt32(this.txtUsuario.Text), this.txtContraseña.Text);
            }
            catch (Exception)
            {
                MessageBox.Show("Revise los datos. Ha ocurrido un error");
            }
        }

        void cliente_IniciarSesionCompleted(object sender, Proxy.IniciarSesionCompletedEventArgs e)
        {
            if (e.Error == null)
            {
                if (e.Result == true)
                {
                    IsolatedStorageSettings configuracion = IsolatedStorageSettings.ApplicationSettings;

                    if (configuracion.Contains("Usuario"))
                    {
                        configuracion["Usuario"] = this.txtUsuario.Text;
                    }
                    else
                    {
                        configuracion.Add("Usuario", this.txtUsuario.Text);
                    }

                    NavigationService.GoBack();

                }
                else
                {
                    MessageBox.Show("Usuario o contraseña incorrectos.");
                }
            }
            else
            {
                MessageBox.Show("Revise su conexion a internet. Ha ocurrido un error");
            }
        }
    }
}