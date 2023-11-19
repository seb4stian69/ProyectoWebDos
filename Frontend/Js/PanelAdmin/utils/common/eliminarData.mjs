export const eliminarDatosObservados = () =>{

    // Elimina todos los elementos hijos del encabezadoTabla

    var encabezadoTabla = document.getElementById("encabezadoTabla");

    while (encabezadoTabla.firstChild) {
        encabezadoTabla.removeChild(encabezadoTabla.firstChild);
    }

    // Elimina todos los elementos hijos del cuerpoTabla
    
    var cuerpoTabla = document.getElementById("cuerpoTabla");

    while (cuerpoTabla.firstChild) {
        cuerpoTabla.removeChild(cuerpoTabla.firstChild);
    }

    // Elimina todos los elementos hijos del inputs

    var inputs = document.getElementById("inputs");

    while (inputs.firstChild) {
        inputs.removeChild(inputs.firstChild);
    }

}