package development.team.software_masavi.Business;

import development.team.software_masavi.Model.Client;
import development.team.software_masavi.Services.DataBaseUtil;

import javax.sql.DataSource;
import java.sql.*;

public class ClientGestion {
    private static final DataSource dataSource = DataBaseUtil.getDataSource();

    public static void registerClient(Client client) {
        String sql = "INSERT INTO Clientes (nombre, apellido, usuario_id) VALUES (?, ?, ?)";

        try (Connection cnn = dataSource.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {

            ps.setString(1, client.getNombre());
            ps.setString(2, client.getApellido());
            ps.setInt(3, client.getUsuarioId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Cliente registrado");
            }
        } catch (SQLException e) {
            System.err.println("Error al registrar el cliente: " + e.getMessage());
        }
    }
}

