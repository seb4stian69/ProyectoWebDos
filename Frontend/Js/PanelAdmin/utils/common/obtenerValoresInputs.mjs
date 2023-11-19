export function obtenerValores() {

    var divInputs = document.getElementById("inputs");
    var object = {};

    var inputs = divInputs.getElementsByTagName("input");

    for (var i = 0; i < inputs.length; i++) {
        var key = inputs[i].id;
        var value = inputs[i].value;
        object[key] = value;
    }

    return object;

}