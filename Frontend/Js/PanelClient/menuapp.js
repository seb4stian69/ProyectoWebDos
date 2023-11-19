// Variable para llevar un registro de la estación actual
let estacionActual = "invierno"; // Puedes establecer la estación inicial

(function() {
    
    const apiUrl = "http://localhost/php-html/ProyectoFinal/Backend/Api/ObtenerQtyProductoCarrito.php";

    const requestData = {
        id: sessionStorage.getItem("UserID")
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
        
        document.getElementById("numberCartProduct").innerHTML = data[0].total_registros

    })
    .catch(error => {
        console.error('Error en la solicitud:', error);
    });

})();

const flechaIzq = () => {
    // Cambia a la estación anterior
    if (estacionActual === "invierno") {
        autumnStationChangeValues();
    } else if (estacionActual === "primavera") {
        winterStationChangeValues();
    } else if (estacionActual === "otoño") {
        summerStationChangeValues();
    } else if (estacionActual === "verano") {
        springStationChangeValues();
    }
}

const flechaDer = () => {
    // Cambia a la siguiente estación
    if (estacionActual === "invierno") {
        estacionActual = "primavera";
        springStationChangeValues();
    } else if (estacionActual === "primavera") {
        estacionActual = "verano";
        summerStationChangeValues();
    } else if (estacionActual === "verano") {
        estacionActual = "otoño";
        autumnStationChangeValues();
    } else if (estacionActual === "otoño") {
        estacionActual = "invierno";
        winterStationChangeValues();
    }
}

/* STATION VALUES CHANGES */

const summerStationChangeValues = () =>{

    estacionActual = "verano";

    document.body.style = "background: url(../../Resources/PanelClient/SummerLeftBar.png) no-repeat;"

    document.getElementById("yearCollection").style = "background: linear-gradient(271.86deg, #F5FE23 1.6%, #64C7FB 87.72%);"
    document.getElementById("photoCircle").style = "background: linear-gradient(129.25deg, #B1E3FF 15.02%, #FAFFA3 83.44%);"
    document.getElementById("carDiv").style = "background: url(../../Resources/PanelClient/iconCart.png) center center no-repeat, linear-gradient(133.42deg, #64C7FC 2.62%, #F5FE24 100%);"
    document.getElementById("carDivElipse").style = "background: #50D5FF;"
    document.getElementById("message").style = "color: #2287C0;"
    document.getElementById("otherMessage").style = "color: #788995;"
    document.getElementById("otherMessage").innerText = "Clothing that will keep you cool all summer long."
    document.getElementById("womanStation").src = "../../Resources/PanelClient/summeWoman.png"
    document.getElementById("womanStation").style = "width: 800px; height: 899px; left: 940px;"

    document.getElementById("station").innerText = "SUMMER"
    document.getElementById("station").style = "left:970px"

    let bgHoverBtn = "linear-gradient(142.47deg, #61C6FF 16.3%, #FAFF1B 86.81%)";

    let flechaIzqBtn = document.getElementById("flechaIzq");
    let flechaDerBtn = document.getElementById("flechaDer");

    flechaIzqBtn.addEventListener("mouseover", function() {
        flechaIzqBtn.style = "cursor: pointer; background: url(../../Resources/PanelClient/FlechaB.png) center center no-repeat, "+bgHoverBtn+" !important; background-size: contain; border: 1px solid #ffffff;"
    });

    flechaIzqBtn.addEventListener("mouseout", function() {
        flechaIzqBtn.style = "background: url(../../Resources/PanelClient/FlechaN.png); background-repeat: no-repeat; background-position: center;"
    });

    flechaDerBtn.addEventListener("mouseover", function() {
        flechaDerBtn.style = "cursor: pointer; background: url(../../Resources/PanelClient/FlechaB.png) center center no-repeat, "+bgHoverBtn+" !important; background-size: contain; border: 1px solid #ffffff;"
    });

    flechaDerBtn.addEventListener("mouseout", function() {
        flechaDerBtn.style = "left: 450px; background: url(../../Resources/PanelClient/FlechaN.png); background-repeat: no-repeat; background-position: center; transform: rotate(180deg); "
    });

}

