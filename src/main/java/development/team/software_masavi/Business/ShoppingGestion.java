package development.team.software_masavi.Business;

import development.team.software_masavi.Model.Order;
import development.team.software_masavi.Model.Pay;
import development.team.software_masavi.Model.Product;
import development.team.software_masavi.Model.Voucher;
import development.team.software_masavi.Services.DataBaseUtil;

import javax.sql.DataSource;
import java.sql.*;

public class ShoppingGestion {
    private static DataSource dataSource = DataBaseUtil.getDataSource();

    public int registerOrder(Order order) {
        String sql = "INSERT INTO Pedidos (cliente_id, fecha_pedido, estado, monto_total, " +
                "direccion_envio) VALUES (?, ?, ?, ?,?)";
        int orderId = -1;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement pstmt = cnn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1,order.getCustomerId().getId());
            pstmt.setDate(2,order.getDateOrder());
            pstmt.setString(3, order.getState());
            pstmt.setDouble(4, order.getTotalAmount());
            pstmt.setString(5, order.getAddress());

            int filasInsertadas = pstmt.executeUpdate();
            if (filasInsertadas > 0) {
                // Obtener las claves generadas (pedido_id)
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        orderId = rs.getInt(1); // Recuperar el ID generado
                        System.out.println("✅ Pedido insertado correctamente. ID: " + orderId);
                    }
                }
            }

        } catch (SQLException e) {
            System.err.println("❌ Error al insertar pedido: " + e.getMessage());
        }
        return orderId;
    }

    public int registerPay(Pay pay) {
        String sql = "INSERT INTO Pagos (pedido_id, fecha_pago, monto_pago, metodo_pago, " +
                "estado_pago) VALUES (?, ?, ?, ?,?)";
        int payId = -1;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement pstmt = cnn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1,pay.getOrder());
            pstmt.setDate(2,pay.getPayDate());
            pstmt.setDouble(3, pay.getTotalAmount());
            pstmt.setString(4, pay.getPayMethod());
            pstmt.setString(5, pay.getPayStatus());

            int filasInsertadas = pstmt.executeUpdate();
            if (filasInsertadas > 0) {
                // Obtener las claves generadas (pedido_id)
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        payId = rs.getInt(1); // Recuperar el ID generado
                        System.out.println("✅ Pago insertado correctamente. ID: " + payId);
                    }
                }
            }

        } catch (SQLException e) {
            System.err.println("❌ Error al insertar el pago: " + e.getMessage());
        }
        return payId;
    }
    public int registerVoucher(Voucher voucher) {
        String sql = "INSERT INTO Comprobantes (pago_id, tipo_comprobante, numero_comprobante, fecha_comprobante, " +
                "monto_comprobante) VALUES (?, ?, ?, ?,?)";
        int voucherId = -1;

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement pstmt = cnn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1,voucher.getPayId());
            pstmt.setString(2,voucher.getType());
            pstmt.setString(3, voucher.getNumberVoucher());
            pstmt.setDate(4, voucher.getDateVouched());
            pstmt.setDouble(5, voucher.getAmountVouched());

            int filasInsertadas = pstmt.executeUpdate();
            if (filasInsertadas > 0) {
                // Obtener las claves generadas (pedido_id)
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        voucherId = rs.getInt(1); // Recuperar el ID generado
                        System.out.println("✅ Voucher insertado correctamente. ID: " + voucherId);
                    }
                }
            }

        } catch (SQLException e) {
            System.err.println("❌ Error al insertar el voucher: " + e.getMessage());
        }
        return voucherId;
    }
    public void registerDetailOrder(int orderId, Product product, int cantProduct) {
        String sql = "INSERT INTO Detalle_Pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES (?, ?, ?, ?)";

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement pstmt = cnn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setInt(1, orderId);  // ID del pedido
            pstmt.setInt(2, product.getId()); // ID del producto
            pstmt.setInt(3, cantProduct);  // Cantidad del producto
            pstmt.setDouble(4, product.getPrice()); // Precio unitario del producto

            int filasInsertadas = pstmt.executeUpdate();
            if (filasInsertadas > 0) {
                System.out.println("✅ Detalle del pedido insertado correctamente.");
            }

        } catch (SQLException e) {
            System.err.println("❌ Error al insertar detalle de pedido: " + e.getMessage());
        }
    }
}
