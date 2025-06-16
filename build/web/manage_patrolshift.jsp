<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Patrol Shifts</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
        }

        h1 {
            text-align: center;
            color: #3399ff;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            background-color: #3399ff;
            color: white;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            text-decoration: none;
            margin-bottom: 20px;
        }

        .btn:hover {
            background-color: #007acc;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table th, table td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }

        table th {
            background-color: #3399ff;
            color: white;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a.action-link {
            color: #3399ff;
            text-decoration: none;
        }

        a.action-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
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
                Class.forName("com.mysql.jdbc.Driver"); // Or "com.mysql.cj.jdbc.Driver"
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
                    <a class="action-link" href="edit_patrolshift.jsp?id=<%= rs.getInt("patrolShiftID") %>">Edit</a> |
                    <a class="action-link" href="delete_patrolshift.jsp?id=<%= rs.getInt("patrolShiftID") %>" onclick="return confirm('Are you sure?')">Delete</a>
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
</div>

</body>
</html>
