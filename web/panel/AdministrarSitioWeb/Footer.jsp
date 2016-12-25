
<%  ArrayList<FooterHtml> listFooterDire = controlador.getFooter("Dirección");
    ArrayList<FooterHtml> listFootertelefo = controlador.getFooter("Telefonos");
    ArrayList<FooterHtml> listFooterCorreos = controlador.getFooter("Correos de Contacto");
    ArrayList<FooterHtml> listFooterMemori = controlador.getFooter("En memoria del  Beato Padre Luis Variara");
    ArrayList<FooterHtml> listFooterRedes = controlador.getFooter("Redes Sociales");
%>
<footer class="art-footer">

    <div class="art-content-layout">
        <div class="art-content-layout-row">
            <div class="art-layout-cell layout-item-0" style="width: 27%">

                <h1><span style="text-decoration: underline; ">Direcci&oacute;n</span></h1><br>
                <% for (FooterHtml direccion : listFooterDire) {%>
                <p><%=direccion.getValor()%></p><p><br></p>
                    <%}%> 

                <h1>Telefonos</h1>
                <% for (FooterHtml telefono : listFootertelefo) {%>
                <p><%=telefono.getValor()%></p>
                <%}%>

            </div><div class="art-layout-cell layout-item-0" style="width: 28%">

                <h1><span style="text-decoration: underline;">Correos de Contacto</span></h1><p><span style="text-decoration: underline;"><br></span></p>
                        <%for (FooterHtml Correos : listFooterCorreos) {%>
                <h3><span style="text-decoration: underline; font-weight: bold; color: #000000;"><%=Correos.getSubtitulo()%></span></h3>
                <p><span style="font-size: 13px;"><%=Correos.getValor()%></span></p>
                    <%}%>
            </div><div class="art-layout-cell layout-item-0" style="width: 27%">

                <h1 style="text-align: center;"><span style="text-decoration: underline;">En memoria del &nbsp;Beato Padre Luis Variara</span>
                    <%for (FooterHtml memoria : listFooterMemori) {%>
                    <a href="<%=memoria.getUrl()%>"><img width="244" height="136" style="border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; " alt="" class="art-lightbox" src="<%=request.getContextPath()%>/recursos/img/<%=memoria.getValor()%>"></a>
                        <%}%>
                </h1>
            </div><div class="art-layout-cell layout-item-0" style="width: 18%">

                <h1><span style="text-decoration: underline;">Redes Sociales</span></h1>
                <%for (FooterHtml redes : listFooterRedes) {%>

                <a href="<%=redes.getUrl()%>"><p><img width="32" height="32" alt="" src="<%=request.getContextPath()%>/recursos/img/<%=redes.getSubtitulo()%>" style="float: left; margin-right: 10px;" class=""></p>
                    <p style="padding-top: 5px; padding-right: 0px; padding-bottom: 10px; padding-left: 0px;"><%=redes.getValor()%></p><p style="padding: 5px 0 10px 0"><br></p></a>
                        <%}%>
            </div>
        </div>                        
    </div>
    <div class="art-content-layout" style="width: 100%; ">
        <div class="art-content-layout-row" >
            <div class="art-layout-cell layout-item-0" style="width: 100%">
                <p style="text-align: center;">Copyright &COPY; 2016. Todos los derechos reservados.</p><p style="text-align: center;">Creado por Ing. Jhon Perez</p><br>
            </div>
        </div>
    </div>


</footer>