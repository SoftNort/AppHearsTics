$(document).ready(function() {
    var btnMostrar = document.getElementsByClassName("btnMostrarForm");
    var boxFormulario = document.getElementsByClassName("boxFormulario");
    var btnOcultarForm = document.getElementsByClassName("btnOcultarForm");
    var btnEnviarForm = document.getElementsByClassName("btnEnviarForm");
    var formulario = document.getElementsByClassName("formulario");

    for (var i = 0; i < btnMostrar.length; i++) {
        btnMostrar[i].addEventListener('click', function() {
            inicializarParent(btnMostrar);
            this.parentElement.style.display = 'none';
        });
        btnMostrar[i].addEventListener('click', mostrar.bind(null, i));
    }

    for (var i = 0; i < btnOcultarForm.length; i++) {
        btnOcultarForm[i].addEventListener('click', function() {
            inicializarParent(btnMostrar);
            this.parentElement.style.display = 'none';
        });
    }

    for (var i = 0; i < btnEnviarForm.length; i++) {
        btnEnviarForm[i].addEventListener('click', enviarFormulario.bind(null, i));
    }
    function enviarFormulario(index) {
        formulario[index].submit();
    }

    function mostrar(index) {
        inicializarRaiz(boxFormulario);
        boxFormulario[index].style.display = 'block';
    }
    function inicializarRaiz(elemento) {
        for (var i = 0; i < elemento.length; i++) {
            elemento[i].style.display = 'none';
        }
    }
    function inicializarParent(elemento) {
        for (var i = 0; i < elemento.length; i++) {
            elemento[i].parentElement.style.display = 'block';
        }
    }
});

//Ver acudientes
$(".boton").click(function() {
    document.getElementById("myModal").innerHTML = "";
    var imagen = document.createElement("img");
    imagen.setAttribute("src", "../../recursos/img/cargando.gif");
    imagen.setAttribute("class", "img-gif");
    var bloq = document.getElementById("myModal");
    bloq.appendChild(imagen);
    var valores = "";
    var ruta = "../UtilVistas/cargarAcudienteEstudiante.jsp";
    $(this).parents("tr").find("td").each(function() {
        valores += $(this).html() + "-";
    });
    $.post(ruta, {valor: valores},
    function(data, status) {
        $("#myModal").html(data);
    });
});
//$("#cursosList").on('change', function() {
//    document.getElementById("gruposList").innerHTML = "";
//    document.getElementById("cargarEstudiantes").innerHTML = "";
//    var imagen1 = document.createElement("img");
//    var imagen2 = document.createElement("img");
//    imagen1.setAttribute("src", "../../recursos/img/cargando.gif");
//    imagen1.setAttribute("class", "img-gif");
//    imagen2.setAttribute("src", "../../recursos/img/cargando.gif");
//    imagen2.setAttribute("class", "img-gif");
//    var bloq = document.getElementById("gruposList");
//    var bloq1 = document.getElementById("cargarEstudiantes");
//    bloq.appendChild(imagen1);
//    bloq1.appendChild(imagen2);
//    var curso = document.getElementById("cursosList").value;
//    console.log(curso + "curso");
//    var ruta = "../UtilVistas/CargarGradosPorCurso.jsp";
//    var ruta1 = "../UtilVistas/CargarEstudiantesXCurso.jsp";
//    $.post(ruta, {valor: curso},
//    function(data, status) {
//        $("#gruposList").html(data);
//    });
//    $.post(ruta1, {valor: curso},
//    function(data, status) {
//        $("#cargarEstudiantes").html(data);
//    });
//});
//Ver Estudiantes Con curso y Grupo seleccionado
$("#grupoCursoList").on('change', function() {
    var grado = document.getElementById("grupoCursoList").value;
    document.getElementById("cargarEstudiantes").innerHTML = "";
    var imagen3 = document.createElement("img");
    imagen3.setAttribute("src", "../../recursos/img/cargando.gif");
    imagen3.setAttribute("class", "img-gif");
    var bloq = document.getElementById("cargarEstudiantes");
    bloq.appendChild(imagen3);
    console.log(grado + "grado");
    var ruta = "../UtilVistas/CargarEstudiantesXGrado.jsp";
    $.post(ruta, {valor: grado},
    function(data, status) {
        $("#cargarEstudiantes").html(data);
    });
});


$("#grupos").on("change", function() {
    document.getElementById("respuesta").innerHTML = "";
    var imagen = document.createElement("img");
    imagen.setAttribute("src", "../../recursos/img/cargando.gif");
    imagen.setAttribute("class", "img-gif");
    var bloq = document.getElementById("respuesta");
    bloq.appendChild(imagen);
    var valor = document.getElementById("grupos").value;
    console.log(valor + "valor");
    var ruta = "../UtilVistas/cargarGrupos.jsp";
    $.post(ruta,
            {
                valor: valor
            },
    function(data, status) {
        $("#respuesta").html(data);
    });
});

$("#grupoSlt").on("change", function() {
    document.getElementById("respuesta2").innerHTML = "";
    var imagen = document.createElement("img");
    imagen.setAttribute("src", "../../recursos/img/cargando.gif");
    imagen.setAttribute("class", "img-gif");
    var bloq = document.getElementById("respuesta2");
    bloq.appendChild(imagen);
    var valor = document.getElementById("grupoSlt").value;
    console.log(valor + "valor");
    var ruta = "../UtilVistas/cargarEstudiantesGrupo.jsp";
    $.post(ruta,
            {
                valor: valor
            },
    function(data, status) {
        $("#respuesta2").html(data);
    });
});

function ValidarImagen(obj) {
    var uploadFile = obj.files[0];

    if (!window.FileReader) {
        alert('El navegador no soporta la lectura de archivos');
        document.getElementById("file-3").value = "";
        return;
    }

    if (!(/\.(jpg|png|gif)$/i).test(uploadFile.name)) {
        alert('El archivo a adjuntar no es una imagen');
        document.getElementById("file-3").value = "";
    }

}


