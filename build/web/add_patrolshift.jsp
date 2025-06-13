<%-- 
    Document   : add_patrolshift
    Created on : 21 May 2025, 10:57:46?pm
    Author     : H U A W E I
--%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Patrol Shift</title>
     <link rel="stylesheet" href="css/styles.css">
</head>
<body>

<h1>Add Patrol Shift</h1>

<form method="post">
    Start Time: <input type="time" name="startTime" required><br><br>
    End Time: <input type="time" name="endTime" required><br><br>
    Guard ID: <input type="number" name="guardID" required><br><br>
    Admin ID: <input type="number" name="adminID" required><br><br>
    <input type="submit" value="Add Shift" class="btn">
</form>

<p><a href="manage_patrolshift.jsp" class="btn">Back</a></p>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/guarddb", "root", "");
        PreparedStatement ps = conn.prepareStatement("INSERT INTO patrolshift (startTime, endTime, guardID, adminID) VALUES (?, ?, ?, ?)");
        ps.setString(1, request.getParameter("startTime"));
        ps.setString(2, request.getParameter("endTime"));
        ps.setInt(3, Integer.parseInt(request.getParameter("guardID")));
        ps.setInt(4, Integer.parseInt(request.getParameter("adminID")));
        ps.executeUpdate();
        conn.close();
        response.sendRedirect("manage_patrolshift.jsp");
    } catch (Exception e) {
        out.println("<p style='color:red;'>? Error: " + e.getMessage() + "</p>");
    }
}
%>

</body>
</html>