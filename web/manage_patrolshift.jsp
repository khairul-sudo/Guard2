<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Patrol Shifts</title>
     <link rel="stylesheet" href="css/styles.css">
</head>
<body>

    <h1>Manage Patrol Shifts</h1>

    <a href="add_patrolshift.jsp" class="btn">+ Add New Patrol Shift</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Guard ID</th>
                <th>Admin ID</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver"); // Or "com.mysql.cj.jdbc.Driver" for newer versions
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/guarddb", "root", "");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM patrolshift");

        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getInt("patrolShiftID") %></td>
                <td><%= rs.getString("startTime") %></td>
                <td><%= rs.getString("endTime") %></td>
                <td><%= rs.getInt("guardID") %></td>
                <td><%= rs.getInt("adminID") %></td>
                <td>
                    <a href="edit_patrolshift.jsp?id=<%= rs.getInt("patrolShiftID") %>">Edit</a> |
                    <a href="delete_patrolshift.jsp?id=<%= rs.getInt("patrolShiftID") %>" onclick="return confirm('Are you sure?')">Delete</a>
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