<%-- 
    Document   : actualizandoGrado
    Created on : 30/11/2016, 10:49:27 AM
    Author     : Estudiante
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="session" class="Controlador.Servicio" />
<%
  int g= Integer.parseInt(request.getParameter("curso"));
  int idEst= Integer.parseInt(request.getParameter("est"));
    
boolean c=controlador.actualizarGrupoEstudiante(g, idEst);
 if (!c) {%>
<script text="javascript">
    window.location.href = "../Vistas/actualizarCE.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=El grado del estudiante se ha actualizado\n\
&urlConfirm=../Vistas/actualizarCE.jsp\n\
&urlCerrar=../Vistas/actualizarCE.jsp";
</script>
<%} else {%>
<script text="javascript">
    window.location.href = "../Vistas/actualizarCE.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=Error al intentar actualizar el grado, intente mas tarde\n\
&urlConfirm=../Vistas/actualizarCE.jsp\n\
&urlCerrar=../Vistas/actualizarCE.jsp";
</script>
<%}%>
