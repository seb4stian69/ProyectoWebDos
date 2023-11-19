export function crearInput(id, type, placeholder) {
    
    var input = document.createElement("input");
    
    input.setAttribute("id", id);
    input.setAttribute("type", type);
    input.setAttribute("placeholder", placeholder);
    
    document.getElementById("inputs").appendChild(input)
    
}