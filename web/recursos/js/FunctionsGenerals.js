function cargarArchivo(elemento, id) {

    var file = elemento.files[0];
    var formulario = document.getElementById("formu" + id);
    var objHidden = document.getElementById("nombreImagen" + id);
    objHidden.value = file.name;
    formulario.submit();

}

function EditarCurso(e) {
    document.getElementById("opcion").value = e;
    var form = document.getElementById("frmEditarCurso");
    form.submit();
}
$(document).ready(function() {

    var prueba = document.getElementsByClassName("btnhref");
    
    pru = Array();
    for (var i = 0; i < prueba.length; i++) {
        prueba[i].addEventListener('click', function(){
           console.log(this.className); 
        });
    }
//
//    var tdEditarInfoForm = document.getElementsByClassName("tdEditarInfoForm");
//    var tdEditarInfo = document.getElementsByClassName("tdEditarInfo");
//    $(".btnMostrarForm").on('click', function() {
//        $(".tdEditarInfo").css('display', 'none');
//        $(".tdEditarInfoForm").css('display', 'block');
//    });
//    $(".btnEnviarForm").on('click', function() {
//        $(".formEditar").submit();
//    });
//    $(".btnCerrarForm").on('click', function() {
//        $(".tdEditarInfo").css('display', 'block');
//        $(".tdEditarInfoForm").css('display', 'none');
//    });
});
function DescripcionCurso(e) {
    var form = document.getElementById("formularioCurso" + e);
    var td = document.getElementById("tdDescripcionCurso" + e);
    var tdform = document.getElementById("tdDescripcionCursoForm" + e);
    var submi = document.getElementById("submit" + e);
    var clos = document.getElementById("close" + e);
    td.style.display = "none";
    tdform.style.display = "block";
    tdform.style.border = "0";
    submi.addEventListener("click", function() {
        form.submit();
    });
    clos.addEventListener("click", function() {
        td.style.display = "block";
        tdform.style.display = "none";
    });
    //$("#tdDescripcionCurso").hide();
}

function mostrarModal() {
    var urlCerrar = document.getElementById("urlCerrar").value; //Url al cerrar Modal
    var urlConfirm = document.getElementById("urlConfirm").value; //Url al aceptar Modal
    var tipoModal = document.getElementById("tipoModal").value; //Tipo de ventana Modal (mensaje||confirmar)
    var mensajeModal = document.getElementById("mensajeModal").value; //Contenido Mensaje

    var modalConfirmar = document.getElementById("confirm-modal1"); //Caja Modal Confirmar
    var modalMensaje = document.getElementById("confirm-modal2"); //Caja Modal Mensaje

    var mensajeParrafo1 = document.getElementById("confirmModalParrafo1"); //mensaje Confirmar
    var mensajeParrafo2 = document.getElementById("confirmModalParrafo2"); //mensaje Mensaje

    var aceptarModal1 = document.getElementById("aceptarModal1"); //Si enviar
    var aceptarModal2 = document.getElementById("aceptarModal2"); //Si enviar

    var cerrarModalPrim1 = document.getElementById("cerrarModalPrim1"); //No enviar
    var cerrarModalPrim2 = document.getElementById("cerrarModalPrim2"); //Si enviar

    var cerrarModalSec1 = document.getElementById("cerrarModalSec1"); //No enviar


    if (tipoModal !== null) {
        if (tipoModal === "confirmar") {
            modalConfirmar.style.opacity = "1";
            modalConfirmar.style.display = "block";
            mensajeParrafo1.innerHTML = mensajeModal;
            aceptarModal1.onclick = function() {
                modalConfirmar.style.display = "none";
                modalConfirmar.style.opacity = "0";
                window.location = urlConfirm;
            };
            cerrarModalSec1.onclick = function() {
                modalConfirmar.style.display = "none";
                modalConfirmar.style.opacity = "0";
                window.location = urlCerrar;
            };
            cerrarModalPrim1.onclick = function() {
                modalConfirmar.style.display = "none";
                modalConfirmar.style.opacity = "0";
                window.location = urlCerrar;
            };
        } else if (tipoModal === "mensaje") {
            modalMensaje.style.opacity = "1";
            modalMensaje.style.display = "block";
            mensajeParrafo2.innerHTML = mensajeModal;
            cerrarModalPrim2.onclick = function() {
                modalConfirmar.style.display = "none";
                modalConfirmar.style.opacity = "0";
                window.location = urlConfirm;
            };
            aceptarModal2.onclick = function() {
                modalConfirmar.style.display = "none";
                modalConfirmar.style.opacity = "0";
                window.location = urlConfirm;
            };
        }
    }

//    var modal = document.getElementById("confirm-modal");
//    var parrafo = document.getElementById("confirm-modal-parrafo");
//    var cerrar1 = document.getElementById("confirm-modal-cerrar-1");
//    var cerrar2 = document.getElementById("confirm-modal-cerrar-2");
//    var enviar = document.getElementById("confirm-modal-enviar");
//
//    modal.style.opacity = "1";
//    modal.style.display = "block";
//    parrafo.innerHTML = "Seguro que desea elmininar esta noticia?";
//    cerrar1.onclick = function() {
//        modal.style.display = "none";
//        modal.style.opacity = "0";
//    };
//    cerrar2.onclick = function() {
//        modal.style.display = "none";
//        modal.style.opacity = "0";
//    };
//    enviar.onclick = function() {
//        window.location = url;
//    };
}

