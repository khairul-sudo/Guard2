<%-- 
    Document   : error
    Created on : 29 Apr 2025, 11:50:48 pm
    Author     : khair
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error</title>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Custom Styling -->
    <link rel="stylesheet" href="../guardManagementStyling.css">
</head>

<body class="logout-body">
    <div class="logout-box">
        <i class="fas fa-exclamation-triangle logout-icon" style="color: #e74c3c;"></i>
        <h2 class="logout-title">An Error Occurred</h2>
        <p class="logout-message">
            <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "Unknown error occurred." %>
        </p>
        <p class="logout-message">
            Please try again or <a href="../Login.html" class="logout-link">go back to login</a>.
        </p>
    </div>
</body>
</html>
