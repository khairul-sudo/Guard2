package guard;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@WebServlet(name = "StaffServlet", urlPatterns = {"/staff"})
public class StaffServlet extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    request.getRequestDispatcher("staffForm.jsp").forward(request, response);
                    break;
                case "edit":
                    int administratorAdminID = Integer.parseInt(request.getParameter("administratorAdminID"));
                    int guardGuardID = Integer.parseInt(request.getParameter("guardGuardID"));
                    Staff existingStaff = userDao.getStaffById(administratorAdminID, guardGuardID);
                    request.setAttribute("staff", existingStaff);
                    request.getRequestDispatcher("staffForm.jsp").forward(request, response);
                    break;
                case "delete":
                    administratorAdminID = Integer.parseInt(request.getParameter("administratorAdminID"));
                    guardGuardID = Integer.parseInt(request.getParameter("guardGuardID"));
                    userDao.deleteStaff(administratorAdminID, guardGuardID);
                    response.sendRedirect("staff");
                    break;
                case "export":
                    String csv = userDao.exportStaffToCSV();
                    response.setContentType("text/csv");
                    response.setHeader("Content-Disposition", "attachment; filename=staff_list.csv");
                    response.getWriter().write(csv);
                    break;
                default:
                    listStaff(request, response);
                    break;
            }
        } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException | ServletException e) {
            throw new ServletException(e);
        }
    }

    private void listStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException, ClassNotFoundException {
        String keyword = request.getParameter("keyword");
        if (keyword == null) keyword = "";

        List<Staff> staffList = userDao.getStaffList(keyword);
        request.setAttribute("staffList", staffList);
        // Forward to staffList.jsp now
        request.getRequestDispatcher("manageStaff.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
         String action = request.getParameter("action");

        // Handle delete via POST if needed
        if ("delete".equals(action)) {
            try {
                int administratorAdminID = Integer.parseInt(request.getParameter("administratorAdminID"));
                int guardGuardID = Integer.parseInt(request.getParameter("guardGuardID"));
                userDao.deleteStaff(administratorAdminID, guardGuardID);
                response.sendRedirect("staff");
            } catch (IOException | ClassNotFoundException | NumberFormatException | SQLException e) {
                throw new ServletException(e);
            }
            return;  // Stop further processing to avoid validation
        }
        
        try {
        String adminIdStr = request.getParameter("administratorAdminID");
        String guardIdStr = request.getParameter("guardGuardID");
        String icNumberStr = request.getParameter("icNumber");
        String phoneNumberStr = request.getParameter("phoneNumber");
        
        int administratorAdminID = Integer.parseInt(adminIdStr);
        int guardGuardID = Integer.parseInt(guardIdStr);

        // Check admin existence
        if (!userDao.administratorExists(administratorAdminID)) {
            throw new ServletException("Administrator ID " + administratorAdminID + " does not exist. Please add the administrator first.");
        }
        
        if (!userDao.guardExists(guardGuardID)) {
            throw new ServletException("Guard ID " + guardGuardID + " does not exist. Please add the guard first.");
        }


        // Validate phone number: exactly 10 digits
        if (phoneNumberStr == null || !phoneNumberStr.matches("\\d{10}")) {
            throw new ServletException("Phone number must be exactly 10 digits.");
        }

            Staff staff = new Staff();
            staff.setAdministratorAdminID(administratorAdminID);
            staff.setGuardGuardID(guardGuardID);
            staff.setIcNumber(icNumberStr);
            staff.setPhoneNumber(phoneNumberStr);

            Staff existing = userDao.getStaffById(administratorAdminID, guardGuardID);
            if (existing == null) {
                userDao.addStaff(staff);
            } else {
                userDao.updateStaff(staff);
            }
            response.sendRedirect("staff");
        } catch (NumberFormatException | SQLException | ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

}
