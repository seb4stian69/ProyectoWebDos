document.getElementById("leftMenu_Feedback").addEventListener('click', (e)=>{

  Swal.fire({

    title: "Escribe tu PQRS",
    icon: "info",
    html: `
      <input id="pqrsInput" type="text" placeholder="Indicanos tu PQRS">
    `,
    showCloseButton: false,
    showCancelButton: true,
    focusConfirm: false,
    confirmButtonText: "Aceptar",
    confirmButtonAriaLabel: "Aceptar selección",
    allowOutsideClick: false,
        
  }).then((result) => {

    if (result.isConfirmed) {
      realizarPeticion(document.getElementById('pqrsInput').value)
    }

  });

})

const realizarPeticion = (mensaje) =>{

  const apiUrl = 'http://localhost/php-html/ProyectoFinal/Backend/Api/ServiceClientApi.php';

  const requestData = {
    log: mensaje,
    usuarioID: sessionStorage.getItem("UserID"),
  };

  const requestOptions = {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
    },
    body: JSON.stringify(requestData)
  };

  fetch(apiUrl, requestOptions)
  .then(response => response.json())
  .then(data => {

    Swal.fire({
      position: "bottom-start",
      icon: "success",
      title: "PQRS agregado con éxito",
      showConfirmButton: false,
      timer: 1500
  });

  })
  .catch(error => {    
    
    console.error('Error en la solicitud:', error);

    Swal.fire({
        title: 'Error!',
        text: 'Error en el servicio!',
        icon: 'error',
        confirmButtonText: 'Ok'
    })

  });


}