function urlVentana() {
    var url = window.location;
    var inputUrl = document.getElementById("urlVentana");
    inputUrl.value = url;
}
function subirFoto(elemento) {
    var file = elemento.files[0];
    var objHidden = document.getElementById("nombreImg");
    objHidden.value = file.name;
}
function nuevo(opcion) {
    var noticias = document.getElementById("session-nueva-noticia");
    var carrucel = document.getElementById("nuevo-carrucel");
    if (opcion === 1) {
        noticias.style.display = "block";
    } else if (opcion === 2) {
        noticias.style.display = "none";
    } else if (opcion === 3) {
        carrucel.style.display = "block";
    } else if (opcion === 4) {
        carrucel.style.display = "none";
    }
}
function nuevoLink(opcion, idClasifi) {
    var form = document.getElementById("formAddLinks" + idClasifi);
    var input = document.getElementById("primerinput" + idClasifi);
    if (opcion === 1) {
        form.style.display = "block";
        input.focus();
    } else if (opcion === 2) {
        form.style.display = "none";
    }
}

function editarNoticias(element, id) {
    var desc = document.getElementById("pEditNot" + id + "des");
    var url = document.getElementById("pEditNot" + id + "url");
    var pos = document.getElementById("pEditNot" + id + "pos");
    var titulo = document.getElementById("pEditNot" + id + "titulo");
    var divdesc = document.getElementById("divEditNot" + id + "des");
    var divurl = document.getElementById("divEditNot" + id + "url");
    var divpos = document.getElementById("divEditNot" + id + "pos");
    var divtitulo = document.getElementById("divEditNot" + id + "titulo");
    if (element === 1) {
        desc.style.display = "none";
        divdesc.style.display = "";
    } else if (element === 2) {
        desc.style.display = "";
        divdesc.style.display = "table-column";
        url.style.display = "";
        divurl.style.display = "table-column";
        pos.style.display = "";
        divpos.style.display = "table-column";
        titulo.style.display = "";
        divtitulo.style.display = "table-column";
    } else if (element === 3) {
        url.style.display = "none";
        divurl.style.display = "";
    } else if (element === 4) {
        pos.style.display = "none";
        divpos.style.display = "";
    } else if (element === 5) {
        titulo.style.display = "none";
        divtitulo.style.display = "";
    }
}

function formEditarNoticias(opcion, id) {
    var fomDesc = document.getElementById("form-editar-noticias" + id + "des");
    var fomUrl = document.getElementById("form-editar-noticias" + id + "url");
    var formpos = document.getElementById("form-editar-noticias" + id + "pos");
    var formtitulo = document.getElementById("form-editar-noticias" + id + "titulo");
    if (opcion === 1) {
        fomDesc.submit();
    } else if (opcion === 2) {
        fomUrl.submit();
    } else if (opcion === 3) {
        formpos.submit();
    } else if (opcion === 4) {
        formtitulo.submit();
    }
}

function login() {
    var errorInicio = document.getElementById("notificacion-login");
    var user = document.login.username;
    var pass = document.login.password;
    var mensaje1 = document.getElementById("mensaje1");
    var mensaje2 = document.getElementById("mensaje2");
    switch (errorInicio.value) {
        case "1":
            mensaje2.innerHTML = "* Contrase&ncaron;a incorrecta";
            pass.focus();
            break;
        case "2":
            mensaje1.innerHTML = "* El usuario no existe";
            user.focus();
            break;
        default:
            break;
    }
}

