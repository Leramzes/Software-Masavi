package development.team.software_masavi.Test;

import development.team.software_masavi.Services.DataBaseUtil;
import java.sql.Connection;
import java.sql.SQLException;

public class DataBaseUtilTest {
    public static void main(String[] args) {
        System.out.println("Probando conexión a la base de datos...");
        try (Connection connection = DataBaseUtil.getDataSource().getConnection()) {
            if (connection != null && !connection.isClosed()) {
                System.out.println("¡Conexión exitosa a la base de datos!");
            } else {
                System.out.println("Conexión fallida: El objeto Connection no está operativo.");
            }
        } catch (SQLException e) {
            System.err.println("Error al intentar conectarse a la base de datos:");
            e.printStackTrace();
        }
    }
}
