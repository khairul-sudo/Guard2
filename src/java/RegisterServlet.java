
import DB.DBConnection;
import user.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String ICnum =request.getParameter("ICnum");
            String roles = request.getParameter("roles");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String password = request.getParameter("password");

            User user = new User(name, address, ICnum, roles, contact, email, password);

            try (Connection conn = DBConnection.getConnection()) {
                String sql = "INSERT INTO user (name, address, ICnum, roles, email, contact, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getAddress());
                stmt.setString(3, user.getICnum());
                stmt.setString(4, user.getRoles());
                stmt.setString(6, user.getEmail());
                stmt.setString(5, user.getContact());
                stmt.setString(7, user.getPassword());
                
                stmt.executeUpdate();
            }

            response.sendRedirect("notification/success.jsp");

        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("notification/success.jsp").forward(request, response);
        }
    }
}
