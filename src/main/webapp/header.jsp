<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="development.team.software_masavi.Model.Usuario" %><%
    HttpSession ses = request.getSession();
    Usuario user = (Usuario) ses.getAttribute("usuario");

    int itemCount = 0; // Valor por defecto
    if (ses.getAttribute("itemCount") != null) {
        itemCount = (int) ses.getAttribute("itemCount");
    }
%>

<%
    // Obtener la URI actual
    String currentPage = request.getRequestURI();
    String linkToAboutUs;

    // Lógica para determinar el enlace
    if (currentPage.contains("index.jsp")) {
        linkToAboutUs = "#about_us";  // Sí estamos en index.jsp
    } else {
        linkToAboutUs = "index.jsp#about_us";  // Sí estamos en cualquier otra página
    }

    // Definir clases dinámicas para cada enlace
    String homeActive = currentPage.endsWith("index.jsp") ? "active" : "";
    String aboutActive = currentPage.contains("about_us") ? "active" : "";
    String productsActive = currentPage.contains("product") ? "active" : "";
    String contactActive = currentPage.endsWith("contact_us.jsp") ? "active" : "";
    String cartActive = currentPage.contains("cart") ? "active" : "";
%>
<head>
    <title>Masavi</title>
    <style>
        /* Estilos para el navbar */
        .navbar {
            padding: 1rem 0; /* Ajusta el padding vertical */
            background-color: #ffffff;
            box-shadow: 0 4px 8px #76ac0076;
        }

        .navbar-brand img {
            max-width: 5rem; /* Tamaño del logo */
            height: auto;
        }

        .nav-link {
            font-size: 1rem; /* Tamaño de fuente */
            padding: 0.5rem 1rem; /* Padding interno */
            transition: all 0.3s ease; /* Transición suave */
        }

        /* Estilos para el botón de carrito */
        .nav-link .fa-bag-shopping {
            font-size: 1.2rem; /* Tamaño del ícono */
        }

        /* Estilos para el botón de usuario */
        .dropdown-toggle {
            padding: 0.5rem 1rem; /* Padding interno */
            font-size: 1rem; /* Tamaño de fuente */
        }
    </style>
</head>

<header>
    <nav class="navbar navbar-expand-lg fixed-top px-lg-5 px-md-5 px-sm-5">
        <div class="container-fluid">
            <!-- Logo alineado a la izquierda -->
            <a class="navbar-brand" href="index.jsp">
                <img src="img/logo.jpg" class="rounded-circle" alt="Masavi">
            </a>

            <!-- Botón de colapso para pantallas pequeñas -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Contenido de la barra de navegación -->
            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                <!-- Menú de navegación -->
                <ul class="navbar-nav mb-2 mb-lg-0 align-items-end">
                    <li class="nav-item px-1">
                        <a class="nav-link <%= homeActive %>" id="navInicio" aria-current="page" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item px-1">
                        <a class="nav-link <%= aboutActive %>" id="navNosotros" href="<%= linkToAboutUs %>">Nosotros</a>
                    </li>
                    <form action="product" method="post">
                        <li class="nav-item px-1">
                            <button class="nav-link <%= productsActive %>" type="submit">Productos</button>
                        </li>
                    </form>
                    <li class="nav-item px-1">
                        <a class="nav-link <%= contactActive %>" href="contact_us.jsp">Contáctanos</a>
                    </li>
                    <li class="nav-item px-1">
                        <form action="cart" method="get" class="position-relative">
                            <button class="nav-link <%= cartActive %>" type="submit">
                                <i class="fa-solid fa-bag-shopping me-1"></i>
                                Carrito
                            </button>
                            <% if (itemCount > 0) { %>
                                <!-- Cantidad de Productos -->
                                <span class="badge rounded-circle position-absolute top-0 start-100"
                                      style="background-color: red; color: white; font-size: 0.75rem;
                                        width: 1.5rem; height: 1.5rem; display: flex; justify-content: center;
                                        align-items: center; border: 2px solid white; transform: translate(-50%, -25%);">
                                    <%= itemCount %>
                                </span>
                            <% } %>
                        </form>
                    </li>
                </ul>

                <%
                    if(user!=null){
                        String nameUser = user.getEmail().split("@")[0];
                %>
                    <!-- Información del usuario -->
                    <div class="dropdown-center mx-2">
                        <button class="btn dropdown-toggle rounded-pill border" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user me-1"></i>
                            <span><%=nameUser%></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="logout.jsp">Cerrar Sesión</a></li>
                        </ul>
                    </div>
                <%}else{%>
                    <!-- Botón de iniciar sesión alineado a la derecha -->
                    <div class="d-flex justify-content-end ms-3">
                        <a href="login.jsp" class="btn rounded-pill border">Iniciar Sesión</a>
                    </div>
                <%}%>
            </div>
        </div>
    </nav>
</header>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Seleccionar elementos del navbar
        let navInicio = document.getElementById("navInicio");
        let navNosotros = document.getElementById("navNosotros");

        // Seleccionar la sección de "Nosotros"
        let aboutUsSection = document.getElementById("about_us");

        // Crear Intersection Observer para detectar cuando "Nosotros" es visible
        let observer = new IntersectionObserver(entries => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    // Si "Nosotros" es visible, activar su enlace (Invertí)
                    navNosotros.classList.remove("active");
                    navInicio.classList.add("active");
                } else {
                    // Si no es visible, volver a activar "Inicio" (Invertí)
                    navNosotros.classList.add("active");
                    navInicio.classList.remove("active");
                }
            });
        }, { threshold: 0.5 }); // 50% visible para activar

        observer.observe(aboutUsSection);
    });
</script>