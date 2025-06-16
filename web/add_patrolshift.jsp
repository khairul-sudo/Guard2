<%-- 
    Document   : add_patrolshift
    Created on : 21 May 2025, 10:57:46?pm
    Author     : H U A W E I
--%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Patrol Shift</title>
    <link rel="stylesheet" href="css/styles.css"><!-- keeps any global rules you already have -->
    <style>
        /* --- Same inline styles you used for Add Location --- */
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
        <h2>Add Patrol Shift</h2>

        <form method="post">
            <label>Start Time:</label>
            <input type="time" name="startTime" required>

            <label>End Time:</label>
            <input type="time" name="endTime" required>

            <label>Guard ID:</label>
            <input type="number" name="guardID" required>

            <label>Admin ID:</label>
            <input type="number" name="adminID" required>

            <input type="submit" value="Add Shift">
        </form>

        <a href="manage_patrolshift.jsp"><button type="button">Back</button></a>
    </div>

<%-- ===== Server?side processing (unchanged logic) ===== --%>
<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
        Class.forName("com.mysql.jdbc.Driver");   // use com.mysql.cj.jdbc.Driver if on MySQL 8+
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/guarddb", "root", "");
        PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO patrolshift (startTime, endTime, guardID, adminID) VALUES (?, ?, ?, ?)");
        ps.setString(1, request.getParameter("startTime"));
        ps.setString(2, request.getParameter("endTime"));
        ps.setInt(3, Integer.parseInt(request.getParameter("guardID")));
        ps.setInt(4, Integer.parseInt(request.getParameter("adminID")));
        ps.executeUpdate();
        conn.close();
        response.sendRedirect("manage_patrolshift.jsp");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
}
%>

</body>
</html>
