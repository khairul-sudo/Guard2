<%@ page import="java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/guarddb", "root", "");
PreparedStatement ps = conn.prepareStatement("SELECT * FROM location WHERE locationID=?");
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();
rs.next();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Location</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

<h1>Edit Location</h1>

<form method="post">
    Location Name: <input type="text" name="name" value="<%= rs.getString("name") %>" required><br><br>
    Address: <input type="text" name="address" value="<%= rs.getString("address") %>" required><br><br>
    Admin ID: <input type="number" name="adminID" value="<%= rs.getInt("adminID") %>" required><br><br>
    Guard ID: <input type="number" name="guardID" value="<%= rs.getInt("guardID") %>" required><br><br>
    <input type="submit" value="Update Location" class="btn">
</form>

<p><a href="manage_location.jsp" class="btn">Back</a></p>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    ps = conn.prepareStatement("UPDATE location SET name=?, address=?, adminID=?, guardID=? WHERE locationID=?");
    ps.setString(1, request.getParameter("name"));
    ps.setString(2, request.getParameter("address"));
    ps.setInt(3, Integer.parseInt(request.getParameter("adminID")));
    ps.setInt(4, Integer.parseInt(request.getParameter("guardID")));
    ps.setInt(5, id);
    ps.executeUpdate();
    conn.close();
    response.sendRedirect("manage_location.jsp");
}
%>

</body>
</html>