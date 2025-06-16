<%@page import="DB.DBConnection"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Patrol Shifts</title>

    <!-- (Optional) global stylesheet -->
    <link rel="stylesheet" href="css/styles.css">

    <style>
        /* ===== GLOBAL ===== */
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7f8;
            margin: 0;
            padding: 0;
        }

        /* ===== SIDEBAR ===== */
        #menu-btn {           /* hamburger on small screens */
            display: none;
        }

        .sidebar {
            height: 100%;
            width: 160px;     /* width of sidebar */
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
        .sidebar-section:hover { background-color: #495057; }

        .submenu        { display: none; background-color: #2c3034; padding-left: 15px; }
        .submenu.active { display: block; }
        .submenu a      { display: block; padding: 10px; color: #fff; text-decoration: none; }
        .submenu a:hover{ background-color: #343a40; }

        /* ===== LOG‑OUT BUTTON ===== */
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
        .logout:hover { background-color: #c82333; }

        /* ===== MAIN CONTENT WRAPPER ===== */
        .main-content {
            margin-left: 180px;      /* sidebar width (160) + a little spacing */
            padding: 40px 20px;
        }

        /* ===== CARD / CONTAINER ===== */
        .container {
            max-width: 700px;        /* same look as your screenshot */
            margin: 0 auto;          /* center horizontally */
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

        /* ===== BUTTONS ===== */
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
        .btn:hover { background-color: #007acc; }

        /* ===== TABLE ===== */
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
        table th              { background-color: #3399ff; color: white; }
        table tr:nth-child(even) { background-color: #f9f9f9; }

        a.action-link { color: #3399ff; text-decoration: none; }
        a.action-link:hover { text-decoration: underline; }

        /* ===== RESPONSIVE ===== */
        @media screen and (max-width: 768px) {
            #menu-btn {
                display: block;
                padding: 10px;
                background-color: #333;
                color: white;
                font-size: 20px;
                cursor: pointer;
            }

            .sidebar {
                display: none;       /* hidden by default on small screens */
                width: 200px;
                position: absolute;
                z-index: 1000;
            }

            .main-content {
                margin-left: 0;      /* no sidebar gap */
                padding: 60px 15px;  /* extra top padding for menu‑btn */
            }
        }
    </style>
</head>
<body>

    <!-- ===== SIDEBAR TOGGLE BUTTON (small screens) ===== -->
    <div id="menu-btn" onclick="toggleSidebar()">☰ Menu</div>

    <!-- ===== SHARED SIDEBAR & HEADER ===== -->
    <%@ include file="sidebar.jsp" %>
    <%@ include file="header.jsp" %>

    <!-- ===== PAGE CONTENT ===== -->
    <div class="main-content">
        <div class="container">
            <h1>Manage Patrol Shifts</h1>

            <a href="add_patrolshift.jsp" class="btn">+ Add New Patrol Shift</a>

            <!-- ===== DATA TABLE ===== -->
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
                        Statement  stmt = null;
                        ResultSet   rs   = null;

                        try {
                            conn = DBConnection.getConnection();
                            stmt = conn.createStatement();
                            rs   = stmt.executeQuery("SELECT * FROM patrolshift");

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("patrolShiftID") %></td>
                        <td><%= rs.getString("startTime")     %></td>
                        <td><%= rs.getString("endTime")       %></td>
                        <td><%= rs.getInt("guardID")          %></td>
                        <td><%= rs.getInt("adminID")          %></td>
                        <td>
                            <a class="action-link"
                               href="edit_patrolshift.jsp?id=<%= rs.getInt("patrolShiftID") %>">Edit</a>
                            |
                            <a class="action-link"
                               href="delete_patrolshift.jsp?id=<%= rs.getInt("patrolShiftID") %>"
                               onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                        } finally {
                            if (rs   != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        }
                    %>
                </tbody>
            </table>

            <!-- ===== BACK BUTTON ===== -->
            <form action="index.jsp" method="get" style="display:inline;">
                <button type="submit" class="btn">Back</button>
            </form>
        </div>
    </div>

    <!-- ===== JAVASCRIPT FOR SIDEBAR ===== -->
    <script>
        /* toggle full sidebar on small screens */
        function toggleSidebar() {
            const sidebar = document.querySelector('.sidebar');
            if (sidebar) {
                sidebar.style.display = (sidebar.style.display === 'block') ? 'none' : 'block';
            }
        }
        /* toggle each submenu from sidebar.jsp */
        function toggleSubmenu(id) {
            const submenu = document.getElementById(id + '-submenu');
            if (submenu) submenu.classList.toggle('active');
        }
    </script>

</body>
</html>
