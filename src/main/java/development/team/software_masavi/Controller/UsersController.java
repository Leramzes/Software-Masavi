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
import java.util.List;

@WebServlet(name = "user", urlPatterns = {"/user"})
public class UsersController extends HttpServlet {

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

        switch (accion) {
            case "Listar":
                List lista = userdao.getAllUsers();
                req.setAttribute("usuarios", lista);
                break;
            case "Registrar":
                String email = req.getParameter("email");
                String contrasena = req.getParameter("password");
                String telefono = req.getParameter("telefono");
                String direccion = req.getParameter("direccion");
                String tipoUsuario = "cliente";

                user.setEmail(email);
                user.setContrasena(contrasena);
                user.setTelefono(telefono);
                user.setDireccion(direccion);
                user.setTipo_usuario(tipoUsuario);
                userdao.agregar(user);
                resp.sendRedirect("index.jsp");
                return;
            default:
                break;
        }
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
