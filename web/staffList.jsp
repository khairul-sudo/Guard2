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
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    
    <div class="form-container">
        <h2>Staff List</h2>

        <form method="get" action="staff">
            <input type="text" name="keyword" placeholder="Search by Admin ID, Guard ID or IC Number" value="${param.keyword}" />
            <button type="submit">Search</button>
            <a href="staff?action=new">Add New Staff</a> | 
            <a href="staff?action=export">Export CSV</a>
        </form>

        <table border="1" cellpadding="5" cellspacing="0" style="margin-top: 10px;">
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
                            <td data-label="Administrator ID">${staff.administratorAdminID}</td>
                            <td data-label="Guard ID">${staff.guardGuardID}</td>
                            <td data-label="IC Number">${staff.icNumber}</td>
                            <td data-label="Phone Number">${staff.phoneNumber}</td>
                            <td data-label="Actions" class="actions">
                                <a href="staff?action=edit&administratorAdminID=${staff.administratorAdminID}&guardGuardID=${staff.guardGuardID}" class="edit">Edit</a>
                                <a href="staff?action=delete&administratorAdminID=${staff.administratorAdminID}&guardGuardID=${staff.guardGuardID}" class="delete"
                                   onclick="return confirm('Delete this staff?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="5">No records found</td></tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>
</body>
</html>
