
import DB.DBConnection;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String password = request.getParameter("password");
        String roles = request.getParameter("roles");
        String name = request.getParameter("name");
        String ICnum = request.getParameter("ICnum");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");

        try (Connection con = DBConnection.getConnection()) {
            String sqlUser = "INSERT INTO user (name, address, ICnum, roles, email, contact, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement psUser = con.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS);
            psUser.setString(1, name);
            psUser.setString(2, address);
            psUser.setString(3, ICnum);
            psUser.setString(4, roles);
            psUser.setString(5, email);
            psUser.setString(6, contact);
            psUser.setString(7, password);

            psUser.executeUpdate();

            ResultSet rs = psUser.getGeneratedKeys();
            int userID = 0;
            if (rs.next()) {
                userID = rs.getInt(1);
            }

            if ("Guard".equalsIgnoreCase(roles)) {
                String sqlGuard = "INSERT INTO guard (userID) VALUES (?)";
                PreparedStatement psGuard = con.prepareStatement(sqlGuard);
                psGuard.setInt(1, userID);
                psGuard.executeUpdate();
            } else {
                String sqlAdmin = "INSERT INTO administrator (userID) VALUES (?)";
                PreparedStatement psAdmin = con.prepareStatement(sqlAdmin);
                psAdmin.setInt(1, userID);
                psAdmin.executeUpdate();
            }

            response.sendRedirect("notification/success.jsp");
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
