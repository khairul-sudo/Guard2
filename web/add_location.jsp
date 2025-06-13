<%-- 
    Document   : Add_location
    Created on : 21 May 2025, 10:54:10?pm
    Author     : H U A W E I
--%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Location</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <h1>Add New Location</h1>

    <form method="post">
        Location Name: <input type="text" name="name" required><br><br>
        Address: <input type="text" name="address" required><br><br>
        Admin ID: <input type="number" name="adminID" required><br><br>
        Guard ID: <input type="number" name="guardID" required><br><br>
        <input type="submit" value="Add Location" class="btn">
    </form>

    <p><a href="manage_location.jsp" class="btn">Back</a></p>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/guarddb", "root", "");
        PreparedStatement ps = conn.prepareStatement("INSERT INTO location (name, address, adminID, guardID) VALUES (?, ?, ?, ?)");
        ps.setString(1, request.getParameter("name"));
        ps.setString(2, request.getParameter("address"));
        ps.setInt(3, Integer.parseInt(request.getParameter("adminID")));
        ps.setInt(4, Integer.parseInt(request.getParameter("guardID")));
        ps.executeUpdate();
        conn.close();
        response.sendRedirect("manage_location.jsp");
    } catch (Exception e) {
        out.println("<p style='color:red;'>? Error: " + e.getMessage() + "</p>");
    }
}
%>

</body>
</html>