const springStationChangeValues = () =>{

    estacionActual = "primavera";

    document.body.style = "background: url(../../Resources/PanelClient/SpringLeftBar.png) no-repeat;"

    document.getElementById("yearCollection").style = "background: linear-gradient(271.86deg, #8DDE31 1.6%, #F9FD1A 87.72%);"
    document.getElementById("photoCircle").style = "background: linear-gradient(129.25deg, #FEFF95 15.02%, #B7E876 83.44%);"
    document.getElementById("carDiv").style = "background: url(../../Resources/PanelClient/iconCart.png) center center no-repeat, linear-gradient(133.42deg, #F9FE1A 2.62%, #92E031 100%);"
    document.getElementById("carDivElipse").style = "background: #FEC600;"
    document.getElementById("message").style = "color: #00A778;"
    document.getElementById("otherMessage").style = "color: #809578;"
    document.getElementById("otherMessage").innerText = "Clothes that will surely liven up your spring."
    document.getElementById("womanStation").src = "../../Resources/PanelClient/springWoman.png"
    document.getElementById("womanStation").style = "width: 1000px; height: 899px; left: 900px;"

    document.getElementById("station").innerText = "SPRING"
    document.getElementById("station").style = "left:1035px"

    let bgHoverBtn = "linear-gradient(142.47deg, #FFFF57 16.3%, #7FDA2C 86.81%)";

    let flechaIzqBtn = document.getElementById("flechaIzq");
    let flechaDerBtn = document.getElementById("flechaDer");

    flechaIzqBtn.addEventListener("mouseover", function() {
        flechaIzqBtn.style = "cursor: pointer; background: url(../../Resources/PanelClient/FlechaB.png) center center no-repeat, "+bgHoverBtn+" !important; background-size: contain; border: 1px solid #ffffff;"
    });

    flechaIzqBtn.addEventListener("mouseout", function() {
        flechaIzqBtn.style = "background: url(../../Resources/PanelClient/FlechaN.png); background-repeat: no-repeat; background-position: center;"
    });

    flechaDerBtn.addEventListener("mouseover", function() {
        flechaDerBtn.style = "cursor: pointer; background: url(../../Resources/PanelClient/FlechaB.png) center center no-repeat, "+bgHoverBtn+" !important; background-size: contain; border: 1px solid #ffffff;"
    });

    flechaDerBtn.addEventListener("mouseout", function() {
        flechaDerBtn.style = "left: 450px; background: url(../../Resources/PanelClient/FlechaN.png); background-repeat: no-repeat; background-position: center; transform: rotate(180deg); "
    });

}

