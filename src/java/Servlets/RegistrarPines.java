package Servlets;

import ClasesDTO.Pin;
import Controlador.Servicio;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrarPines extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idPin = req.getParameter("pin");
        int idEst = Integer.parseInt(idPin);
        resp.setContentType("application/pdf");
        OutputStream out = resp.getOutputStream();
        
        Servicio controlador = new Servicio();
        Pin estudiante = controlador.pinEstudiante(idEst);
        
        String foto = getServletContext().getRealPath("/recursos/img/logoColegio.png");
        req.setCharacterEncoding("UTF-8");

        try {
            try {
                Document documento = new Document();
                PdfWriter.getInstance(documento, out);

                documento.open();

                Paragraph par1 = new Paragraph();
                Font fontit = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.GRAY);
                par1.add(new Phrase("Generador de Pin por estudiante", fontit));
                par1.setAlignment(Element.ALIGN_CENTER);
                par1.add(new Phrase(Chunk.NEWLINE));
                par1.add(new Phrase(Chunk.NEWLINE));
                documento.add(par1);
//                Image image = Image.getInstance("E:\\ArchivosVarios\\logoColegio.png");
//                image.scalePercent(50);
                Image image = Image.getInstance(foto);
                image.scalePercent(60);
                //for (int i = 0; i < idUsuarios.length; i++) {
                PdfPTable tabla = new PdfPTable(3);

                tabla.setWidthPercentage(60);

                Font fuentetabla = FontFactory.getFont("Arial", 8, Font.BOLD, BaseColor.BLACK);
                Font fuentetablaHeader = FontFactory.getFont("Arial", 9, Font.BOLD, BaseColor.BLACK);
                PdfPCell celdaHeader = new PdfPCell(new Paragraph("COLEGIO SAGRADOS CORAZONES", fuentetablaHeader));
                celdaHeader.setVerticalAlignment(Element.ALIGN_MIDDLE);
                celdaHeader.setColspan(3);
                PdfPCell celda01 = new PdfPCell(image);
                //PdfPCell celda01 = new PdfPCell(new Paragraph("imagen"));
                celda01.setHorizontalAlignment(Element.ALIGN_CENTER);
                celda01.setVerticalAlignment(Element.ALIGN_JUSTIFIED);
                celda01.setRowspan(2);
                tabla.addCell(celda01);

                PdfPCell celda1 = new PdfPCell(new Paragraph("Estudiante: " + estudiante.getNombres()+" "+estudiante.getApellidos() , fuentetabla));
                PdfPCell celda2 = new PdfPCell(new Paragraph("Pin: " + estudiante.getIdPin(), fuentetabla));
                PdfPCell celda3 = new PdfPCell(new Paragraph("Fecha creacion: " + estudiante.getInicio(), fuentetabla));
                PdfPCell celda4 = new PdfPCell(new Paragraph("Fecha vencimiento: " + estudiante.getFin(), fuentetabla));
                celda1.setHorizontalAlignment(Element.ALIGN_CENTER);
                celda2.setHorizontalAlignment(Element.ALIGN_CENTER);
                celda2.setPaddingTop(20);
                celda3.setHorizontalAlignment(Element.ALIGN_CENTER);
                celda4.setHorizontalAlignment(Element.ALIGN_CENTER);
                tabla.addCell(celda1);
                tabla.addCell(celda2);
                tabla.addCell(celda3);
                tabla.addCell(celda4);
                Paragraph par2 = new Paragraph();

                par2.add(new Phrase(Chunk.NEWLINE));
                documento.add(par2);

                documento.add(tabla);

                //}
                documento.close();

            } catch (Exception e) {
                e.getMessage();
            }
        } finally {
            out.close();
        }

    }

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
//            throws ServletException, IOException {
//        int[] idUsuarios = new int[1];
//        idUsuarios[0] = 1;
//        int tamano = 15;
//        String pin;
//        int idUsuario;
//        resp.setContentType("application/pdf");
//        OutputStream out = resp.getOutputStream();
//
//        req.setCharacterEncoding("UTF-8");
//        try {
//            Document documento = new Document();
//            PdfWriter.getInstance(documento, out);
//
//            documento.open();
//
//            Paragraph par1 = new Paragraph();
//            Font fontit = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.GRAY);
//            par1.add(new Phrase("Pines de estudiantes", fontit));
//            par1.setAlignment(Element.ALIGN_CENTER);
//            par1.add(new Phrase(Chunk.NEWLINE));
//            par1.add(new Phrase(Chunk.NEWLINE));
//            documento.add(par1);
//            Image image = Image.getInstance("C:\\logo.jpg");
//            image.scalePercent(50);
//            for (int i = 0; i < idUsuarios.length; i++) {
//
//                PdfPTable tabla = new PdfPTable(2);
//
//                tabla.setWidthPercentage(60);
//
//                Font fuentetabla = FontFactory.getFont("Arial", 8, Font.BOLD, BaseColor.BLACK);
//                PdfPCell celda01 = new PdfPCell(image);
//
//                celda01.setHorizontalAlignment(Element.ALIGN_CENTER);
//                celda01.setVerticalAlignment(Element.ALIGN_JUSTIFIED);
//                celda01.setRowspan(2);
//                tabla.addCell(celda01);
//
//                idUsuario = idUsuarios[i];
//                pin = new NumerosAleatorios().getCodigo(tamano);
//                PinDao pinDao = new PinDao();
//                pinDao.insertPin(pin, idUsuario);
//
//                Pin pinesdtoNew = new PinDao().getListPines(idUsuario);
//
//                PdfPCell celda1 = new PdfPCell(new Paragraph("Nombre: " + "Arturo Saavedra", fuentetabla));
//                PdfPCell celda2 = new PdfPCell(new Paragraph("Pin: " + pin, fuentetabla));
//                PdfPCell celda3 = new PdfPCell(new Paragraph("Fecha creacion: " + Calendar.getInstance(), fuentetabla));
//                PdfPCell celda4 = new PdfPCell(new Paragraph("Fecha vencimiento: " + "2016-12-23", fuentetabla));
//                celda1.setHorizontalAlignment(Element.ALIGN_CENTER);
//                celda2.setHorizontalAlignment(Element.ALIGN_CENTER);
//                celda2.setPaddingTop(20);
//                celda3.setHorizontalAlignment(Element.ALIGN_CENTER);
//                celda4.setHorizontalAlignment(Element.ALIGN_CENTER);
//                tabla.addCell(celda1);
//                tabla.addCell(celda2);
//                tabla.addCell(celda3);
//                tabla.addCell(celda4);
//                Paragraph par2 = new Paragraph();
//
//                par2.add(new Phrase(Chunk.NEWLINE));
//                documento.add(par2);
//
//                documento.add(tabla);
//
//            }
//
//            documento.close();
//
//        } catch (Exception e) {
//            e.getMessage();
//        }
//    }
}
