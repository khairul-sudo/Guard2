<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Locations</title>
     <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <h1>Manage Locations</h1>

    <a href="add_location.jsp" class="btn">+ Add New Location</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Location Name</th>
                <th>Address</th>
                <th>Admin ID</th>
                <th>Guard ID</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver"); // or com.mysql.cj.jdbc.Driver for MySQL 8
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/guarddb", "root", "");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM location");

        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getInt("locationID") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("address") %></td>
                <td><%= rs.getInt("adminID") %></td>
                <td><%= rs.getInt("guardID") %></td>
                <td>
                    <a href="edit_location.jsp?id=<%= rs.getInt("locationID") %>">Edit</a> |
                    <a href="delete_location.jsp?id=<%= rs.getInt("locationID") %>" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
<%
        }
    } catch (Exception e) {
        out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
        </tbody>
    </table>

</body>
</html>
