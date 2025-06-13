<%-- 
    Document   : deleteVisitor
    Created on : 13 May 2025, 11:08:47 pm
    Author     : khair
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Visitor</title>
</head>
<body>
    <h2>Delete Visitor</h2>
    
    <form action="DeleteVisitorServlet" method="post">
        <label for="visitorID">Visitor ID:</label>
        <input type="number" name="visitorID" id="visitorID" required>
        <br><br>
        <input type="submit" value="Delete Visitor">
    </form>
    
    <%-- Display a message if deletion is successful or failed --%>
    <%
        String message = request.getParameter("message");
        if (message != null) {
    %>
        <p style="color: green;"><%= message %></p>
    <% } %>
</body>
</html>

