/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InterfazDatos;

import ClasesDTO.Curso;
import ClasesDTO.Pin;
import java.util.ArrayList;

/**
 *
 * @author Estudiante
 */
public interface IPinDao {

    public boolean insertPin(String pin, int idUsuario, String fechaVencimiento);

    public boolean updatePin(String pin, int idUsuario);

    public Pin getPinUsuario(int idUsuario);

    public boolean validarPin(String pin, int idUsuario);
    
    public ArrayList<Pin> listarEstudiantesPinCurso(int curso);
    
    public ArrayList<Pin> listarEstudiantesPinGrupo(int curso, char grupo);
    
    public boolean actualizarEstadoPin(String estado, int idUsuario);
    
    public boolean editarPin(String fechaInicio, String fechaFin, String idPin, String estado, int idEst );


}
