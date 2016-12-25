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
public class SliderAgregar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Servicio controlador = new Servicio();
        String posicion = req.getParameter("posicion");
        String titulo = req.getParameter("titulo");
        String descripcion = req.getParameter("descripcion");
        String http = req.getParameter("http");
        String nombimg = req.getParameter("nombreImg");
        Part arch = req.getPart("imagenInsert");
        String rutaPath = getServletContext().getRealPath("");
        boolean r = controlador.registrarSlider(posicion, titulo, descripcion, "Leer mas", http, nombimg);

        if (!r) {
            if (!nombimg.equals("")) {
                String rutaImg = rutaPath + "/../../web/recursos/img/img-slider/" + nombimg;
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
            resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                    + "?tipoModal=mensaje"
                    + "&mensajeModal=El carrucel ha sido registrado"
                    + "&urlConfirm=administrar-carrucel-superior.jsp"
                    + "&urlCerrar=administrar-carrucel-superior.jsp");
        } else {
            resp.sendRedirect("panel/Vistas/administrar-carrucel-superior.jsp"
                    + "?tipoModal=mensaje"
                    + "&mensajeModal=no se puede registrar el carrucel, intente mas tarde"
                    + "&urlConfirm=administrar-carrucel-superior.jsp"
                    + "&urlCerrar=administrar-carrucel-superior.jsp");
        }

    }

}
