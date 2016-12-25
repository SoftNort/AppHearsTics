/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package InterfazDatos;

import ClasesDTO.Curso;
import java.util.ArrayList;

/**
 *
 * @author Estudiante
 */
public interface ICursoDao {
    
    public ArrayList<Curso> listarCursos();
    
    public Curso dtoCursoId(int idCurso);
    
    public boolean registrarCurso(Curso c);
    
    public boolean actualizarCurso(Curso e);
    
    public boolean cambiarDescripcionCurso(int id, String descripcion);
    
    public boolean eliminarCursos(Curso e);
}
