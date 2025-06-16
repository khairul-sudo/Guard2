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
    <%@ include file="header.jsp" %>

    <div class="content container mt-5">
        <h1>Visitor Report</h1>

        <!-- Search Form -->
        <form method="get" action="visitorReport.jsp" class="row g-2 align-items-center mb-3" style="max-width: 400px;">
            <div class="col">
                <input type="text" name="keyword" class="form-control form-control-sm" placeholder="Search name , Purpose OR IC..." value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
            </div>
            <div class="col-auto">
                <button type="submit" class="btn btn-sm btn-primary">Search</button>
                <a href="visitorReport.jsp" class="btn btn-sm btn-secondary">Cancel</a>
            </div>
        </form>

        <!-- Flash messages -->
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

            int currentPage = 1;
            int recordsPerPage = 10;
            if (request.getParameter("page") != null) {
                currentPage = Integer.parseInt(request.getParameter("page"));
            }
            int offset = (currentPage - 1) * recordsPerPage;

            visitorDAO dao = new visitorDAO();
            List<Visitor> visitors;
            String keyword = request.getParameter("keyword");

            int totalRecords = 0;
            int totalPages = 0;

            if (keyword != null && !keyword.trim().isEmpty()) {
                visitors = dao.searchVisitorsWithPagination(keyword, offset, recordsPerPage);
                totalRecords = dao.countSearchVisitors(keyword);
            } else {
                visitors = dao.selectVisitorsWithPagination(offset, recordsPerPage);
                totalRecords = dao.countVisitors();
            }
            totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
        %>

        <% if (visitors.isEmpty()) { %>
            <p class="text-danger">No visitor found<%= (keyword != null ? " for \"" + keyword + "\"" : "") %></p>
        <% } else { %>
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

        <!-- Pagination Controls -->
        <nav>
            <ul class="pagination">
                <% for (int i = 1; i <= totalPages; i++) { %>
                    <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                        <a class="page-link" href="visitorReport.jsp?page=<%= i %><%= (keyword != null ? "&keyword=" + keyword : "") %>"><%= i %></a>
                    </li>
                <% } %>
            </ul>
        </nav>
        <% } %>

        <a href="visitorRegistration.jsp" class="btn btn-primary">Add New Visitor</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="HamburgerButton.js"></script>
</body>
</html>
