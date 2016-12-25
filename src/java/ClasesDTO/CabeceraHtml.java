
package ClasesDTO;

public class CabeceraHtml {
    
    private String idNav;
    private String idLi;
    private String titulo;
    private String posicion;
    private String nombre;
    private String url;

    public CabeceraHtml() {
    }

//    public CabeceraHtml(String idNav, String titulo, String url) {
//        this.idNav = idNav;
//        this.titulo = titulo;
//        this.url = url;
//    }
    public CabeceraHtml(String idLi, String nombre, String titulo) {
        this.idLi = idLi;
        this.nombre = nombre;
        this.titulo = titulo;
    }

    public CabeceraHtml(String idNav, String idLi, String posicion, String titulo, String nombre, String url) {
        this.idNav = idNav;
        this.idLi = idLi;
        this.posicion = posicion;
        this.titulo = titulo;
        this.nombre = nombre;
        this.url = url;
    }

    public String getPosicion() {
        return posicion;
    }

    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }
    

    public String getIdLi() {
        return idLi;
    }

    public void setIdLi(String idLi) {
        this.idLi = idLi;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
    public String getIdNav() {
        return idNav;
    }

    public void setIdNav(String idNav) {
        this.idNav = idNav;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
}
