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
public class PaginasAgregar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp)
            throws ServletException, IOException {

        Servicio controlador = new Servicio();
        String idLi = request.getParameter("idLi");
        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");
        String img = request.getParameter("nombreImg");
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        Part arch = request.getPart("imagenInsert");

        String rutaPath = getServletContext().getRealPath("");
        if (opcion == 1) {
            boolean r = controlador.registrarPagina(idLi, titulo, contenido, img);
            if (!r) {
                if ((!img.equals(""))) {
                    String rutaImg = rutaPath + "/../../web/recursos/img/img-paginas/" + img;
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
                resp.sendRedirect("panel/Vistas/administrar-paginas.jsp?idLi=" + idLi
                        + "&tipoModal=mensaje"
                        + "&mensajeModal=La pagina ha sido guardada"
                        + "&urlConfirm=administrar-paginas.jsp?idLi=" + idLi
                        + "&urlCerrar=administrar-paginas.jsp?idLi=" + idLi);
            } else {
                resp.sendRedirect("panel/Vistas/administrar-paginas.jsp?idLi=" + idLi
                        + "&tipoModal=mensaje"
                        + "&mensajeModal=La pagina no ha sido guardada"
                        + "&urlConfirm=administrar-paginas.jsp?idLi=" + idLi
                        + "&urlCerrar=administrar-paginas.jsp?idLi=" + idLi);
            }

        } else if (opcion == 2) {
            boolean u = controlador.editarPagina(idLi, titulo, contenido, img);
            if (!u) {
                if ((!img.equals(""))) {
                    String rutaImg = rutaPath + "/../../web/recursos/img/img-paginas/" + img;
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
                resp.sendRedirect("panel/Vistas/administrar-paginas.jsp?idLi=" + idLi
                        + "&tipoModal=mensaje"
                        + "&mensajeModal=La pagina fue actualizada"
                        + "&urlConfirm=administrar-paginas.jsp?idLi=" + idLi
                        + "&urlCerrar=administrar-paginas.jsp?idLi=" + idLi);
            } else {
                resp.sendRedirect("panel/Vistas/administrar-paginas.jsp?idLi=" + idLi
                        + "&tipoModal=mensaje"
                        + "&mensajeModal=La pagina no puede ser actualizada, intente mas tarde"
                        + "&urlConfirm=administrar-paginas.jsp?idLi=" + idLi
                        + "&urlCerrar=administrar-paginas.jsp?idLi=" + idLi);
            }
        }
    }
}
