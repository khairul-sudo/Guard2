<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="guard.Staff" %>

<%
    List<Staff> staffList = (List<Staff>) request.getAttribute("staffList");
    if (staffList == null)
        staffList = new java.util.ArrayList<>();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Staff</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="guardManagementStyling.css">

    <style>
        .content-wrapper {
            margin-left: 240px; /* adjust if sidebar width changes */
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px;
        }

        .card {
            width: 100%;
            max-width: 1200px;
            padding: 30px 40px;
            border-radius: 10px;
        }

        .search-group {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .btn-group-action {
            margin-bottom: 20px;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table thead {
            background-color: #d1f3f9;
        }
    </style>
</head>
<body>

    <div id="menu-btn" onclick="toggleSidebar()">&#9776;</div>
    <%@ include file="sidebar.jsp" %>
    <%@ include file="header.jsp" %>

    <div class="content-wrapper">
        <div class="card shadow bg-white">
            <h3 class="text-center text-primary mb-4">Staff List</h3>

            <form method="get" action="staff" class="search-group">
                <input type="text" name="keyword" class="form-control" placeholder="Search by Administrator ID, Guard ID, or IC Number" value="${param.keyword}">
                <button class="btn btn-primary" type="submit">Search</button>
            </form>

            <div class="btn-group-action">
                <a href="staff?action=new" class="btn btn-success me-2">Add New Staff</a>
                <a href="staff?action=export" class="btn btn-secondary">Export as CSV</a>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Administrator ID</th>
                            <th>Guard ID</th>
                            <th>IC Number</th>
                            <th>Phone Number</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="staff" items="${staffList}">
                            <tr>
                                <td>${staff.administratorAdminID}</td>
                                <td>${staff.guardGuardID}</td>
                                <td>${staff.icNumber}</td>
                                <td>${staff.phoneNumber}</td>
                                <td>
                                    <a href="staff?action=edit&administratorAdminID=${staff.administratorAdminID}&guardGuardID=${staff.guardGuardID}" class="btn btn-sm btn-warning me-1">Edit</a>
                                    <form action="staff" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="delete" />
                                        <input type="hidden" name="administratorAdminID" value="${staff.administratorAdminID}" />
                                        <input type="hidden" name="guardGuardID" value="${staff.guardGuardID}" />
                                        <input type="submit" class="btn btn-sm btn-danger" value="Delete" onclick="return confirm('Delete this staff?');" />
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty staffList}">
                            <tr>
                                <td colspan="5" class="text-muted">No records found</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>

            <div class="text-center mt-3">
                <form action="homepage.jsp" method="get">
                    <button type="submit" class="btn btn-outline-primary">Back</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
