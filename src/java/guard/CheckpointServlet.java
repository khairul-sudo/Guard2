/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package guard;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CheckpointServlet", urlPatterns = {"/CheckpointServlet"})
public class CheckpointServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String guardIdStr = request.getParameter("guardId");
        String locationIdStr = request.getParameter("locationId");
        String summary = request.getParameter("summary");
        String incident = request.getParameter("incident");

        if (guardIdStr == null || guardIdStr.trim().isEmpty() ||
            locationIdStr == null || locationIdStr.trim().isEmpty()){
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters.");
            return;
        }

        guardIdStr = guardIdStr.trim();
        locationIdStr = locationIdStr.trim();

        // Validate numeric inputs
        if (!guardIdStr.matches("\\d+") || !locationIdStr.matches("\\d+")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Guard ID and Location ID must be numeric.");
            return;
        }

        int guardId = Integer.parseInt(guardIdStr);
        int locationId = Integer.parseInt(locationIdStr);

        try {
            UserDao userDao = new UserDao();

            if (!userDao.guardExists(guardId)) {
                request.setAttribute("errorMessage", "Guard ID " + guardId + " does not exist.");
                request.getRequestDispatcher("checkin.jsp").forward(request, response);
                return;
            }

            if (!userDao.locationExists(locationId)) {
                request.setAttribute("errorMessage", "Location ID " + locationId + " does not exist.");
                request.getRequestDispatcher("checkin.jsp").forward(request, response);
                return;
            }

            // Check if there's an existing open session (checkoutTime IS NULL)
            Integer openSessionId = userDao.getOpenSessionId(guardId, locationId);

            if (openSessionId == null) {
                // No open session → this is a check-in → insert new record
                int sessionId = userDao.addPatrolCheckin(guardId, locationId);

                if (sessionId == -1) {
                    request.setAttribute("errorMessage", "Failed to record check-in.");
                    request.getRequestDispatcher("checkin.jsp").forward(request, response);
                    return;
                }

                // Store session ID in HttpSession (optional)
                request.getSession().setAttribute("currentSessionId", sessionId);

                // Pass data to JSP
                request.setAttribute("guardId", guardId);
                request.setAttribute("locationId", locationId);
                request.setAttribute("checkinTime", new java.util.Date());

                // Forward to JSP for result display
                request.getRequestDispatcher("checkinResult.jsp").forward(request, response);

            } else {
                // Open session exists → this is a check-out → update record
                boolean updateSuccess = userDao.updatePatrolCheckout(openSessionId,
                        summary == null ? "" : summary.trim(),
                        incident == null ? "" : incident.trim());

                if (updateSuccess) {
                    request.getSession().removeAttribute("currentSessionId");
                    response.sendRedirect("patrolSummary.jsp?sessionId=" + openSessionId);
                } else {
                    request.setAttribute("errorMessage", "Failed to record check-out.");
                    request.getRequestDispatcher("checkin.jsp").forward(request, response);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(response.getWriter()); // For debugging; consider logging instead
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/checkin.jsp");
    }
}
