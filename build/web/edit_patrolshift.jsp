<%@ page import="java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/guarddb", "root", "");
PreparedStatement ps = conn.prepareStatement("SELECT * FROM patrolshift WHERE patrolShiftID=?");
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();
rs.next();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Patrol Shift</title>
     <link rel="stylesheet" href="css/styles.css">
</head>
<body>

<h1>Edit Patrol Shift</h1>

<form method="post">
    Start Time: <input type="time" name="startTime" value="<%= rs.getString("startTime") %>" required><br><br>
    End Time: <input type="time" name="endTime" value="<%= rs.getString("endTime") %>" required><br><br>
    Guard ID: <input type="number" name="guardID" value="<%= rs.getInt("guardID") %>" required><br><br>
    Admin ID: <input type="number" name="adminID" value="<%= rs.getInt("adminID") %>" required><br><br>
    <input type="submit" value="Update Shift" class="btn">
</form>

<p><a href="manage_patrolshift.jsp" class="btn">Back</a></p>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    ps = conn.prepareStatement("UPDATE patrolshift SET startTime=?, endTime=?, guardID=?, adminID=? WHERE patrolShiftID=?");
    ps.setString(1, request.getParameter("startTime"));
    ps.setString(2, request.getParameter("endTime"));
    ps.setInt(3, Integer.parseInt(request.getParameter("guardID")));
    ps.setInt(4, Integer.parseInt(request.getParameter("adminID")));
    ps.setInt(5, id);
    ps.executeUpdate();
    conn.close();
    response.sendRedirect("manage_patrolshift.jsp");
}
%>

</body>
</html>