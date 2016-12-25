package ClasesDTO;

public class ArchivoNube {
    
    private int id;
    private String url;
    private Usuario usuario;

    public ArchivoNube() {
    }

    public ArchivoNube(int id, String url) {
        this.id = id;
        this.url = url;
    }

    public ArchivoNube(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    
}
