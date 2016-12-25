/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.Servicio;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Montes
 */
@MultipartConfig
public class PublicidadEditar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idPubli = req.getParameter("idPubli");
        Servicio controlador = new Servicio();
        boolean b = controlador.eliminarPublicidad(idPubli);
        if (!b) {
            resp.sendRedirect("panel/Vistas/administrar-imagenes.jsp"
                    + "?tipoModal=mensaje"
                    + "&mensajeModal=La publicidad ha sido eliminada"
                    + "&urlConfirm=administrar-imagenes.jsp"
                    + "&urlCerrar=administrar-imagenes.jsp");
        } else {
            resp.sendRedirect("panel/Vistas/administrar-imagenes.jsp"
                    + "?tipoModal=mensaje"
                    + "&mensajeModal=No se puede eliminar la publicidad, intente mas tarde"
                    + "&urlConfirm=administrar-imagenes.jsp"
                    + "&urlCerrar=administrar-imagenes.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Servicio controlador = new Servicio();
        String idPubl = req.getParameter("idPubli");
        String link = req.getParameter("link");
        String titulo = req.getParameter("titulo");
        String opcion = req.getParameter("opcion");

        if (opcion.equals("2")) {//editar link
            boolean b = controlador.editarLinkPublicidad(idPubl, link);
            if (!b) {
                resp.sendRedirect("panel/Vistas/administrar-imagenes.jsp"
                        + "?tipoModal=mensaje"
                        + "&mensajeModal=El link ha sido actualizado"
                        + "&urlConfirm=administrar-imagenes.jsp"
                        + "&urlCerrar=administrar-imagenes.jsp");
            } else {
                resp.sendRedirect("panel/Vistas/administrar-imagenes.jsp"
                        + "?tipoModal=mensaje"
                        + "&mensajeModal=Error al actualizar el link, intente mas tarde"
                        + "&urlConfirm=administrar-imagenes.jsp"
                        + "&urlCerrar=administrar-imagenes.jsp");
            }
        } else if (opcion.equals("3")) {//editar titulo
            boolean b = controlador.editarTituloPublicidad(idPubl, titulo);
            if (!b) {
                resp.sendRedirect("panel/Vistas/administrar-imagenes.jsp"
                        + "?tipoModal=mensaje"
                        + "&mensajeModal=El titulo ha sido actualizado"
                        + "&urlConfirm=administrar-imagenes.jsp"
                        + "&urlCerrar=administrar-imagenes.jsp");
            } else {
                resp.sendRedirect("panel/Vistas/administrar-imagenes.jsp"
                        + "?tipoModal=mensaje"
                        + "&mensajeModal=Error al actualizar el titulo, intente mas tarde"
                        + "&urlConfirm=administrar-imagenes.jsp"
                        + "&urlCerrar=administrar-imagenes.jsp");
            }
        }

    }

}
