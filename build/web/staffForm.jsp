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
        <title><%= isEdit ? "Edit Staff" : "Add New Staff"%></title>
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
                <h2 class="text-center"><%= isEdit ? "Edit Staff" : "Add New Staff"%></h2>

                <form method="post" action="staff" class="mt-4">
                    <% if (isEdit) {%>
                    <input type="hidden" name="administratorAdminID" value="<%= staff.getAdministratorAdminID()%>" />
                    <input type="hidden" name="guardGuardID" value="<%= staff.getGuardGuardID()%>" />
                    <% }%>

                    <div class="mb-3">
                        <label for="administratorAdminID" class="form-label">Administrator ID:</label>
                        <input type="number" id="administratorAdminID" name="administratorAdminID" class="form-control" required 
                            value="<%= isEdit ? staff.getAdministratorAdminID() : ""%>" <%= isEdit ? "readonly" : ""%> />
                    </div>

                    <div class="mb-3">
                        <label for="guardGuardID" class="form-label">Guard ID:</label>
                        <input type="number" id="guardGuardID" name="guardGuardID" class="form-control" required
                            value="<%= isEdit ? staff.getGuardGuardID() : ""%>" <%= isEdit ? "readonly" : ""%> />
                    </div>

                    <div class="mb-3">
                        <label for="icNumber" class="form-label">IC Number:</label>
                        <input type="text" id="icNumber" name="icNumber" class="form-control" required maxlength="12" minlength="12"
                            pattern="\d{12}" title="Please enter exactly 12 digits" value="<%= isEdit ? staff.getIcNumber() : ""%>" />
                    </div>

                    <div class="mb-3">
                        <label for="phoneNumber" class="form-label">Phone Number:</label>
                        <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" required maxlength="10" minlength="10"
                            pattern="\d{10}" title="Please enter exactly 10 digits" value="<%= isEdit ? staff.getPhoneNumber() : ""%>" />
                    </div>

                    <button type="submit" class="btn btn-primary"><%= isEdit ? "Update" : "Add"%></button>
                    <a href="staff" class="btn btn-outline-secondary ms-2">Cancel</a>
                </form>
            </div>
        </div>

    </body>
</html>
