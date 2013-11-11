using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using DigiEncuesta.Logica;

namespace DigiEncuesta.Servicios
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    public class Service1 : IService1
    {
        public bool IniciarSesion(int usuario, string clave)
        {
            return Controlador.IniciarSesion(usuario, clave);
        }


        public Entidades.EntidadEncuestador ConsultarUsuario(int usuario)
        {
            return Controlador.ConsultarUsuario(usuario);
        }
    }
}
