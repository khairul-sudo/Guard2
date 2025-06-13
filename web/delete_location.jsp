<%-- 
    Document   : delete_location
    Created on : 21 May 2025, 10:58:34?pm
    Author     : H U A W E I
--%>

<%@ page import="java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/guarddb", "root", "");
PreparedStatement ps = conn.prepareStatement("DELETE FROM location WHERE locationID=?");
ps.setInt(1, id);
ps.executeUpdate();
conn.close();
response.sendRedirect("manage_location.jsp");
%>



