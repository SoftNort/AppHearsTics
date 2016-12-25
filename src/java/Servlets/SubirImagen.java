/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.Servicio;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Montes
 */
@MultipartConfig
public class SubirImagen extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html;charset=UTF-8");

        req.setCharacterEncoding("UTF-8");

        Servicio controlador = new Servicio();

        String nomb = req.getParameter("nombreImagen");
        Part arch = req.getPart("imagen");
        String idSlider = req.getParameter("idSlider");

        String idNoticia = req.getParameter("idNoticia");
        String pagina = req.getParameter("pagina");

        Integer opcion = Integer.parseInt(req.getParameter("opcion"));

        String rutaPath = getServletContext().getRealPath("");

        if (opcion == 1) {
            if (!nomb.equals("")) {
                String rutaImg = rutaPath + "/../../web/recursos/img/img-slider/" + nomb;
                InputStream is = arch.getInputStream();
                File f = new File(rutaImg);
                FileOutputStream ous = new FileOutputStream(f);
                int dato = is.read();
                while (dato != -1) {
                    ous.write(dato);
                    dato = is.read();
                }
                ous.close();
                is.close();

                boolean b = controlador.editarImagenSlider(idSlider, nomb);
                if (!b) {
                    resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=La imagen ha sido actualizada"
                            + "&urlConfirm=administrar-carrucel-superior.jsp"
                            + "&urlCerrar=administrar-carrucel-superior.jsp");
                } else {
                    resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=Error al cambiar la imagen"
                            + "&urlConfirm=administrar-carrucel-superior.jsp"
                            + "&urlCerrar=administrar-carrucel-superior.jsp");
                }
            }

        } else if (opcion == 2) {

            if (!nomb.equals("")) {
                String rutaImg = rutaPath + "/../../web/recursos/img/img-noticias/" + nomb;
                InputStream is = arch.getInputStream();
                File f = new File(rutaImg);
                FileOutputStream ous = new FileOutputStream(f);
                int dato = is.read();
                while (dato != -1) {
                    ous.write(dato);
                    dato = is.read();
                }
                ous.close();
                is.close();

                boolean b = controlador.editarImagenNoticia(idNoticia, nomb);
                if (!b) {
                    resp.sendRedirect("panel/Vistas/administrar-noticias.jsp?pg=" + pagina
                            + "&tipoModal=mensaje"
                            + "&mensajeModal=La imagen ha sido actualizada"
                            + "&urlConfirm=administrar-noticias.jsp?pg=" + pagina
                            + "&urlCerrar=administrar-noticias.jsp?pg=" + pagina);
                } else {
                    resp.sendRedirect("panel/Vistas/administrar-noticias.jsp?pg=" + pagina
                            + "&tipoModal=mensaje"
                            + "&mensajeModal=Error al cambiar la imagen"
                            + "&urlConfirm=administrar-noticias.jsp?pg=" + pagina
                            + "&urlCerrar=administrar-noticias.jsp?pg=" + pagina);
                }
            }

        } else if (opcion == 3) {

            if (!nomb.equals("")) {
                String idPublicidad = req.getParameter("idPubl");
                String slider = req.getParameter("slider");

                String rutaImg = rutaPath + "/../../web/recursos/img/img-slider/" + nomb;
                InputStream is = arch.getInputStream();
                File f = new File(rutaImg);
                FileOutputStream ous = new FileOutputStream(f);
                int dato = is.read();
                while (dato != -1) {
                    ous.write(dato);
                    dato = is.read();
                }
                ous.close();
                is.close();
                boolean b = controlador.editarImgPublicidad(idPublicidad, nomb);
                if (!b) {
                    resp.sendRedirect("panel/Vistas/administrar-imagenes.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=La imagen ha sido actualizada"
                            + "&urlConfirm=administrar-imagenes.jsp"
                            + "&urlCerrar=administrar-imagenes.jsp");
                } else {
                    resp.sendRedirect("panel/Vistas/administrar-imagenes.jsp"
                            + "?tipoModal=mensaje"
                            + "&mensajeModal=Error al cambiar la imagen"
                            + "&urlConfirm=administrar-imagenes.jsp"
                            + "&urlCerrar=administrar-imagenes.jsp");
                }
            }
        }

    }

}
