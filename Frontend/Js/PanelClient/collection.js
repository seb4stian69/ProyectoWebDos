// Obtén una referencia a los elementos plusProduct y lessProduct
const chulito = document.querySelectorAll('.bottom-left');
const plusButtons = document.querySelectorAll('.circle.bottom-right-one');
const lessButtons = document.querySelectorAll('.circle.bottom-right-two');
const numberProducts = document.querySelectorAll('.numberProduct');

let defaultNumber = 2

chulito.forEach((button, index)=>{
    button.addEventListener('click', e=>{
        defaultNumber++
        document.querySelector('#numberProduct').innerHTML = defaultNumber;
    })
})

// Agrega eventos de clic a los botones de incrementar
plusButtons.forEach((button, index) => {
    button.addEventListener('click', () => {
        // Obtén el valor actual y conviértelo a un número
        let currentValue = parseInt(numberProducts[index].textContent);
        
        // Incrementa el valor en 1
        currentValue++;
        
        // Actualiza el contenido de <p class="numberProduct">
        numberProducts[index].textContent = currentValue;
    });
});

// Agrega eventos de clic a los botones de decrementar
lessButtons.forEach((button, index) => {
    button.addEventListener('click', () => {
        // Obtén el valor actual y conviértelo a un número
        let currentValue = parseInt(numberProducts[index].textContent);
        
        // Verifica si el valor es mayor que 0 antes de restarlo
        if (currentValue > 0) {
            currentValue--;
            
            // Actualiza el contenido de <p class="numberProduct">
            numberProducts[index].textContent = currentValue;
        }
    });
});
