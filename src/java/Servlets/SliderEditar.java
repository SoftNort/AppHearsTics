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
public class SliderEditar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Servicio controlador = new Servicio();
        String idSlider = req.getParameter("idSlider");

        boolean b = controlador.eliminarSlider(idSlider);

        if (!b) {
            resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                    + "?tipoModal=mensaje"
                    + "&mensajeModal=El carrucel ha sido eliminado"
                    + "&urlConfirm=administrar-carrucel-superior.jsp"
                    + "&urlCerrar=administrar-carrucel-superior.jsp");
        } else {
            resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                    + "?tipoModal=mensaje"
                    + "&mensajeModal=no se puede eliminar el carrucel, intente mas tarde"
                    + "&urlConfirm=administrar-carrucel-superior.jsp"
                    + "&urlCerrar=administrar-carrucel-superior.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Servicio controlador = new Servicio();
        String opcion = req.getParameter("opcion");
        String idSlider = req.getParameter("idSlider");
        String text1 = req.getParameter("parrafo1");
        String text2 = req.getParameter("parrafo2");
        String text3 = req.getParameter("parrafo3");
        String urlLink = req.getParameter("urlLink");
        String posocion = req.getParameter("posicion");
        boolean b;

        Integer campo = Integer.parseInt(opcion);

        switch (campo) {
            default:
                resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp");
                break;
            case 1://Editar titulo
                b = controlador.editarTexto1(idSlider, text1);
                if (!b) {
                    resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=El titulo ha sido actualizado"
                            + "&urlConfirm=administrar-carrucel-superior.jsp"
                            + "&urlCerrar=administrar-carrucel-superior.jsp");
                } else {
                    resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=Error al actualizar el titulo, intente mas tarde"
                            + "&urlConfirm=administrar-carrucel-superior.jsp"
                            + "&urlCerrar=administrar-carrucel-superior.jsp");
                }
                break;
            case 2: //Editar descripcion
                b = controlador.editarTexto2(idSlider, text2);
                if (!b) {
                    resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=La descripcion ha sido actualizada"
                            + "&urlConfirm=administrar-carrucel-superior.jsp"
                            + "&urlCerrar=administrar-carrucel-superior.jsp");
                } else {
                    resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=Error al actualizar la descripcion, intente mas tarde"
                            + "&urlConfirm=administrar-carrucel-superior.jsp"
                            + "&urlCerrar=administrar-carrucel-superior.jsp");
                }
                break;
            case 3: //Editar url  
                break;
            case 4: //Editar url
                b = controlador.editarUrlLinkSlider(idSlider, urlLink);
                if (!b) {
                    resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=El link ha sido actualizado"
                            + "&urlConfirm=administrar-carrucel-superior.jsp"
                            + "&urlCerrar=administrar-carrucel-superior.jsp");
                } else {
                    resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=Error al actualizar el link, intente mas tarde"
                            + "&urlConfirm=administrar-carrucel-superior.jsp"
                            + "&urlCerrar=administrar-carrucel-superior.jsp");
                }
                break;
            case 5: //Editar url
                b = controlador.editarPosicionSlider(idSlider, posocion);
                if (!b) {
                    resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=La posicion ha sido actualizada"
                            + "&urlConfirm=administrar-carrucel-superior.jsp"
                            + "&urlCerrar=administrar-carrucel-superior.jsp");
                } else {
                    resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=Error al actualizar la posicion, intente mas tarde"
                            + "&urlConfirm=administrar-carrucel-superior.jsp"
                            + "&urlCerrar=administrar-carrucel-superior.jsp");
                }
                break;
        }

    }

}
