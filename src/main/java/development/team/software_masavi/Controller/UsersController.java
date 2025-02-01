package development.team.software_masavi.Controller;

import development.team.software_masavi.Business.CustomerGestion;
import development.team.software_masavi.Business.UsersGestion;
import development.team.software_masavi.Model.Client;
import development.team.software_masavi.Model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "user", urlPatterns = {"/user"})
public class UsersController extends HttpServlet {

    UsersGestion userdao = new UsersGestion();
    Usuario user = new Usuario();

    CustomerGestion clientdao = new CustomerGestion();
    Client client = new Client();

    String mensaje = "";
    int IdUsuario = 0;

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
                //Para validar datos de inicio de sesión
                String email = req.getParameter("email");
                String contrasena = req.getParameter("password");
                String telefono = req.getParameter("telefono");
                String direccion = req.getParameter("direccion");
                String tipoUsuario = "cliente";

                //Para validar datos del cliente
                String nombre = req.getParameter("nombre");
                String apellido = req.getParameter("apellido");

                if (userdao.existeUsuario(email)) {
                    System.out.println("El email ya está registrado.");
                } else {
                    //AGREGAR A USUARIOS
                    user.setEmail(email);
                    user.setContrasena(contrasena);
                    user.setTelefono(telefono);
                    user.setDireccion(direccion);
                    user.setTipo_usuario(tipoUsuario);
                    IdUsuario = userdao.agregar(user); //Aquí retorna el ID del usuario que acaba de agregar

                    System.out.println(IdUsuario);

                    //AGREGAR A CLIENTES
                    client.setNombre(nombre);
                    client.setApellido(apellido);
                    client.setUsuarioId(IdUsuario);
                    clientdao.registerClient(client);
                }
                resp.sendRedirect("index.jsp");
                return;
            default:
                break;
        }
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
