package InterfazDatos;

import ClasesDTO.Periodo;

public interface IPeriodoDao {
    
    public boolean insertarPeriodo(Periodo periodo);
    
    public boolean desactivarPeriodo();
    
    public boolean activarPeriodo();
    
    public Periodo obtenerPeriodoActivo();
}
