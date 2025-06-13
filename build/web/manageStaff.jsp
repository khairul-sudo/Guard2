<%-- 
    Document   : manageStaff
    Created on : 18 May 2025, 11:29:47 pm
    Author     : kirtie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="guard.Staff" %>

<%
    List<Staff> staffList = (List<Staff>) request.getAttribute("staffList");
    if (staffList == null) staffList = new java.util.ArrayList<>();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Staff</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>

    <div class="form-container">
        <h2>Staff List</h2>

        <form method="get" action="staff">
            <input type="text" name="keyword" placeholder="Search by Administrator ID, Guard ID, or IC Number" value="${param.keyword}"/>
            <input type="submit" value="Search" />
        </form>

        <p>
            <a href="staff?action=new">Add New Staff</a> | 
            <a href="staff?action=export">Export as CSV</a>
        </p>

        <table border="1" cellpadding="5" cellspacing="0">
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
                        <td data-label="Administrator ID">${staff.administratorAdminID}</td>
                        <td data-label="Guard ID">${staff.guardGuardID}</td>
                        <td data-label="IC Number">${staff.icNumber}</td>
                        <td data-label="Phone Number">${staff.phoneNumber}</td>
                        <td data-label="Actions" class="actions">
                            <a href="staff?action=edit&administratorAdminID=${staff.administratorAdminID}&guardGuardID=${staff.guardGuardID}" class="edit">Edit</a>
                            <form action="staff" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete" />
                                <input type="hidden" name="administratorAdminID" value="${staff.administratorAdminID}" />
                                <input type="hidden" name="guardGuardID" value="${staff.guardGuardID}" />
                                <input type="submit" value="Delete" class="delete" onclick="return confirm('Delete this staff?');" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty staffList}">
                    <tr><td colspan="5">No records found</td></tr>
                </c:if>
            </tbody>
        </table>

        <br/><br/>
        <form action="index.jsp" method="get" style="display:inline;">
          <button type="submit">Back</button>
        </form>
    </div>
</body>
</html>
