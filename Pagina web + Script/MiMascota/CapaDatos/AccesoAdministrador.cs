using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CapaEntidades;
using System.Data.Objects;
namespace CapaDatos
{
    public class AccesoAdministrador
    {
        //jajaja
        EF_Pagina contexto;

        public Administrador obtenerEstado(string nombre, string contraseña)
        {
            using (contexto = new EF_Pagina())
            {
                ObjectQuery<Administrador> user = contexto.Administrador;
                var recuperarEstadoDeLogueo = from x in user
                                              where x.nombre_administrador.Equals(nombre) && x.pass_administrador.Equals(contraseña)
                                              select x;
                if (recuperarEstadoDeLogueo != null)
                {
                    foreach (var item in recuperarEstadoDeLogueo)
                    {
                        return new Administrador
                        {
                            nombre_administrador = item.nombre_administrador,
                            pass_administrador = item.pass_administrador,
                            correo_administrador = item.correo_administrador,
                            id_administrador = item.id_administrador,
                        };
                    }
                }
                return null;
            }
        }

        public Boolean eliminarUsuario(int id)
        {
            using(contexto = new EF_Pagina())
            {
                ObjectSet<Usuario> user = contexto.Usuario;
                Usuario us = contexto.Usuario.Single(u => u.id_usuario == id);
                user.DeleteObject(us);
                contexto.SaveChanges();
                return true;
            }
        }

        public Boolean eliminarPublicacion(int idPub)
        {
            using (contexto = new EF_Pagina())
            {
                ObjectSet<Publicacion> pub = contexto.Publicacion;
                ObjectSet<Mascota> mas = contexto.Mascota;
                Mascota mascota = contexto.Mascota.Single(m => m.Publicacion_id == idPub);
                mas.DeleteObject(mascota);
                Publicacion publicaion = contexto.Publicacion.Single(p => p.id_publicacion == idPub);
                pub.DeleteObject(publicaion);
                contexto.SaveChanges();
                return true;
            }
        }
    }
}
