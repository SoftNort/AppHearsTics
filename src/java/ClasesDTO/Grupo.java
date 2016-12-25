package ClasesDTO;

import java.io.Serializable;

public class Grupo implements Serializable{
    
    private char idGrupo;
    private Curso myCurso;
    private Docente titular;

    public Grupo(char idGrupo, Curso idCurso, Docente titular) {
        this.idGrupo = idGrupo;
        this.myCurso = idCurso;
        this.titular = titular;
    }

    public Grupo(char idGrupo, Curso myCurso) {
        this.idGrupo = idGrupo;
        this.myCurso = myCurso;
    }
    
    

    public Grupo(){}
    
    public char getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(char idGrupo) {
        this.idGrupo = idGrupo;
    }

    public Curso getIdCurso() {
        return myCurso;
    }

    public void setIdCurso(Curso idCurso) {
        this.myCurso = idCurso;
    }

    public Docente getTitular() {
        return titular;
    }

    public void setTitular(Docente titular) {
        this.titular = titular;
    }
    
    
}
