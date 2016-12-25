package ClasesDTO;

import java.io.Serializable;

public class PaginaTipoUsuario implements Serializable{
    
    private Pagina pagina;
    private TipoUsuario tipo;
    private CarpetaPagina carpeta;

    public PaginaTipoUsuario() {
    }

    public Pagina getPagina() {
        return pagina;
    }

    public void setPagina(Pagina pagina) {
        this.pagina = pagina;
    }

    public TipoUsuario getTipo() {
        return tipo;
    }

    public void setTipo(TipoUsuario tipo) {
        this.tipo = tipo;
    }

    public CarpetaPagina getCarpeta() {
        return carpeta;
    }

    public void setCarpeta(CarpetaPagina carpeta) {
        this.carpeta = carpeta;
    }
    

    
}
