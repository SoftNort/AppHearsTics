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
public class PublicidadAgregar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Servicio controlador = new Servicio();
        String slider = req.getParameter("slider");
        String link = req.getParameter("link");
        String img = req.getParameter("nombreImg");
        String titulo = req.getParameter("titulo");
        Part arch = req.getPart("imagenInsert");
        String rutaPath = getServletContext().getRealPath("");
        boolean b = controlador.registrarPublicidad(slider, link, img, titulo);

        if (!b) {
            if (!img.equals("")) {
                String rutaImg = rutaPath + "/../../web/recursos/img/img-slider/" + img;
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
            }
            resp.sendRedirect("panel/Vistas/administrar-imagenes.jsp"
                    + "?tipoModal=mensaje"
                    + "&mensajeModal=La publicidad ha sido registrada"
                    + "&urlConfirm=administrar-imagenes.jsp"
                    + "&urlCerrar=administrar-imagenes.jsp");
        } else {
            resp.sendRedirect("panel/Vistas/administrar-imagenes.jsp"
                    + "?tipoModal=mensaje"
                    + "&mensajeModal=Error al registrar la publiciadad, <br>verifique que los datos sean validos"
                    + "&urlConfirm=administrar-imagenes.jsp"
                    + "&urlCerrar=administrar-imagenes.jsp");
        }

    }

}
