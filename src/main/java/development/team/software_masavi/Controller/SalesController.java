package development.team.software_masavi.Controller;

import development.team.software_masavi.Business.CatalogoProducts;
import development.team.software_masavi.Business.CustomerGestion;
import development.team.software_masavi.Business.ShoppingGestion;
import development.team.software_masavi.Functions;
import development.team.software_masavi.Model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "salesController", urlPatterns = {"/salesController"})
public class SalesController extends HttpServlet {
    CatalogoProducts productdao = new CatalogoProducts();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Variables recuperadas en session
        HttpSession session = req.getSession();
        Usuario usuarioSession = (Usuario) session.getAttribute("usuario");
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItemsInSession");
        double MontoPago = (double) session.getAttribute("totalPago");

        //Variables recuperadas del formulario
        String paymentMethod = req.getParameter("metodoPago");
        String fechaCompraStr = req.getParameter("fechaCompra");
        String fechaComprobante = Functions.formatFechaComprobante(fechaCompraStr);
        Date fechaSQL = Functions.fechaFormateada(fechaCompraStr);

        // Objetos para inserciones
        ShoppingGestion shoppingGestion = new ShoppingGestion();
        Customer idCustomer = CustomerGestion.getClient(usuarioSession);

        //Registramos el pedido
        Order order = new Order(idCustomer, fechaSQL, "enviado", MontoPago, usuarioSession.getDireccion());
        int idOrderRegister = shoppingGestion.registerOrder(order);

        //Registramos el pago
        Pay pay = new Pay(idOrderRegister, fechaSQL, MontoPago, paymentMethod, "Completado");
        int idPayRegister = shoppingGestion.registerPay(pay);

        //Registramos el comprobante
        String numeroComporbante = String.format("00%d-%d%s", idOrderRegister, idPayRegister, fechaComprobante);
        Voucher voucher = new Voucher(idPayRegister, "recibo", numeroComporbante, fechaSQL, MontoPago);
        int idVoucherRegister = shoppingGestion.registerVoucher(voucher);

        //Registramos el/los detalle del pedido
        for (CartItem cartItem : cartItems) {
            shoppingGestion.registerDetailOrder(idOrderRegister, cartItem.getProduct(), cartItem.getQuantity());
            //Reducir la cantidad del producto cuando se hace una compra
            int idproducto = cartItem.getProduct().getId();
            int cantidad = cartItem.getQuantity();
            int stockAct = cartItem.getProduct().getQuantityInStock() - cantidad;
            productdao.actualizarStock(idproducto, stockAct);
        }
        // Restablecer lista y atributos
        cartItems.clear();
        // Eliminar los atributos relacionados con el carrito
        session.removeAttribute("cart");
        session.removeAttribute("cartItemsInSession");
        session.removeAttribute("quantityTotal");
        session.removeAttribute("subTotal");
        session.removeAttribute("totalPago");
        session.removeAttribute("itemCount");

        // Redireccionar al JSP para mostrar el carrito actualizado
        resp.sendRedirect(req.getContextPath() + "/product");
    }
}
