<%@page import="ClasesDTO.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ClasesDTO.Grupo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio"/>

<%
    int cad = Integer.parseInt(request.getParameter("valor"));
    ArrayList<Grupo> listaGrupos = controlador.listarGrupos();
    Usuario estudiante = controlador.datosUsuario(cad);
%>

<section class="section">
    <div class="card">
        <div class="card-block">
            <div class="title-block">
                <h3 class="title">
                    Actualizar Curso a <%=estudiante.getNombres()+ " " + estudiante.getApellidos() %>
                </h3> 
            </div>
            <div class="table-responsive">
                <form action="../UtilVistas/actualizandoCurso.jsp" method="post" class="form-login"> 
                    <div class="form-group">
                        <label>Seleccionar curso</label>
                        <select name="curso" class="form-control">
                            <option>Seleccione un curso</option>
                            <%for (Grupo lis : listaGrupos){%>
                            <option value="<%=lis.getIdCurso().getIdCurso() %>"><%=lis.getIdCurso().getDescripcion() %></option>
                            <%}%>
                        </select>
                    </div>
                    <input type="hidden" name="est" value="<%=cad%>">
                    <input class="btn btn-success" type="submit" id="boton-login" value="Entrar">
                </form>
            </div>
        </div>
    </div>
</section>


