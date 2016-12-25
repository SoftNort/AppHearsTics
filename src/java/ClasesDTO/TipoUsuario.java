package ClasesDTO;

import java.io.Serializable;

public class TipoUsuario implements Serializable{
    
    private long id;
    private String rol;

    public TipoUsuario(long id, String rol) {
        this.id = id;
        this.rol = rol;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
    
}
