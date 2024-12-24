package development.team.software_masavi.Controller;

import development.team.software_masavi.Business.UsersGestion;
import development.team.software_masavi.Model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "validar", urlPatterns = {"/validar"})
public class ValidarServlet extends HttpServlet {

    UsersGestion userdao = new UsersGestion();
    Usuario user = new Usuario();
    String mensaje = "";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        if (accion != null) {
            if (accion.equalsIgnoreCase("Ingresar")) {
                String Usuario = req.getParameter("email");
                String Password = req.getParameter("password");

                if (userdao.validarCredenciales(Usuario, Password)) {
                    user = userdao.obtenerUsuarioSesion(Usuario);
                    // Usuario válido, redirigir al controlador para procesar la acción "dashCuentinvent"
                    HttpSession session = req.getSession();
                    session.setAttribute("usuario", user);
                    // Después de nav.jsp, redirigir al controlador con la acción dashCuentinvent
                    req.getRequestDispatcher("index.jsp").forward(req, resp);
                } else {
                    // Usuario no válido, redirigir a la página de inicio de sesión
                    mensaje = "Datos Incorrectos";
                    req.setAttribute("mensaje", mensaje); // Enviar el mensaje a la página JSP
                    req.getRequestDispatcher("index.jsp").forward(req, resp); // Redirigir con mensaje
                }
            } else if (accion.equalsIgnoreCase("Salir")) {
                resp.sendRedirect(req.getContextPath() + "/Logout.jsp");
            } else {
                mensaje = "Acción no reconocida";
                req.getRequestDispatcher("index.jsp").forward(req, resp); // Redirigir con mensaje
            }
        } else {
            mensaje = "Acción inválida o nula";
            req.getRequestDispatcher("index.jsp").forward(req, resp); // Redirigir con mensaje
        }
    }
}

