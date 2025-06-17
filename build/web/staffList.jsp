<%-- 
    Document   : staffList
    Created on : 19 May 2025, 12:32:32 am
    Author     : kirtie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <title>Manage Staff</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="guardManagementStyling.css">
    </head>
    <body>
        <div id="menu-btn" onclick="toggleSidebar()">&#9776;</div>
        <%@ include file="sidebar.jsp" %>
        <%@ include file="header.jsp" %>
        
        <!-- Container for centering the content -->
        <div class="container d-flex justify-content-center align-items-center mt-5" style="min-height: 80vh;">
            <div class="card shadow-sm bg-white p-4" style="width: 100%; max-width: 900px;"> <!-- Increased width to 900px -->
                <h2 class="text-center">Staff List</h2>

                <!-- Search Form -->
                <form method="get" action="staff" class="d-flex justify-content-between align-items-center my-4">
                    <input type="text" name="keyword" class="form-control w-50" placeholder="Search by Admin ID, Guard ID or IC Number" value="${param.keyword}" />
                    <button type="submit" class="btn btn-primary ms-2">Search</button>
                    <div>
                        <a href="staff?action=new" class="btn btn-success ms-2">Add New Staff</a>
                        <a href="staff?action=export" class="btn btn-secondary ms-2">Export CSV</a>
                    </div>
                </form>

                <!-- Table Content -->
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
                            <c:choose>
                                <c:when test="${not empty staffList}">
                                    <c:forEach var="staff" items="${staffList}">
                                        <tr>
                                            <td>${staff.administratorAdminID}</td>
                                            <td>${staff.guardGuardID}</td>
                                            <td>${staff.icNumber}</td>
                                            <td>${staff.phoneNumber}</td>
                                            <td class="text-center">
                                                <a href="staff?action=edit&administratorAdminID=${staff.administratorAdminID}&guardGuardID=${staff.guardGuardID}" class="btn btn-warning btn-sm">Edit</a>
                                                <a href="staff?action=delete&administratorAdminID=${staff.administratorAdminID}&guardGuardID=${staff.guardGuardID}" class="btn btn-danger btn-sm"
                                                   onclick="return confirm('Delete this staff?');">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr><td colspan="5" class="text-center">No records found</td></tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>

                <!-- Back Button -->
                <div class="text-center mt-3">
                    <form action="homepage.jsp" method="get">
                        <button type="submit" class="btn btn-outline-primary">Back</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
