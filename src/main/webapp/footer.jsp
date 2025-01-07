<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<footer class="text-white py-2" style="background-color: #00563c">
    <div class="container">
        <!-- Fila de redes sociales -->
        <div class="row justify-content-center">
            <div class="col-auto">
                <p>Redes Sociales:</p>
            </div>
            <div class="col-auto">
                <a href="https://facebook.com" target="_blank" class="text-white">
                    <i class="facebook fab fa-brands fa-facebook"></i> <!-- Ícono de Facebook -->
                </a>
            </div>
            <div class="col-auto">
                <a href="https://instagram.com" target="_blank" class="text-white">
                    <i class="instagram fab fa-instagram"></i> <!-- Ícono de Instagram -->
                </a>
            </div>
        </div>

        <!-- Fila de Copyright -->
        <div class="row">
            <div class="col text-center">
                <p>&copy; <%= java.time.Year.now().getValue() %> MASAVI. Todos los derechos reservados.</p>
            </div>
        </div>
    </div>
</footer>