// Función para actualizar el valor del rango de precio
document.getElementById('price-range').addEventListener('input', function() {
    const value = this.value;
    document.getElementById('price-value').textContent = `0 - ${value}`;
});

// Filtro de búsqueda por Nombre de producto
document.getElementById('nombre-search').addEventListener('input', function() {
    const searchText = this.value.toLowerCase();
    const items = document.querySelectorAll('.product-card');
    items.forEach(function(item) {
        const productName = item.querySelector('h2').textContent.toLowerCase();
        item.style.display = productName.includes(searchText) ? 'block' : 'none';
    });
});

// Filtro de búsqueda en Proveedor
document.getElementById('proveedor-search').addEventListener('input', function() {
    const searchText = this.value.toLowerCase();
    const items = document.querySelectorAll('#proveedor-list li');
    items.forEach(function(item) {
        const text = item.textContent.toLowerCase();
        item.style.display = text.includes(searchText) ? 'block' : 'none';
    });
});

// Filtro de búsqueda en Marca
document.getElementById('marca-search').addEventListener('input', function() {
    const searchText = this.value.toLowerCase();
    const items = document.querySelectorAll('#marca-list li');
    items.forEach(function(item) {
        const text = item.textContent.toLowerCase();
        item.style.display = text.includes(searchText) ? 'block' : 'none';
    });
});

//AJAX para actualizacion de productos de acuerdo a filtros
function buscar(){
    //lo que el usuario busca
    var nameFilter = $("#nameSearch").val();
    $.ajax({
        url: "filterProducServlet",
        data: {
            filter: nameFilter
        },
        success: function( result ) {
            $( "#cardsProduct" ).html(result);
        }
    });
}