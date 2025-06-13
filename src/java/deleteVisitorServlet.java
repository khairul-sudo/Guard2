import dao.visitorDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

public class deleteVisitorServlet extends HttpServlet {
    private visitorDAO visitorDAO;

    @Override
    public void init() {
        visitorDAO = new visitorDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            visitorDAO.deleteVisitor(id);
            // Redirect back to the visitor report page with a success message
            response.sendRedirect(request.getContextPath() + "/visitorReport.jsp?message=Visitor+deleted+successfully");
        } catch (SQLException e) {
            // Handle the error appropriately, log it, and redirect with an error message
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/visitorReport.jsp?error=Error+deleting+visitor");
        }
    }

}