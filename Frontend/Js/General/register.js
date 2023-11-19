document.getElementById("loginlck").addEventListener('click', e=>{
    location.href = "./login.html"
})



const realizarRegistro = () =>{

    const firstName = document.getElementById('IDName').value.trim();
    const lastName = document.getElementById('IDLastname').value.trim();
    const username = document.getElementById('IDUsername').value.trim();
    const email = document.getElementById('IDEmail').value.trim();
    const cellphone = document.getElementById('IDCellphone').value.trim();
    const address = document.getElementById('IDAddress').value.trim();
    const password = document.getElementById('IDPassword').value.trim();
    const repeatPassword = document.getElementById('IDRepeat').value.trim();

    // Valida que ninguno esté vacío
    if (
    !firstName ||
    !lastName ||
    !username ||
    !email ||
    !cellphone ||
    !address ||
    !password ||
    !repeatPassword
    ) {

        Swal.fire({
            title: "Revisaste los campos?",
            text: "Faltan datos por llenar!",
            icon: "question"
        });

    } else if(password!=repeatPassword){

        Swal.fire({
            title: "Las contraseñas no coinciden",
            text: "Las contraseñas registradas no son iguales, verificalas!",
            icon: "question"
        });

    } else {

        const firstNameParts = firstName.split(' ');
        const lastNameNameParts = lastName.split(' ');
    
        // Inicializa las variables con valores por defecto
        let primerNombre = '';
        let segundoNombre = '';
        let primerApellido = '';
        let segundoApellido = '';
    
        // Asigna valores a las variables según la cantidad de partes en el nombre completo
        if (firstNameParts.length > 0) {
            primerNombre = firstNameParts[0];
        }
        if (firstNameParts.length > 1) {
            segundoNombre = firstNameParts[1];
        }
        if (lastNameNameParts.length > 0) {
            primerApellido = lastNameNameParts[0];
        }
        if (lastNameNameParts.length > 1) {
            segundoApellido = lastNameNameParts.slice(1).join(' '); // Une las partes restantes para el segundo apellido
        }
    
        realizarPeticion(primerNombre, segundoNombre, primerApellido, segundoApellido, username, email, cellphone, address, password, repeatPassword)

    }



}


const realizarPeticion = (primerNombre, segundoNombre, primerApellido, segundoApellido, username, email, cellphone, address, password, repeatPassword) =>{

    const apiUrl = 'http://localhost/php-html/ProyectoFinal/Backend/Api/RegisterApi.php';

    const requestData = {
        primerNombre: primerNombre,
        segundoNombre: segundoNombre,
        primerApellido: primerApellido,
        segundoApellido: segundoApellido,
        celular: cellphone,
        direcion: address,
        correo: email,
        rol: "cliente",
        usuario: username,
        contrasena: password,
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

        const rol = data[0].RolUsuario;
        const mensaje = data[0].Mensaje;
        const idUser = data[0].UserID;

        if(mensaje == "Usuario creado con éxito"){

            Swal.fire({
                title: "Usuario registrado",
                text: "Usuario creado con éxito!",
                icon: "success",
                showConfirmButton: true,
                timer: 1500
            }).then((result) => {
    
                location.href = "./login.html"
    
            });

        }else{

            Swal.fire({
                title: 'Error!',
                text: 'Registro de usuario fallido!',
                icon: 'error',
                confirmButtonText: 'Ok'
            })

        }

    })
    .catch(error => {

        Swal.fire({
            title: 'Error!',
            text: 'Estamos teniendo problemas con el servicio!',
            icon: 'error',
            confirmButtonText: 'Ok'
        })

        console.error('Error en la solicitud:', error);

    });


}