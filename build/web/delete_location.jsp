<%-- 
    Document   : delete_location
    Created on : 21 May 2025, 10:58:34?pm
    Author     : H U A W E I
--%>

<%@page import="DB.DBConnection"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deleting Location</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
        }

        .form-container {
            width: 100%;
            max-width: 500px;
            margin: 100px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            text-align: center;
        }

        .form-container h2 {
            color: #3399ff;
            margin-bottom: 20px;
        }

        .form-container p {
            font-size: 1.1rem;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Deleting Location...</h2>

<%
Connection conn = null;
try {
    int id = Integer.parseInt(request.getParameter("id"));

    conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("DELETE FROM location WHERE locationID=?");
    ps.setInt(1, id);
    ps.executeUpdate();
    conn.close();

    // Redirect after short delay
    response.setHeader("Refresh", "1; URL=manage_location.jsp");
%>
    <p>Location deleted successfully. Redirecting...</p>
<%
} catch (Exception e) {
%>
    <p class="error">Error: <%= e.getMessage() %></p>
<%
}
%>
</div>

</body>
</html>

