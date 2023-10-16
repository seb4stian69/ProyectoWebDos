 // Función para agregar una nueva fila a la tabla
 function agregarFila() {
    const nombre = document.getElementById("nombreInput").value;
    const precio = document.getElementById("precioInput").value;
    const url = document.getElementById("urlInput").value;
    const disponibilidad = document.getElementById("disponibilidadInput").value;
    const categoria = document.getElementById("categoriaInput").value;
    const subcategoria = document.getElementById("subcategoriaInput").value;

    // Verifica si todos los campos tienen contenido antes de agregar una nueva fila
    if (nombre && precio && url && disponibilidad && categoria && subcategoria) {
        const tableBody = document.getElementById("tableBody");
        const newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td>${nombre}</td>
            <td>${precio}</td>
            <td><a href="${url}">Enlace</a></td>
            <td>${disponibilidad}</td>
            <td>${categoria}</td>
            <td>${subcategoria}</td>
            <td><button onclick="editarFila(this)">Editar</button></td>
            <td><button onclick="eliminarFila(this)">Eliminar</button></td>
        `;
        tableBody.appendChild(newRow);

        // Limpia los campos de entrada
        document.getElementById("nombreInput").value = "";
        document.getElementById("precioInput").value = "";
        document.getElementById("urlInput").value = "";
        document.getElementById("disponibilidadInput").value = "";
        document.getElementById("categoriaInput").value = "";
        document.getElementById("subcategoriaInput").value = "";
    } else {
      alert("Faltan datos por ingresar");
    }
}

// Función para editar una fila
function editarFila(button) {
  const row = button.closest("tr");
  const cells = row.getElementsByTagName("td");

  // Habilita la edición de celdas (excepto el último botón)
  for (let i = 0; i < cells.length - 2; i++) {
    const cell = cells[i];
    const text = cell.innerText;
    cell.innerHTML = `<input type="text" value="${text}">`;
  }

  // Cambia el texto del botón "Editar" a "Guardar"
  button.innerText = "Guardar";

  // Cambia el evento onclick para guardar la edición
  button.onclick = function () {
    guardarEdicion(row);
  };
}

// Función para guardar la edición de una fila
function guardarEdicion(row) {
  const cells = row.getElementsByTagName("td");

  // Deshabilita la edición de celdas
  for (let i = 0; i < cells.length - 2; i++) {
    const cell = cells[i];
    const input = cell.querySelector("input");
    const text = input.value;
    cell.innerText = text;
  }

  // Cambia el botón "Guardar" de nuevo a "Editar"
  const editButton = cells[cells.length - 2].querySelector("button");
  editButton.innerText = "Editar";

  // Cambia el evento onclick de nuevo a editarFila
  editButton.onclick = function () {
    editarFila(editButton);
  };
}

// Función para eliminar una fila
function eliminarFila(button) {
  const row = button.closest("tr");
  row.remove();
}

// Escucha el evento "keydown" en el campo de entrada
document.addEventListener("keydown", function(event) {
    if (event.ctrlKey && event.key === "Enter") {
        agregarFila();
    }
});