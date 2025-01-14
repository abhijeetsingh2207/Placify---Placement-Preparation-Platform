import java.sql.*;

public class VerificationDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/placify";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "password";

    public void addPendingVerification(int userId) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO organization_verification (user_id, status) VALUES (?, 'pending')";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
