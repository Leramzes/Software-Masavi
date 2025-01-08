<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="development.team.software_masavi.Model.Usuario" %><%
    HttpSession ses = request.getSession();
    Usuario user = (Usuario) ses.getAttribute("usuario");
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
%>
<header>
    <nav class="navbar navbar-expand-lg fixed-top px-lg-5 px-md-5 px-sm-5" style="background-color: #ffffff; box-shadow: 0 4px 8px #76ac0076;">
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
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= linkToAboutUs %>">Nosotros</a>
                    </li>
                    <form action="product" method="post">
                        <li class="nav-item">
                            <button class="nav-link" type="submit">Productos</button>
                        </li>
                    </form>
                    <li class="nav-item">
                        <a class="nav-link" href="contact_us.jsp">Contáctanos</a>
                    </li>
                    <li class="nav-item">
                        <form action="cart" method="get">
                            <button class="nav-link" type="submit"><i class="fa-solid fa-bag-shopping me-1"></i>Carrito</button>
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
                    <div class="d-flex justify-content-end">
                        <a href="login.jsp" class="btn rounded-pill border">Iniciar Sesión</a>
                    </div>
                <%}%>
            </div>
        </div>
    </nav>
</header>