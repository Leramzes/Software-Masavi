package development.team.software_masavi.Services;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import development.team.software_masavi.Exceptions.ConectionNotBDException;

import javax.sql.DataSource;

public class DataBaseUtil {
    private static final HikariConfig config = new HikariConfig();
    private static final HikariDataSource dataSource;

    static {
        try {
            config.setJdbcUrl("jdbc:mysql://roundhouse.proxy.rlwy.net:44470/railway?user=root&password=zjEFIhtxerBUPdWdhiclkRnZKnnaxZad");
            config.setDriverClassName("com.mysql.cj.jdbc.Driver");

            // Tamaño del pool
            config.setMaximumPoolSize(10); // Número máximo de conexiones abiertas
            config.setMinimumIdle(2); // Conexiones inactivas mínimas

            // Tiempos configurados para conexiones remotas
            config.setIdleTimeout(120000); // 2 minutos para cerrar conexiones inactivas
            config.setConnectionTimeout(30000); // Esperar máximo 30 segundos para obtener una conexión
            config.setValidationTimeout(10000); // 10 segundos para validar una conexión
            config.setMaxLifetime(1800000); // 30 minutos antes de reciclar una conexión

            // Pruebas de conectividad
            config.setConnectionTestQuery("SELECT 1"); // Para validar conexiones inactivas

            dataSource = new HikariDataSource(config);
        } catch (Exception e) {
            throw new ConectionNotBDException("Error al inicializar la conexión a la base de datos: " + e.getMessage());
        }
    }

    public static DataSource getDataSource() {
        return dataSource;
    }
}
