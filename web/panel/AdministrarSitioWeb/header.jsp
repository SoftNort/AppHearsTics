<%  ArrayList<CabeceraHtml> listaCabeceraTitulo = controlador.getCabeceraTitulo();
%>
<header class="art-header">
    <div class="art-shapes">
        <div class="art-textblock art-object1612695912">
            <div class="art-object1612695912-text-container" >
                <div class="art-object1612695912-text" style="background: linear-gradient(#FF1111 50%,#770000); ">
                    <p style="
                       color: rgb(255, 241, 219); 
                       font-family: 'Times New Roman', Georgia, Times, serif; 
                       font-weight: bold; 
                       font-style: normal; 
                       text-decoration: none; 
                       font-variant: small-caps; 
                       ">
                        <span class="Apple-style-span" style="
                              font-size: 36px;
                              ">
                            Colegio Sagrados Corazones
                        </span>
                    </p>
                    <p style="
                       color: #FFE7C2; 
                       font-size:13px;
                       font-family:Arial, 'Arial Unicode MS', Helvetica, Sans-Serif;
                       text-decoration:none
                       ">
                        "Honestas Cristianas y Buenas Ciudadanas"
                    </p>
                    <p style="
                       font-size:13px;
                       font-family:Arial, 'Arial Unicode MS', Helvetica, Sans-Serif;
                       text-decoration:none
                       ">
                        <br>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <nav class="art-nav" >
        <ul class="art-hmenu">
            <li>
                <a href="<%=request.getContextPath()%>/index.jsp">Inicio</a>
            </li>
            <% for (CabeceraHtml datos : listaCabeceraTitulo) {%>
            <li>
                <a href="#<%//=request.getContextPath()%><%//=datos.getUrl()%>">
                    <%=datos.getTitulo()%>
                </a>
                <ul>
                    <%
                        ArrayList<CabeceraHtml> list = controlador.getCabeceraLi(datos.getIdNav());
                        for (CabeceraHtml lista : list) {%>
                    <li>
                        <a href="<%=request.getContextPath()%>/<%=lista.getUrl()%>">
                            <%=lista.getNombre()%>
                        </a>
                    </li>
                    <%}%>
                </ul>
            </li>
            <%}%>                            
        </ul> 
    </nav>
</header>