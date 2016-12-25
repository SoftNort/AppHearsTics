/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.Servicio;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Montes
 */
public class NoticiasEditar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Servicio controlador = new Servicio();
        String idNoticia = req.getParameter("idNot");
        String pagina = req.getParameter("pg");
        boolean b = controlador.eliminarNoticia(idNoticia);
        if (!b) {
            resp.sendRedirect("panel/Vistas/administrar-noticias.jsp?pg=" + pagina
                    + "&tipoModal=mensaje"
                    + "&mensajeModal=La Noticia ha sido eliminada"
                    + "&urlConfirm=administrar-noticias.jsp?pg=" + pagina
                    + "&urlCerrar=administrar-noticias.jsp?pg=" + pagina);
        } else {
            resp.sendRedirect("panel/Vistas/administrar-noticias.jsp?pg=" + pagina
                    + "&tipoModal=mensaje"
                    + "&mensajeModal=no se puede eliminar la noticia, intente mas tarde"
                    + "&urlConfirm=administrar-noticias.jsp?pg=" + pagina
                    + "&urlCerrar=administrar-noticias.jsp?pg=" + pagina);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Servicio controlador = new Servicio();

        String opcion = req.getParameter("opcion");
        String idNot = req.getParameter("idNoti");
        String desc = req.getParameter("desc");
        String parrafo = req.getParameter("parrafo");
        String pagina = req.getParameter("pagina");
        String titulo = req.getParameter("titulo");
        boolean b;

        if (opcion.equals("1")) {
            b = controlador.editarDescripcionNoticia(idNot, desc);

            if (!b) {
                resp.sendRedirect("panel/Vistas/administrar-noticias.jsp?pg=" + pagina
                        + "&tipoModal=mensaje"
                        + "&mensajeModal=La descripcion ha sido actualizada "
                        + "&urlConfirm=administrar-noticias.jsp?pg=" + pagina
                        + "&urlCerrar=administrar-noticias.jsp?pg=" + pagina);
            } else {
                resp.sendRedirect("panel/Vistas/administrar-noticias.jsp?pg=" + pagina
                        + "&tipoModal=mensaje"
                        + "&mensajeModal=Error al actualizar la descripcion, intente mas tarde "
                        + "&urlConfirm=administrar-noticias.jsp?pg=" + pagina
                        + "&urlCerrar=administrar-noticias.jsp?pg=" + pagina);
            }
        }

        if (opcion.equals("2")) { //Editar Parrafo
            b = controlador.editarParrafoNoticia(idNot, parrafo);
            if (!b) {
                resp.sendRedirect("panel/Vistas/administrar-noticias.jsp?pg=" + pagina
                        + "&tipoModal=mensaje"
                        + "&mensajeModal=El parrafo ha sido actualizada "
                        + "&urlConfirm=administrar-noticias.jsp?pg=" + pagina
                        + "&urlCerrar=administrar-noticias.jsp?pg=" + pagina);
            } else {
                resp.sendRedirect("panel/Vistas/administrar-noticias.jsp?pg=" + pagina
                        + "&tipoModal=mensaje"
                        + "&mensajeModal=Error al actualizar el parrafo, intente mas tarde "
                        + "&urlConfirm=administrar-noticias.jsp?pg=" + pagina
                        + "&urlCerrar=administrar-noticias.jsp?pg=" + pagina);
            }
        }
        if (opcion.equals("4")) { //Editar Titulo
            b = controlador.editarTituloNoticia(idNot, titulo);
            if (!b) {
                resp.sendRedirect("panel/Vistas/administrar-noticias.jsp?pg=" + pagina
                        + "&tipoModal=mensaje"
                        + "&mensajeModal=El titulo ha sido actualizada "
                        + "&urlConfirm=administrar-noticias.jsp?pg=" + pagina
                        + "&urlCerrar=administrar-noticias.jsp?pg=" + pagina);
            } else {
                resp.sendRedirect("panel/Vistas/administrar-noticias.jsp?pg=" + pagina
                        + "&tipoModal=mensaje"
                        + "&mensajeModal=Error al actualizar el titulo, intente mas tarde "
                        + "&urlConfirm=administrar-noticias.jsp?pg=" + pagina
                        + "&urlCerrar=administrar-noticias.jsp?pg=" + pagina);
            }
        }

    }
}
