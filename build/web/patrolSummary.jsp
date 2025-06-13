<%-- 
    Document   : patrolSummary
    Created on : 26 May 2025, 3:35:25 pm
    Author     : kirtie
--%>

<%@ page import="guard.UserDao, guard.PatrolSession" %>
<%@ page import="java.sql.SQLException" %>
<%
    String sessionIdParam = request.getParameter("sessionId");
    if (sessionIdParam == null) {
        out.println("<p>No session selected.</p>");
        return;
    }
    int sessionId = Integer.parseInt(sessionIdParam);
    UserDao userDao = new UserDao();
    PatrolSession patrolSession = null;
    try {
        patrolSession = userDao.getPatrolSessionById(sessionId);
    } catch (SQLException | ClassNotFoundException e) {
        out.println("<p>Error loading patrol summary.</p>");
        return;
    }
    if (patrolSession == null) {
        out.println("<p>Patrol session not found.</p>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Patrol Summary</title>
    <link rel="stylesheet" href="styles.css" />

</head>
<body>
    <div class="form-container">
    <h2>Patrol Summary</h2>
    <p>Guard ID: <%= patrolSession.getGuardID() %></p>
    <p>Location ID: <%= patrolSession.getLocationID() %></p>
    <p>Check-in Time: <%= patrolSession.getCheckinTime() %></p>
    <p>Check-out Time: <%= patrolSession.getCheckoutTime() != null ? patrolSession.getCheckoutTime() : "Not checked out yet" %></p>
    <p>Summary: <%= patrolSession.getSummary().isEmpty() ? "None" : patrolSession.getSummary() %></p>
    <p>Incident: <%= patrolSession.getIncident().isEmpty() ? "None" : patrolSession.getIncident() %></p>
    <a href="checkin.jsp">Back to Check-In</a>
    <br><br>
    <button onclick="window.print()">Print Patrol Summary</button>
    <br><br>
    <button onclick="window.location.href='index.jsp'">Homepage</button>
    </div>
</body>
</html>
