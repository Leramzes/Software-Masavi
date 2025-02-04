// Mostrar el contenido y ocultar el preloader después de que la página haya cargado
window.onload = function() {
    document.getElementById("preloader").style.display = "none";
    document.getElementById("main-content").style.display = "block";
};