const autumnStationChangeValues = () =>{

    estacionActual = "otoño";

    document.body.style = "background: url(../../Resources/PanelClient/AutumnLeftBar.png) no-repeat;"

    document.getElementById("yearCollection").style = "background: linear-gradient(271.86deg, #E99004 1.6%, #FFD338 87.72%);"
    document.getElementById("photoCircle").style = "background: linear-gradient(129.25deg, #FFEBA3 15.02%, #F5BE67 83.44%);"
    document.getElementById("carDiv").style = "background: url(../../Resources/PanelClient/iconCart.png) center center no-repeat, linear-gradient(133.42deg, #FFD237 2.62%, #EA9104 100%);"
    document.getElementById("carDivElipse").style = "background: #FFDD64;"
    document.getElementById("message").style = "color: #4F411E;"
    document.getElementById("otherMessage").style = "color: #959078;"
    document.getElementById("otherMessage").innerText = "Clothes that will make your fall cozier."
    document.getElementById("womanStation").src = "../../Resources/PanelClient/womanAutumn.png"
    document.getElementById("womanStation").style = "width: 599px; height: 899px;"
    
    document.getElementById("station").innerText = "AUTUMN"
    document.getElementById("station").style = "left:970px"

    let bgHoverBtn = "linear-gradient(142.47deg, #FFD337 16.3%, #E88B00 86.81%)";

    let flechaIzqBtn = document.getElementById("flechaIzq");
    let flechaDerBtn = document.getElementById("flechaDer");

    flechaIzqBtn.addEventListener("mouseover", function() {
        flechaIzqBtn.style = "cursor: pointer; background: url(../../Resources/PanelClient/FlechaB.png) center center no-repeat, "+bgHoverBtn+" !important; background-size: contain; border: 1px solid #ffffff;"
    });

    flechaIzqBtn.addEventListener("mouseout", function() {
        flechaIzqBtn.style = "background: url(../../Resources/PanelClient/FlechaN.png); background-repeat: no-repeat; background-position: center;"
    });

    flechaDerBtn.addEventListener("mouseover", function() {
        flechaDerBtn.style = "cursor: pointer; background: url(../../Resources/PanelClient/FlechaB.png) center center no-repeat, "+bgHoverBtn+" !important; background-size: contain; border: 1px solid #ffffff;"
    });

    flechaDerBtn.addEventListener("mouseout", function() {
        flechaDerBtn.style = "left: 450px; background: url(../../Resources/PanelClient/FlechaN.png); background-repeat: no-repeat; background-position: center; transform: rotate(180deg); "
    });

}

const winterStationChangeValues = () =>{

    estacionActual = "invierno";

    document.body.style = "background: url(../../Resources/PanelClient/WinterLeftBar.png) no-repeat;"

    document.getElementById("yearCollection").style = "background: linear-gradient(271.86deg, #E16E98 1.6%, #86B5D1 87.72%);"
    document.getElementById("photoCircle").style = "background: linear-gradient(129.25deg, #CFE1EB 15.02%, #ECD7DE 83.44%);"
    document.getElementById("carDiv").style = "background:  url(../../Resources/PanelClient/iconCart.png) center center no-repeat, linear-gradient(133.42deg, #94B5CC 2.62%, #DC80A5 100%);"
    document.getElementById("carDivElipse").style = "background: #FE006A;"
    document.getElementById("message").style = "color: #1E2C4F;"
    document.getElementById("otherMessage").style = "color: #788095;"
    document.getElementById("otherMessage").innerText = "Clothes that are sure to heat up your winter"
    document.getElementById("womanStation").src = "../../Resources/PanelClient/womanWinter.png"
    document.getElementById("womanStation").style = "width: 599px; height: 899px;"

    document.getElementById("station").innerText = "WINTER"
    document.getElementById("station").style = "left:1036px"

    let bgHoverBtn = "linear-gradient(142.47deg, #89B5CE 16.3%, #D49BAC 86.81%)";

    let flechaIzqBtn = document.getElementById("flechaIzq");
    let flechaDerBtn = document.getElementById("flechaDer");

    flechaIzqBtn.addEventListener("mouseover", function() {
        flechaIzqBtn.style = "cursor: pointer; background: url(../../Resources/PanelClient/FlechaB.png) center center no-repeat, "+bgHoverBtn+" !important; background-size: contain; border: 1px solid #ffffff;"
    });

    flechaIzqBtn.addEventListener("mouseout", function() {
        flechaIzqBtn.style = "background: url(../../Resources/PanelClient/FlechaN.png); background-repeat: no-repeat; background-position: center;"
    });

    flechaDerBtn.addEventListener("mouseover", function() {
        flechaDerBtn.style = "cursor: pointer; background: url(../../Resources/PanelClient/FlechaB.png) center center no-repeat, "+bgHoverBtn+" !important; background-size: contain; border: 1px solid #ffffff;"
    });

    flechaDerBtn.addEventListener("mouseout", function() {
        flechaDerBtn.style = "left: 450px; background: url(../../Resources/PanelClient/FlechaN.png); background-repeat: no-repeat; background-position: center; transform: rotate(180deg); "
    });

}