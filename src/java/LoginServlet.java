import DB.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT userID, roles FROM user WHERE name = ? AND password = ?"; // Select userID as well
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String role = rs.getString("roles");
                String userID = rs.getString("userID"); // Retrieve the userID

                HttpSession session = request.getSession();
                session.setAttribute("loggedInUsername", username); // It's good practice to use a more specific attribute name
                session.setAttribute("loggedInRole", role);       // Use a more specific attribute name
                session.setAttribute("loggedInUserId", userID);   // Store the userID in the session

                response.sendRedirect("homepage.jsp");
            } else {
                response.sendRedirect("notification/LoginError.jsp");
            }

            con.close();

        } catch (Exception e) {
            response.getWriter().println("Login Error: " + e.getMessage());
        }
    }
}