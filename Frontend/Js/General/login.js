

const validar = () => {

    let inputCE = document.getElementById("inputCE").value;
    let inputCP = document.getElementById("inputCP").value;
    
    if(inputCE !== '' && inputCP !== ''){

        if(inputCE == 'admin' && inputCP == 'admin'){
            location.href = "../PanelAdmin/admin.html"
        }else if(inputCE == 'manager' && inputCP == 'manager'){
            location.href = "../PanelManager/manager.html"
        }else if(inputCE == 'serviceC' && inputCP == 'serviceC'){
            location.href = "../PanelClientService/clientservice.html"
        }else{
            location.href = "../PanelClient/menu.html"
        }

    }else{
        alert("Faltan datos por llenar")
    }


}


document.getElementById("singup").addEventListener('click', e=>{
    location.href = "./register.html"
})