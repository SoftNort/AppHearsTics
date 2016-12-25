package ClasesDTO;

public class MateriaDocente {
    
    private Docente docente;
    private Grupo grupo;
    private Materia materia;
    private int id;

    public MateriaDocente(int id) {
        this.id = id;
    }

    public MateriaDocente(Docente docente, Grupo grupo, Materia materia, int id) {
        this.docente = docente;
        this.grupo = grupo;
        this.materia = materia;
        this.id = id;
    }

    public Docente getDocente() {
        return docente;
    }

    public void setDocente(Docente docente) {
        this.docente = docente;
    }

    public Grupo getGrupo() {
        return grupo;
    }

    public void setGrupo(Grupo grupo) {
        this.grupo = grupo;
    }

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
