function eliminarDiv(elementoAEliminar) {
    // Obtenemos el elemento padre (el div con la clase "clotheCard") del elemento que ha sido clickeado.
    var divPadre = elementoAEliminar.parentElement;
    // Eliminamos el elemento padre.
    divPadre.remove();
}