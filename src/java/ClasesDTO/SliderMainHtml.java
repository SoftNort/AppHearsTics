/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package ClasesDTO;

/**
 *
 * @author Montes
 */
public class SliderMainHtml {
    private String idSli;
    private String parraf1;
    private String parraf2;
    private String parraf3;
    private String urlLink;
    private String posicion;
    private String urlImg;

    public SliderMainHtml() {
    }

    public SliderMainHtml(String idSli, String parraf1, String parraf2, String parraf3, String urlLink, String posicion, String urlImg) {
        this.idSli = idSli;
        this.parraf1 = parraf1;
        this.parraf2 = parraf2;
        this.parraf3 = parraf3;
        this.urlLink = urlLink;
        this.posicion = posicion;
        this.urlImg = urlImg;
    }

    public String getUrlLink() {
        return urlLink;
    }

    public void setUrlLink(String urlLink) {
        this.urlLink = urlLink;
    }
    
    public String getIdSli() {
        return idSli;
    }

    public void setIdSli(String idSli) {
        this.idSli = idSli;
    }

    public String getParraf1() {
        return parraf1;
    }

    public void setParraf1(String parraf1) {
        this.parraf1 = parraf1;
    }

    public String getParraf2() {
        return parraf2;
    }

    public void setParraf2(String parraf2) {
        this.parraf2 = parraf2;
    }

    public String getParraf3() {
        return parraf3;
    }

    public void setParraf3(String parraf3) {
        this.parraf3 = parraf3;
    }

    public String getPosicion() {
        return posicion;
    }

    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }
    
    
    
    
}
