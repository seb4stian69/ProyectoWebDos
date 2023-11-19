let cont = 0;
let miGrafico;

const creacionDeGrafico = (labels, data) =>{

    // Obtén el elemento canvas por su id
    var ctx = document.getElementById('miGrafico').getContext('2d');

    // Inicializa el gráfico con datos predeterminados (Enero)
    var data = {
        labels: labels,
        datasets: [{
            label: 'Ventas',
            data: data,
            backgroundColor: 'rgba(75, 192, 192, 0.2)', // Color de fondo de las barras
            borderColor: 'rgba(75, 192, 192, 1)', // Color del borde de las barras
            borderWidth: 1 // Ancho del borde de las barras
        }]
    };

    var options = {
        scales: {
            y: {
                beginAtZero: true // Comienza el eje Y en cero
            }
        }
    };

    // Crea el gráfico de barras
    miGrafico = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
    });

    cont++;

}

const actualizarGrafico = () =>{

    // Función para actualizar el gráfico según la opción seleccionada
    var seleccionMes = document.getElementById('seleccionMes');
    var mesSeleccionado = seleccionMes.value;
    
    obtenerSubTotalPorProducto(mesSeleccionado);

}

const obtenerTotalGanancias  = (mes) =>{

    const apiUrl = 'http://localhost/php-html/ProyectoFinal/Backend/Api/GerenteApi.php';

    const requestData = {
        consulta: "total",
        mes: mes,
        anio: 2023
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
        document.getElementById("totalVendido").innerText = `Total vendido mes: ${data[0]?data[0].SumaTotalVendido.toFixed(3):""}$`
    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });


}

const obtenerSubTotalPorProducto  = (mes) =>{

    const apiUrl = 'http://localhost/php-html/ProyectoFinal/Backend/Api/GerenteApi.php';

    const requestData = {
        consulta: "",
        mes: mes,
        anio: 2023
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
       
        var labelsG = [];
        var datos = [];

        for (var i = 0; i < data.length; i++) {
            labelsG.push(data[i].nombre);
            datos.push(data[i].cantidad);
        }

        if(cont == 0){
            creacionDeGrafico(labelsG, datos)
        }else{
            miGrafico.data.labels = labelsG;
            miGrafico.data.datasets[0].data = datos;
            miGrafico.update();
        }

        obtenerTotalGanancias(mes)

    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });


}

obtenerSubTotalPorProducto(1)