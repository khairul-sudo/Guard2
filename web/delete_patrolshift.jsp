<%-- 
    Document   : delete_patrolshift
    Created on : 22 May 2025, 3:10:13?pm
    Author     : H U A W E I
--%>
<%@ page import="java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/guarddb", "root", "");
PreparedStatement ps = conn.prepareStatement("DELETE FROM patrolshift WHERE patrolShiftID=?");
ps.setInt(1, id);
ps.executeUpdate();
conn.close();
response.sendRedirect("manage_patrolshift.jsp");
%>