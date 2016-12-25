
package ClasesDTO;

import java.io.Serializable;

public class CarpetaPagina implements Serializable {
    
    private String nombre;
    private String icono;
    private int codigo;

    public CarpetaPagina() {
    }
    public CarpetaPagina( int codigo, String nombre, String icono) {
        this.nombre = nombre;
        this.icono = icono;
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getIcono() {
        return icono;
    }

    public void setIcono(String icono) {
        this.icono = icono;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    
    
    
    
}
