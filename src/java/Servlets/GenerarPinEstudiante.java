/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GenerarPinEstudiante extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int idEstudiante = Integer.parseInt(req.getParameter("idEst"));

        resp.setContentType("application/pdf");
        OutputStream out = resp.getOutputStream();

        String foto = getServletContext().getRealPath("/recursos/img/logoColegio.png");
        req.setCharacterEncoding("UTF-8");

        try {
            try {
                Document documento = new Document();
                PdfWriter.getInstance(documento, out);

                documento.open();

                Paragraph par1 = new Paragraph();
                Font fontit = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.GRAY);
                par1.add(new Phrase("Pin de Acceso HeartsTics", fontit));
                par1.setAlignment(Element.ALIGN_CENTER);
                par1.add(new Phrase(Chunk.NEWLINE));
                par1.add(new Phrase(Chunk.NEWLINE));
                documento.add(par1);
//                Image image = Image.getInstance("E:\\ArchivosVarios\\logoColegio.png");
//                image.scalePercent(50);
                Image image = Image.getInstance(foto);
                image.scalePercent(60);

                Font fuentetabla = FontFactory.getFont("Arial", 8, Font.BOLD, BaseColor.BLACK);
                Font fuentetablaPin = FontFactory.getFont("Arial", 10, Font.BOLD, BaseColor.BLACK);
                Font fuentetablaHeader = FontFactory.getFont("Arial", 9, Font.BOLD, BaseColor.BLACK);
                
                Servicio controlador = new Servicio();
                Pin estudiante = controlador.pinEstudiante(idEstudiante);
                PdfPTable tabla = new PdfPTable(3);

                tabla.setWidthPercentage(60);

                PdfPCell celdaHeader = new PdfPCell(new Paragraph("COLEGIO SAGRADOS CORAZONES", fuentetablaHeader));
                celdaHeader.setVerticalAlignment(Element.ALIGN_MIDDLE);
                celdaHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
                celdaHeader.setColspan(3);
                tabla.addCell(celdaHeader);
                PdfPCell celda01 = new PdfPCell(image);
                //PdfPCell celda01 = new PdfPCell(new Paragraph("imagen"));
                celda01.setHorizontalAlignment(Element.ALIGN_CENTER);
                celda01.setVerticalAlignment(Element.ALIGN_MIDDLE);
                celda01.setRowspan(2);
                celda01.setBorder(Rectangle.NO_BORDER);
                celda01.setBorder(Rectangle.LEFT);
                tabla.addCell(celda01);

                PdfPCell celda1 = new PdfPCell(new Paragraph("Estudiante: " + estudiante.getNombres() + " " + estudiante.getApellidos(), fuentetabla));
                PdfPCell celda2 = new PdfPCell(new Paragraph("Pin: " + estudiante.getIdPin(), fuentetablaPin));
                PdfPCell celda3 = new PdfPCell(new Paragraph("Fecha creacion: " + estudiante.getInicio(), fuentetabla));
                PdfPCell celda4 = new PdfPCell(new Paragraph("Fecha vencimiento: " + estudiante.getFin(), fuentetabla));

                celda1.setHorizontalAlignment(Element.ALIGN_CENTER);
                celda1.setVerticalAlignment(Element.ALIGN_MIDDLE);
                celda1.setColspan(2);
                celda1.setBorder(Rectangle.NO_BORDER);
                celda1.setBorder(Rectangle.RIGHT);

                celda2.setHorizontalAlignment(Element.ALIGN_CENTER);
                celda2.setVerticalAlignment(Element.ALIGN_MIDDLE);
                celda2.setColspan(2);
                celda2.setBorder(Rectangle.NO_BORDER);
                celda2.setBorder(Rectangle.RIGHT);

                PdfPTable tableFecha = new PdfPTable(2);
                tableFecha.setWidthPercentage(60);
                celda3.setHorizontalAlignment(Element.ALIGN_CENTER);
                celda4.setHorizontalAlignment(Element.ALIGN_CENTER);

                tabla.addCell(celda1);
                tabla.addCell(celda2);
                tableFecha.addCell(celda3);
                tableFecha.addCell(celda4);
                Paragraph par2 = new Paragraph();

                par2.add(new Phrase(Chunk.NEWLINE));
                documento.add(par2);

                documento.add(tabla);
                documento.add(tableFecha);

                documento.close();

            } catch (Exception e) {
                e.getMessage();
            }
        } finally {
            out.close();
        }

    }

}
