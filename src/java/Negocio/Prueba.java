/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

import ClasesDTO.Estudiante;
import ClasesDTO.FooterHtml;
import ClasesDTO.Grupo;
import ClasesDTO.NoticiasHtml;
import ClasesDTO.PaginaTipoUsuario;
import ClasesDTO.PaginasHtml;
import ClasesDTO.Usuario;
import Controlador.Servicio;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import sun.awt.image.ByteArrayImageSource;

/**
 *
 * @author estudiante
 */
public class Prueba {

    public static void main(String[] args) {
        
        try {

            File file = new File("C:\\Users\\Usuario\\Downloads\\imagenes\\2-donde-estamos.jpg");
            System.out.println(file.exists() + "!!");
            
            FileInputStream fis = new FileInputStream(file);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            try {
                for (int readNum; (readNum = fis.read(buf)) != -1;) {
                    bos.write(buf, 0, readNum); 
                    System.out.println("read " + readNum + " bytes,");
                }
            } catch (IOException ex) {
                Logger.getLogger(ByteArrayImageSource.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            //bytes is the ByteArray we need
            byte[] bytes = bos.toByteArray();
            
            //////////////////////////////////////////////////////////////////////////////////////////////////////
            
            File newFile= new File("C:\\Users\\Usuario\\Downloads\\imagenes\\imgTest-"+System.currentTimeMillis()+".jpg");
            BufferedImage imag=ImageIO.read(new ByteArrayInputStream(bytes));
            ImageIO.write(imag, "jpg", newFile);
            
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
