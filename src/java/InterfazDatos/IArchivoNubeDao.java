package InterfazDatos;

import java.util.ArrayList;

public interface IArchivoNubeDao {
    
    public boolean insertarArchivoNube(String url, int idMateria);
    
    public ArrayList<String> listarArchivosNube(int idMateria);
}
