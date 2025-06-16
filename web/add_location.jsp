<%-- 
    Document   : Add_location
    Created on : 21 May 2025, 10:54:10?pm
    Author     : H U A W E I
--%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Location</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        /* Optional: override or complement styles.css */
        h2 {
            color: #3399ff;
            text-align: center;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 10px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-container form {
            display: flex;
            flex-direction: column;
        }

        .form-container {
            width: 100%;
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            font-family: 'Segoe UI', sans-serif;
        }

        .form-container input[type="submit"],
        .form-container a button {
            background-color: #3399ff;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 20px;
        }

        .form-container input[type="submit"]:hover,
        .form-container a button:hover {
            background-color: #007acc;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Add New Location</h2>
        <form method="post">
            <label>Location Name:</label>
            <input type="text" name="name" required>

            <label>Address:</label>
            <input type="text" name="address" required>

            <label>Admin ID:</label>
            <input type="number" name="adminID" required>

            <label>Guard ID:</label>
            <input type="number" name="guardID" required>

            <input type="submit" value="Add Location">
        </form>

        <a href="manage_location.jsp"><button type="button">Back</button></a>
    </div>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/guarddb", "root", "");
        PreparedStatement ps = conn.prepareStatement("INSERT INTO location (name, address, adminID, guardID) VALUES (?, ?, ?, ?)");
        ps.setString(1, request.getParameter("name"));
        ps.setString(2, request.getParameter("address"));
        ps.setInt(3, Integer.parseInt(request.getParameter("adminID")));
        ps.setInt(4, Integer.parseInt(request.getParameter("guardID")));
        ps.executeUpdate();
        conn.close();
        response.sendRedirect("manage_location.jsp");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
}
%>






</body>
</html>
