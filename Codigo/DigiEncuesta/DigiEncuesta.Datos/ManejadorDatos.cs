using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DigiEncuesta.Entidades;

namespace DigiEncuesta.Datos
{
    public class ManejadorDatos
    {
        public static bool IniciarSesion(int usuario, string clave)
        {
            using (ModeloContainer conexion = new ModeloContainer())
            {
                var encuestador = conexion.Encuestadores
                    .Where(p => p.Id_Encuestador == usuario
                    && p.Contraseña == clave).FirstOrDefault();

                if (encuestador == null)
                {
                    return false;
                }
                else 
                {
                    return true;
                }

            }

        }

        public static EntidadEncuestador ConsultarUsuario(int usuario)
        {
            EntidadEncuestador nueva = new EntidadEncuestador();

            using (ModeloContainer conexion = new ModeloContainer())
            {
                var consulta = conexion.Encuestadores
                    .Where(p=> p.Id_Encuestador == usuario).First();

                nueva.Nombre = consulta.Nombre;
                nueva.Usuario = consulta.Id_Encuestador;

                return nueva;

            }
        }
    }
}