function agregarLiCabecera(opcion, id) {
    var mostrar = "mostrarForm" + id;
    var divVentana = document.getElementById(mostrar);
    var input = document.getElementById("inputPrimer" + id);
    if (opcion === 1) {
        divVentana.style.display = "";
        input.focus();
    } else if (opcion === 2) {
        divVentana.style.display = "table-column";
    }
}

function editarFooter(element, id) {
    var mostrar1 = "mostrar" + id,
            mostrar2 = "mostrar" + id + "valor",
            ocultar1 = "ocultar" + id,
            ocultar2 = "ocultar" + id + "valor",
            formulario = "form-editar-footer-" + id,
            formulario2 = "form-editar-footer-" + id + "valor",
            form = document.getElementById(formulario),
            form1 = document.getElementById(formulario2);
    var mostrar = document.getElementById(mostrar1);
    var ocultar = document.getElementById(ocultar1);
    var mostrar3 = document.getElementById(mostrar2);
    var ocultar3 = document.getElementById(ocultar2);
    if (element === 1) {
        mostrar.style.display = 'block';
        ocultar.style.display = 'none';
    } else if (element === 2) {
        ocultar.style.display = 'block';
        mostrar.style.display = 'none';
    } else if (element === 3) {
        form.submit();
    } else if (element === 4) {
        mostrar3.style.display = 'block';
        mostrar3.style.position = "absolute";
        ocultar3.style.opacity = '0';
    } else if (element === 5) {
        ocultar3.style.opacity = '1';
        ocultar3.style.display = 'block';
        mostrar3.style.display = 'none';
    } else if (element === 6) {
        form1.submit();
    }
}

function editarCabecera(element, id) { //hacer visible el div con el fomrlario de actualizacion de cabecera
    var pos = document.getElementById("pEditCab" + id + "pos");
    var nom = document.getElementById("pEditCab" + id + "nom");
    var url = document.getElementById("pEditCab" + id + "url");
    var divpos = document.getElementById("divEditCab" + id + "pos");
    var divnom = document.getElementById("divEditCab" + id + "nom");
    var divurl = document.getElementById("divEditCab" + id + "url");
    if (element === 1) { //hacer visible form posicion
        pos.style.display = "none";
        divpos.style.display = "";
    } else if (element === 2) { //hacer visible form nombre
        nom.style.display = "none";
        divnom.style.display = "";
    } else if (element === 3) { // hacer visible form url
        url.style.display = "none";
        divurl.style.display = "";
    } else if (element === 4) {
        pos.style.display = "";
        divpos.style.display = "table-column";
        nom.style.display = "";
        divnom.style.display = "table-column";
        url.style.display = "";
        divurl.style.display = "table-column";
    }
}

function formCabeceraUpdate(opcion, idLi) {  //enviar formulario de actualizacion de cabecera
    var fomPos = document.getElementById("form-editar-cabecera" + idLi + "pos");
    var fomNom = document.getElementById("form-editar-cabecera" + idLi + "nom");
    var fomUrl = document.getElementById("form-editar-cabecera" + idLi + "url");
    if (opcion === 1) {
        fomPos.submit();
    } else if (opcion === 2) {
        fomNom.submit();
    } else if (opcion === 3) {
        fomUrl.submit();
    }

}

