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
            config.setJdbcUrl("jdbc:mysql://autorack.proxy.rlwy.net:47900/railway?user=root&password=YrXKYydmtViQgJustXmFmFspZPtgiUSw"); // Cambia por tu URL
            config.setDriverClassName("com.mysql.cj.jdbc.Driver");
            config.setMaximumPoolSize(10); // Número máximo de conexiones
            config.setMinimumIdle(2); // Número mínimo de conexiones inactivas
            config.setIdleTimeout(60000); // Tiempo máximo de inactividad
            config.setConnectionTimeout(30000); // Tiempo de espera para obtener una conexión
            config.setValidationTimeout(5000); // Tiempo para validar una conexión
            dataSource = new HikariDataSource(config);
        } catch (Exception e) {
            String msj= "Error al inicializar la conexión a la base de datos";
            throw new ConectionNotBDException(msj);
        }
    }

    public static DataSource getDataSource() {
        return dataSource;
    }
}
