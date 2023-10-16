// Obtén el elemento canvas por su id
var ctx = document.getElementById('miGrafico').getContext('2d');

// Inicializa el gráfico con datos predeterminados (Enero)
var data = {
    labels: ['Zapatos', 'Bolsos', 'Camisas', 'Camisetas', 'Gorras'],
    datasets: [{
    label: 'Ventas',
    data: [12, 19, 3, 5, 2],
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
var miGrafico = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options
});

// Función para actualizar el gráfico según la opción seleccionada
function actualizarGrafico() {
    var seleccionMes = document.getElementById('seleccionMes');
    var mesSeleccionado = seleccionMes.value;

    // Define los datos para cada mes (puedes personalizarlos)
    var datosPorMes = {
        enero: [12, 19, 3, 5, 2],
        febrero: [8, 15, 6, 9, 4],
        marzo: [10, 18, 4, 6, 3],
        abril: [15, 22, 8, 12, 5],
        mayo: [14, 20, 7, 11, 6]
    };

    // Actualiza los datos del gráfico según el mes seleccionado
    miGrafico.data.datasets[0].data = datosPorMes[mesSeleccionado];
    miGrafico.update();
}