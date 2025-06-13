import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.visitorDAO;
import user.Visitor;

public class VisitorRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("Name");
        String ic = request.getParameter("IC");
        String address = request.getParameter("Address");
        String purpose = request.getParameter("Purpose");

        // Retrieve the logged-in user's ID from the session
        HttpSession session = request.getSession();
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");

        if (loggedInUserId != null) {
            Visitor visitor = new Visitor(name, ic, address, purpose);
            visitorDAO visitorDao = new visitorDAO();

            try {
                // Insert the visitor with the logged-in user's ID
                visitorDao.insertVisitor(visitor, loggedInUserId);
                response.sendRedirect("notification/VisitorSucecss.jsp"); // Corrected filename
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error registering visitor: " + e.getMessage()); // Set error message
                response.sendRedirect("notification/visitorError.jsp");   // Corrected path
            }
        } else {
            // Handle the case where the user ID is not in the session (not logged in?)
            request.setAttribute("errorMessage", "User not logged in."); // Set error message
            response.sendRedirect("notification/visitorError.jsp");     // Corrected path
        }
    }
}