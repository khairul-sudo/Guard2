<%@ page import="dao.visitorDAO" %>
<%@ page import="user.Visitor" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Visitor Report</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="guardManagementStyling.css">
</head>
<body>
    <div id="menu-btn" onclick="toggleSidebar()">&#9776;</div>
    <%@ include file="sidebar.jsp" %> 

    <a class="logout" href="logout.jsp">LOGOUT</a>

    <div class="content container mt-5">
        <h1>Visitor Report</h1>

        <%
            String message = request.getParameter("message");
            if (message != null) {
        %>
        <p style="color: green;"><%= message %></p>
        <%
            }
            String error = request.getParameter("error");
            if (error != null) {
        %>
        <p style="color: red;"><%= error %></p>
        <%
            }

            visitorDAO dao = new visitorDAO();
            List<Visitor> visitors = dao.selectAllVisitors();
        %>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>IC</th>
                    <th>Address</th>
                    <th>Purpose</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Visitor v : visitors) { %>
                <tr>
                    <td><%= v.getId() %></td>
                    <td><%= v.getName() %></td>
                    <td><%= v.getIc() %></td>
                    <td><%= v.getAddress() %></td>
                    <td><%= v.getPurpose() %></td>
                    <td>
                        <a href="editVisitor.jsp?id=<%= v.getId() %>" class="btn btn-sm btn-warning">Edit</a>
                        <a href="deleteVisitorServlet?id=<%= v.getId() %>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete <%= v.getName() %>?')">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <a href="visitorRegistration.jsp" class="btn btn-primary">Add New Visitor</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="HamburgerButton.js"></script>
</body>
</html>
