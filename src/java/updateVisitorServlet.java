import dao.visitorDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import user.Visitor;

public class updateVisitorServlet extends HttpServlet {
    private visitorDAO visitorDAO;

    @Override
    public void init() {
        visitorDAO = new visitorDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); // Get ID from the form
        String name = request.getParameter("Name");
        String ic = request.getParameter("IC");
        String address = request.getParameter("Address");
        String purpose = request.getParameter("Purpose");

        Visitor visitor = new Visitor(name, ic, address, purpose);
        visitor.setId(id); // Set the ID for updating

        try {
            visitorDAO.updateVisitor(visitor);
            response.sendRedirect(request.getContextPath() + "/visitorReport.jsp?message=Visitor+updated+successfully");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/visitorReport.jsp?error=Error+updating+visitor");
        }
    }
}