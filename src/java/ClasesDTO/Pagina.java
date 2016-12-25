package ClasesDTO;

import java.io.Serializable;

public class Pagina implements Serializable{
    
    private String nombre;
    private String descripcion;
    private int carpeta;
    private int codigo;

    public Pagina(int codigo, String nombre, String descripcion) {
        this.nombre = nombre;
        //this.carpeta = carpeta;
        this.descripcion = descripcion; 
        this.codigo = codigo;
    }

    public Pagina(String nombre, String descripcion, int carpeta) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.carpeta = carpeta;
    }

    public Pagina(int codigo, String nombre, String descripcion, int carpeta) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.carpeta = carpeta;
        this.codigo = codigo;
    }
    

    public Pagina() {
    }
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCarpeta() {
        return carpeta;
    }

    public void setCarpeta(int carpeta) {
        this.carpeta = carpeta;
    }
    
    
    
    
    
}
