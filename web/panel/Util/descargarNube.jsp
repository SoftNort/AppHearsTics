<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        String archivo = request.getParameter("url");
        String vec[] = archivo.split("/");
        File f = new File(request.getServletContext().getRealPath(archivo));
        response.setHeader("Content-Disposition", "attachment; filename=\"" + vec[vec.length - 1] + "\"");
        String name = f.getName().substring(f.getName().lastIndexOf("/") + 1, f.getName().length());
        InputStream in = new FileInputStream(f);
        ServletOutputStream outs = response.getOutputStream();
        int bit = 256;
        int i = 0;
        while ((bit) >= 0) {
            bit = in.read();
            outs.write(bit);
        }
        outs.flush();
        outs.close();
        in.close();
    } catch (IOException ioe) {
        ioe.printStackTrace(System.out);%>
        <script>
            alert('Se presentó un error al intentar descargar el archivo');
        </script>
<%}


%>
