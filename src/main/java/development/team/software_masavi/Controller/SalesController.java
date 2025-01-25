package development.team.software_masavi.Controller;

import development.team.software_masavi.Model.Cart;
import development.team.software_masavi.Model.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "salesController", urlPatterns = {"/salesController"})
public class SalesController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        //recuperamos opcion de pago
        String optionPago = req.getParameter("optionPago");

        //de la sesion del login obtener la informacion del detalle: nombre, telñefono, direccion

        switch (optionPago) {
            case "1":
                String cardHolder = req.getParameter("cardHolder");
                String cardNumber = req.getParameter("cardNumber");

                //se añade al detalle el numero de tarjeata example: 123*******656

                break;
            case "2":
                break;
            case "3":
                break;
            default:
        }


    }
}
