import { insertarData } from "../common/insertarData.mjs";

export const obtener = (apiUrl) =>{
  
    const requestOptions = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
        }
    };
  
    fetch(apiUrl, requestOptions)
    .then(response => response.json())
    .then(data => {
        insertarData(data);
    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });
  
}
  
export const crear = (apiUrl, requestData) =>{
  
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
            title: "Elemento agregado con éxito",
            showConfirmButton: false,
            timer: 1500
        });

    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });
  
}

export const actualizar = (apiUrl, requestData) =>{
  
    const requestOptions = {
        method: 'PUT',
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
            title: "Elemento actualizado con éxito",
            showConfirmButton: false,
            timer: 1500
        });

    })  
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });
  
}

export const eliminar = (apiUrl, id) =>{
  
    const requestOptions = {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({_id:id})
    };
  
    fetch(apiUrl, requestOptions)
    .then(response => response.json())
    .then(data => {

        Swal.fire({
            position: "bottom-start",
            icon: "success",
            title: "Elemento eliminado con éxito",
            showConfirmButton: false,
            timer: 1500
        });

    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });
  
}