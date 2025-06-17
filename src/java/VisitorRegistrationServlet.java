import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.visitorDAO;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import user.Visitor;

public class VisitorRegistrationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form values
        String name = request.getParameter("Name");
        String ic = request.getParameter("IC");
        String address = request.getParameter("Address");
        String purpose = request.getParameter("Purpose");

        // Check if user selected "Other" and entered a custom value
        if ("Other".equalsIgnoreCase(purpose)) {
            String customPurpose = request.getParameter("PurposeOther");
            if (customPurpose != null && !customPurpose.trim().isEmpty()) {
                purpose = customPurpose.trim();
            }
        }

        // Get current datetime
        String visitDateTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        // Get logged-in user ID from session
        HttpSession session = request.getSession();
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");

        if (loggedInUserId != null) {
            Visitor visitor = new Visitor(name, ic, address, purpose, visitDateTime);
            visitorDAO visitorDao = new visitorDAO();

            try {
                // Insert visitor with userID
                visitorDao.insertVisitor(visitor, loggedInUserId);
                response.sendRedirect("notification/VisitorSucecss.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error registering visitor: " + e.getMessage());
                response.sendRedirect("notification/visitorError.jsp");
            }
        } else {
            // If user not logged in
            request.setAttribute("errorMessage", "User not logged in.");
            response.sendRedirect("notification/visitorError.jsp");
        }
    }
}
