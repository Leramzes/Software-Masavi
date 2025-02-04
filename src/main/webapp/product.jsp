<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="development.team.software_masavi.Model.Product" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Masavi</title>
    <!--Enlace de Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!--Enlace de CSS Global-->
    <link rel="stylesheet" href="css/global.css">
    <!--Enlace de CSS Específico-->
    <link rel="stylesheet" href="css/product.css">
    <!--Enlace de CSS Fondo-->
    <link rel="stylesheet" href="css/background.css">
    <!-- FontAwesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Animate.css CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
</head>

<body>

<%@ include file="header.jsp" %>
<%
    List<Product> listProducts = (List<Product>) request.getAttribute("products");
    //List<String> listCategories = (List<String>) request.getAttribute("categoryProducts");
    List<Product> listProductsFeatured = (List<Product>) request.getAttribute("productsFeatured");

%>
<main class="bg-main">
    <!-- Preloader -->
    <div id="preloader" class="preloader">
        <div class="spinner"></div>
    </div>

    <!-- Contenido de la sección de productos destacados -->
    <div class="container py-4">
        <!-- Encabezado -->
        <div class="row mb-3 text-center text-primary-emphasis">
            <h2 class="title animate-on-scroll" data-animation="animate__zoomIn">
                Productos Destacados
            </h2>
        </div>

        <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
            <!-- Indicators -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#productCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>

            <!-- Carousel items -->
            <div class="carousel-inner">
                <!-- Slide 1 -->
                <%
                    boolean isFirst = true;
                    for(Product product : listProductsFeatured){
                %>
                    <div class="carousel-item <%= isFirst ? "active" : "" %>">
                        <div class="row align-items-center justify-content-center">
                            <!-- Columna izquierda -->
                            <div class="col-auto">
                                <img src="<%= product.getImage() %>" class="img-fluid rounded-3" alt="Imagen del producto">
                            </div>
                            <!-- Columna derecha -->
                            <div class="col-auto text-center mx-5 carousel">
                                <h3><%= product.getName() %></h3>
                                <h4>Precio Actual: S/<%= product.getPrice() %></h4>
                                <p><%= product.getDescription() %></p>

                                <form action="cart" method="post">
                                    <input type="hidden" name="productId" value="<%=product.getId()%>">
                                    <input type="hidden" name="quantity" value="1">
                                    <input type="hidden" name="action" value="add">
                                    <button type="submit" class="btn btn-success w-100 add-to-cart"<%=product.getQuantityInStock()==0?"disabled":""%> >
                                        Agregar al Carrito <i class="fa-solid fa-cart-shopping"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                <% isFirst = false;}%>

            </div>

            <!-- Controles -->
            <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
                    <span aria-hidden="true">
                        <i class="fas fa-chevron-left" style="color: black; font-size: 1.5rem;"></i>
                    </span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
                    <span aria-hidden="true">
                        <i class="fas fa-chevron-right" style="color: black; font-size: 1.5rem;"></i>
                    </span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <!-- Contenido de la sección de productos -->
    <div class="container-fluid my-2">
        <!-- Encabezado -->
        <div class="row mb-3 text-center text-primary-emphasis">
            <h2 class="title animate-on-scroll" data-animation="animate__zoomIn">
                ¿Qué estas buscando hoy?
            </h2>
        </div>

        <div class="row">
            <!-- Sidebar de filtros -->
            <div class="col-md-3 mb-4">
                <div class="sidebar">
                    <form id="filterForm">
                        <h5><i class="fa-solid fa-filter"></i> Filtros:</h5>
                        <div class="filter-group">
                            <label>Nombre del producto:</label>
                            <input type="text" id="nameSearch" name="productName" class="form-control"
                                   placeholder="Buscar producto...">
                        </div>
                        <button type="button" onclick="buscar()" class="btn btn-success w-100">Aplicar Filtros</button>
                    </form>
                </div>
            </div>

            <!-- Zona principal de productos -->
            <div class="col-md-9 mb-4">
                <div id="cardsProduct" class="row row-cols-1 row-cols-md-3 gy-2">
                    <!-- Aquí se cargarán los productos filtrados -->
                    <%for (Product product : listProducts) { %>
                    <div class="col mb-3">
                        <div class="product-card d-flex flex-column justify-content-between align-items-center">
                            <img src="<%= product.getImage() %>" alt="<%= product.getName() %>">
                            <h3 class="product-title"><%= product.getName() %></h3>
                            <p class="product-price">Precio: S/<%= product.getPrice() %></p>
                            <%if(product.getQuantityInStock()<10 && product.getQuantityInStock()>0){%>
                            <h5 style="color: #dc3545">¡Quedan Pocas Unidades!</h5>
                            <%}else if(product.getQuantityInStock()==0){%>
                            <h5 style="color: #dc3545">¡PRODUCTO AGOTADO!</h5>
                            <%}%>
                            <form action="cart" method="post">
                                <input type="hidden" name="productId" value="<%=product.getId()%>">
                                <input type="hidden" name="quantity" value="1">
                                <input type="hidden" name="action" value="add">
                                <button type="submit" class="btn btn-success w-100 add-to-cart"<%=product.getQuantityInStock()==0?"disabled":""%> >
                                    Agregar al Carrito <i class="fa-solid fa-cart-shopping"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <%  } %>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="footer.jsp" %>

<!--Enlace de Bootstrap JavaScript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

<!--Enlace de JavaScript - Validación-->
<script src="js/product.js"></script>

<!--Enlace de jQuery-->
<script src="js/jquery-3.7.1.js"></script>

<!--Enlace de Preloader-->
<script src="js/preloader.js"></script>

<!--Enlace de JavaScript - SweetAlert2-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    // Tarjeta - Carousel - Agregar al carrito
    document.querySelectorAll('.add-to-cart').forEach(button => {
        button.addEventListener('click', function(event) {
            event.preventDefault(); // Previene el envío del formulario

            const form = event.target.closest('form'); // Encuentra el formulario correspondiente al botón

            // Mostrar la alerta
            Swal.fire({
                icon: 'success',
                title: 'Producto Agregado',
                text: 'El producto ha sido agregado al carrito.',
                confirmButtonText: 'Aceptar',
                showConfirmButton: false,  // Desactiva el botón de confirmación
                timer: 1500,  // Tiempo en milisegundos
                timerProgressBar: true,  // Muestra barra de progreso
            }).then(() => {
                // Enviar el formulario manualmente después de que la alerta desaparezca
                form.submit();
            });
        });
    });
</script>


</body>