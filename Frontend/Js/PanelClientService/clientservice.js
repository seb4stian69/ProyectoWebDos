function mostrarAlerta(pqrs) {

    Swal.fire({
        title: `<strong>${pqrs._id}</strong>`,
        icon: "info",
        html: `
              <h2 style="color: #333;"></h2>
              <p style="color: #666; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">PQRS: ${pqrs.log}</p>
              <p style="color: #666; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Fecha: ${pqrs.fecha}</p>
              <p style="color: #666; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Id de usuario: ${pqrs.Usuarios__id}</p>
          </div>
        `,
        showCloseButton: true,
    });

    alert(Mensaje);
}

const realizarPeticion = () =>{

    const apiUrl = 'http://localhost/php-html/ProyectoFinal/Backend/Api/ServiceClientApi.php';

    const requestOptions = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        }
    };

    fetch(apiUrl, requestOptions)
    .then(response => response.json())
    .then(data => {

        data.forEach(pqrs=>{
            crearElemento(pqrs)
        })

    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });


}

function crearElemento(pqrs) {
    var clotheCard = document.createElement('div');
    clotheCard.id = 'clotheCard';
    
    clotheCard.addEventListener('click', (e=>{
        mostrarAlerta(pqrs);
    }))

    document.getElementById("allClothes").appendChild(clotheCard);
}

realizarPeticion();