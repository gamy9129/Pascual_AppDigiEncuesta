using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DigiEncuesta.Datos;
using DigiEncuesta.Entidades;

namespace DigiEncuesta.Logica
{
    public class Controlador
    {
        public static bool IniciarSesion(int usuario, string clave)
        {
            return ManejadorDatos.IniciarSesion(usuario, clave);
        }

        public static EntidadEncuestador ConsultarUsuario(int usuario)
        {
            return ManejadorDatos.ConsultarUsuario(usuario);
        }
    }
}
