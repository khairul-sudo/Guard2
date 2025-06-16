<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Manage Patrol Shifts</title>
        <link rel="stylesheet" href="css/styles.css">
        <style>
            /* ===== GLOBAL & FORM STYLES ===== */
            .form-container {
                width: 400px;
                max-width: 90%;
                margin: 100px auto;
                padding: 30px;
                background-color: #ffffff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            .form-container h2 {
                color: #007bff;
                margin-bottom: 20px;
                text-align: center;
            }

            .form-container input[type="text"],
            .form-container input[type="password"],
            .form-container input[type="email"],
            .form-container select {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            .form-container input[type="submit"] {
                width: 100%;
                background-color: #007bff;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-weight: bold;
            }

            .form-container input[type="submit"]:hover {
                background-color: #0056b3;
            }

            .form-container a {
                display: block;
                margin-top: 15px;
                color: #007bff;
                text-align: center;
                text-decoration: none;
            }

            .form-container a:hover {
                text-decoration: underline;
            }

            .forgot-password-container {
                text-align: right;
                margin-bottom: 15px;
            }

            .forgot-password-link {
                font-size: 0.9em;
                color: #007BFF;
                text-decoration: none;
                font-weight: 500;
                transition: color 0.3s ease;
            }

            .forgot-password-link:hover {
                text-decoration: underline;
                color: #0056b3;
                cursor: pointer;
            }

            .error-message {
                color: red;
            }

            /* ===== SIDEBAR ===== */
            #menu-btn {
                display: none;
            }

            .home-icon {
                font-size: 24px;
                color: #007bff;
                text-decoration: none;
                margin-right: 15px;
            }

            .sidebar {
                height: 100%;
                width: 160px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                padding-top: 20px;
            }

            .sidebar .logo img {
                width: 100px;
                margin: 10px auto;
                display: block;
            }

            .sidebar-section {
                padding: 15px;
                margin: 5px;
                cursor: pointer;
                color: #fff;
            }

            .sidebar-section:hover {
                background-color: #495057;
            }

            .submenu {
                display: none;
                background-color: #2c3034;
                padding-left: 15px;
            }

            .submenu.active {
                display: block;
            }

            .submenu a {
                display: block;
                padding: 10px;
                color: #fff;
                text-decoration: none;
            }

            .submenu a:hover {
                background-color: #343a40;
            }

            .logout {
                position: fixed;
                top: 10px;
                right: 20px;
                padding: 10px 20px;
                background-color: #dc3545;
                color: white;
                text-align: center;
                text-decoration: none;
                border-radius: 5px;
                z-index: 1001;
            }

            .logout:hover {
                background-color: #c82333;
            }

            .content {
                margin-top: 56px;
                margin-left: 250px;
                padding: 30px;
                min-height: 100vh;
                background-color: #f8f9fa;
            }

            .content h1 {
                color: #212529;
            }

            /* ===== PAGE CONTENT ===== */
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
                margin-top: 20px;
                cursor: pointer;
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

            <!-- Sidebar toggle and includes -->
            <div id="menu-btn" onclick="toggleSidebar()">&#9776;</div>
            <%@ include file="sidebar.jsp" %>
            <%@ include file="header.jsp" %>
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
                            Class.forName("com.mysql.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/guarddb", "root", "");
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM patrolshift");

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("patrolShiftID")%></td>
                        <td><%= rs.getString("startTime")%></td>
                        <td><%= rs.getString("endTime")%></td>
                        <td><%= rs.getInt("guardID")%></td>
                        <td><%= rs.getInt("adminID")%></td>
                        <td>
                            <a class="action-link" href="edit_patrolshift.jsp?id=<%= rs.getInt("patrolShiftID")%>">Edit</a> |
                            <a class="action-link" href="delete_patrolshift.jsp?id=<%= rs.getInt("patrolShiftID")%>" onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                        } finally {
                            if (rs != null) {
                                rs.close();
                            }
                            if (stmt != null) {
                                stmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        }
                    %>
                </tbody>
            </table>

            <!-- Back button -->
            <form action="index.jsp" method="get" style="display:inline;">
                <button type="submit" class="btn">Back</button>
            </form>
        </div>

    </body>
</html>
