<%@page import="DB.DBConnection"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Manage Locations</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
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
            .sidebar-section:hover {
                background-color: #495057;
            }

            .submenu        {
                display: none;
                background-color: #2c3034;
                padding-left: 15px;
            }
            .submenu.active {
                display: block;
            }
            .submenu a      {
                display: block;
                padding: 10px;
                color: #fff;
                text-decoration: none;
            }
            .submenu a:hover{
                background-color: #343a40;
            }

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
            .logout:hover {
                background-color: #c82333;
            }
            .content-wrapper {
                margin-left: 250px;
                padding: 40px 30px;
            }

            .card {
                max-width: 950px;
                margin: 0 auto;
                padding: 30px;
                border-radius: 12px;
            }

            h3 {
                text-align: center;
                color: #3399ff;
                margin-bottom: 30px;
            }

            .btn-custom {
                background-color: #3399ff;
                color: white;
                border: none;
            }

            .btn-custom:hover {
                background-color: #007acc;
            }

            .table th {
                background-color: #3399ff;
                color: white;
            }

            .action-link {
                color: #3399ff;
                text-decoration: none;
            }

            .action-link:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <div id="menu-btn" onclick="toggleSidebar()">☰</div>
        <%@ include file="sidebar.jsp" %>
        <%@ include file="header.jsp" %>

        <div class="content-wrapper">
            <div class="card shadow bg-white">
                <h3>Manage Locations</h3>

                <div class="mb-3">
                    <a href="add_location.jsp" class="btn btn-custom">+ Add New Location</a>
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered text-center">
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
                                    conn = DBConnection.getConnection();
                                    stmt = conn.createStatement();
                                    rs = stmt.executeQuery("SELECT * FROM location");

                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getInt("locationID")%></td>
                                <td><%= rs.getString("name")%></td>
                                <td><%= rs.getString("address")%></td>
                                <td><%= rs.getInt("adminID")%></td>
                                <td><%= rs.getInt("guardID")%></td>
                                <td>
                                    <a class="action-link" href="edit_location.jsp?id=<%= rs.getInt("locationID")%>">Edit</a> |
                                    <a class="action-link" href="delete_location.jsp?id=<%= rs.getInt("locationID")%>" onclick="return confirm('Are you sure?')">Delete</a>
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
                </div>

                <div class="mt-4">
                    <form action="homepage.jsp" method="get">
                        <button type="submit" class="btn btn-custom">Back</button>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function toggleSidebar() {
                const sidebar = document.querySelector('.sidebar');
                if (sidebar) {
                    sidebar.style.display = sidebar.style.display === 'block' ? 'none' : 'block';
                }
            }
        </script>

    </body>
</html>
