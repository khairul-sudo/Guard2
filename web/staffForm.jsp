<%-- 
    Document   : staffForm
    Created on : 19 May 2025, 12:36:29 am
    Author     : kirtie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="guard.Staff"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
Staff staff = (Staff) request.getAttribute("staff");
boolean isEdit = (staff != null);
%>

<!DOCTYPE html>
<html>
<head>
    <title><%= isEdit ? "Edit Staff" : "Add New Staff" %></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>

<div class="form-container">
    <h2><%= isEdit ? "Edit Staff" : "Add New Staff" %></h2>

    <form method="post" action="staff">
        <% if (isEdit) { %>
            <input type="hidden" name="administratorAdminID" value="<%= staff.getAdministratorAdminID() %>" />
            <input type="hidden" name="guardGuardID" value="<%= staff.getGuardGuardID() %>" />
        <% } %>

        <label for="administratorAdminID">Administrator ID:</label>
        <input type="number" id="administratorAdminID" name="administratorAdminID" required
            value="<%= isEdit ? staff.getAdministratorAdminID() : "" %>" <%= isEdit ? "readonly" : "" %> />

        <label for="guardGuardID">Guard ID:</label>
        <input type="number" id="guardGuardID" name="guardGuardID" required
            value="<%= isEdit ? staff.getGuardGuardID() : "" %>" <%= isEdit ? "readonly" : "" %> />

        <label for="icNumber">IC Number:</label>
        <input type="text" id="icNumber" name="icNumber" required maxlength="12" minlength="12"
               pattern="\d{12}" title="Please enter exactly 12 digits"
               value="<%= isEdit ? staff.getIcNumber() : "" %>" />

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" required maxlength="10" minlength="10"
               pattern="\d{10}" title="Please enter exactly 10 digits"
               value="<%= isEdit ? staff.getPhoneNumber() : "" %>" />

        <button type="submit"><%= isEdit ? "Update" : "Add" %></button>
        <a href="staff" style="display:inline-block; margin-top: 15px; color:#007bff;">Cancel</a>
    </form>
</div>

</body>
</html>
