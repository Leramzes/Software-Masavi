package development.team.software_masavi.Services;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Auth {
    public static Boolean isValidUser() throws SQLException {
        DataSource dataSource = DataBaseUtil.getDataSource();
        Connection conn = dataSource.getConnection();

        return !(conn==null);
    }
}
