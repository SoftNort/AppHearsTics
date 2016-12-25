<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="controlador" scope="page" class="Controlador.Servicio"/>
<%
    String nombre = request.getParameter("nombre");
    String icono = request.getParameter("icono");
    boolean b = controlador.registrarCarpetaPagina(nombre, icono);
    if(!b){%>
        <script text="javascript">
            window.location.href = "../Vistas/administrarCarpetasPaginas.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=No se puede registrar el estudiante, <br>revise que los datos sean validos\n\
&urlConfirm=../Vistas/administrarCarpetasPaginas.jsp\n\
&urlCerrar=../Vistas/administrarCarpetasPaginas.jsp";
        </script>
    <%}else{%>
        <script text="javascript">
            window.location.href = "../Vistas/administrarCarpetasPaginas.jsp\n\
?tipoModal=mensaje\n\
&mensajeModal=La pagina ha sido registrada\n\
&urlConfirm=../Vistas/administrarCarpetasPaginas.jsp\n\
&urlCerrar=../Vistas/administrarCarpetasPaginas.jsp";
        </script>
    <%}
%>
        