function editarSliderUp(element, id) {
    var posicion = document.getElementById("pEditSlider" + id + "pos");
    var text1 = document.getElementById("pEditSlider" + id + "text1");
    var text2 = document.getElementById("pEditSlider" + id + "text2");
    var text3 = document.getElementById("pEditSlider" + id + "text3");
    var urlLink = document.getElementById("pEditSlider" + id + "urlLink");
    var divposicion = document.getElementById("divEditSli" + id + "pos");
    var divtext1 = document.getElementById("divEditSli" + id + "text1");
    var divtext2 = document.getElementById("divEditSli" + id + "text2");
    var divtext3 = document.getElementById("divEditSli" + id + "text3");
    var divurlLink = document.getElementById("divEditSli" + id + "urlLink");
    if (element === 1) { //hacer visible form posicion
        text1.style.display = "none";
        divtext1.style.display = "";
        text2.style.display = "";
        divtext2.style.display = "table-column";
        text3.style.display = "";
        divtext3.style.display = "table-column";
        urlLink.style.display = "";
        divurlLink.style.display = "table-column";
    } else if (element === 2) { //hacer visible form nombre
        text2.style.display = "none";
        divtext2.style.display = "";
        text1.style.display = "";
        divtext1.style.display = "table-column";
        text3.style.display = "";
        divtext3.style.display = "table-column";
        urlLink.style.display = "";
        divurlLink.style.display = "table-column";
        posicion.style.display = "";
        divposicion.style.display = "table-column";
    } else if (element === 3) { // hacer visible form url
        text3.style.display = "none";
        divtext3.style.display = "";
        text1.style.display = "";
        divtext1.style.display = "table-column";
        text2.style.display = "";
        divtext2.style.display = "table-column";
        urlLink.style.display = "";
        divurlLink.style.display = "table-column";
        posicion.style.display = "";
        divposicion.style.display = "table-column";
    } else if (element === 4) {
        urlLink.style.display = "none";
        divurlLink.style.display = "";
        text1.style.display = "";
        divtext1.style.display = "table-column";
        text2.style.display = "";
        divtext2.style.display = "table-column";
        text3.style.display = "";
        divtext3.style.display = "table-column";
        posicion.style.display = "";
        divposicion.style.display = "table-column";
    } else if (element === 5) {
        text1.style.display = "";
        divtext1.style.display = "table-column";
        text2.style.display = "";
        divtext2.style.display = "table-column";
        text3.style.display = "";
        divtext3.style.display = "table-column";
        urlLink.style.display = "";
        divurlLink.style.display = "table-column";
        posicion.style.display = "";
        divposicion.style.display = "table-column";
    } else if (element === 6) {
        posicion.style.display = "none";
        divposicion.style.display = "";
        text1.style.display = "";
        divtext1.style.display = "table-column";
        text2.style.display = "";
        divtext2.style.display = "table-column";
        text3.style.display = "";
        divtext3.style.display = "table-column";
        urlLink.style.display = "";
        divurlLink.style.display = "table-column";
    }
}

function formSliderUpdate(opcion, idSlider) {  //enviar formulario de actualizacion de cabecera
    var fomtext1 = document.getElementById("form-editar-slider-up" + idSlider + "text1");
    var fomtext2 = document.getElementById("form-editar-slider-up" + idSlider + "text2");
    var fomtext3 = document.getElementById("form-editar-slider-up" + idSlider + "text3");
    var fomUrlLink = document.getElementById("form-editar-slider-up" + idSlider + "urlLink");
    var fomPosicion = document.getElementById("form-editar-slider-up" + idSlider + "pos");
    if (opcion === 1) {
        fomtext1.submit();
    } else if (opcion === 2) {
        fomtext2.submit();
    } else if (opcion === 3) {
        fomtext3.submit();
    } else if (opcion === 4) {
        fomUrlLink.submit();
    } else if (opcion === 5) {
        fomPosicion.submit();
    }

}

function eliminarLiCabe(url) {
    window.location.href = "administrar-cabecera.jsp\n\
?tipoModal=confirmar\n\
&mensajeModal=Seguro que desea eliminar el submenu?\n\
&urlConfirm=" + url + "\n\
&urlCerrar=administrar-cabecera.jsp";
}
function eliminarNoticia(url) {
    window.location.href = "administrar-noticias.jsp\n\
?tipoModal=confirmar\n\
&mensajeModal=Realmente desea eliminar esta noticia?\n\
&urlConfirm=" + url + "\n\
&urlCerrar=administrar-noticias.jsp";
}
function eliminarPublicidad(url) {
    window.location.href = "administrar-imagenes.jsp\n\
?tipoModal=confirmar\n\
&mensajeModal=Realmente desea eliminar esta publicidad?\n\
&urlConfirm=" + url + "\n\
&urlCerrar=administrar-imagenes.jsp";
}
function eliminarSlider(url) {
    window.location.href = "administrar-carrucel-superior.jsp\n\
?tipoModal=confirmar\n\
&mensajeModal=Realmente desea eliminar este carrucel?\n\
&urlConfirm=" + url + "\n\
&urlCerrar=administrar-carrucel-superior.jsp";
}
function eliminarClasificado(url) {
    window.location.href = "administrar-clasificados.jsp\n\
?tipoModal=confirmar\n\
&mensajeModal=Realmente desea eliminar este clasificado?\n\
&urlConfirm=" + url + "\n\
&urlCerrar=administrar-clasificados.jsp";
}
function eliminarClasificadoLink(url) {
    window.location.href = "administrar-clasificados.jsp\n\
?tipoModal=confirmar\n\
&mensajeModal=Realmente desea eliminar ese link?\n\
&urlConfirm=" + url + "\n\
&urlCerrar=administrar-clasificados.jsp";
}

window.onload = function() {
    mostrarModal();
}
