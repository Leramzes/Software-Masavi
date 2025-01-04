package development.team.software_masavi.Controller;

import development.team.software_masavi.Business.ContactUsGestion;
import development.team.software_masavi.Functions;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet (name = "correo", urlPatterns = {"/correo"})
public class CorreoController extends HttpServlet {
    Functions functions = new Functions();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name"); //si esta vacio
        String correo = req.getParameter("correo");//gmail,hotmail,utp | esta vacio
        String celphone = req.getParameter("celphone");//cumpla con 9 digitos Perú | solo numeros | esta vacio
        String message = req.getParameter("message");//esta vacio

        String response = functions.isProceedMail(name, correo, celphone, message);
        if (response.equals("SUCCESS")) {
            try {
                ContactUsGestion.registerContact(name,correo,celphone,message);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        req.setAttribute("response", response);
        req.getRequestDispatcher("contact_us.jsp").forward(req, resp);

    }

}
