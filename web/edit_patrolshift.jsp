<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.jdbc.Driver"); // Use com.mysql.cj.jdbc.Driver if needed
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/guarddb", "root", "");

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Update logic
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");
        int guardID = Integer.parseInt(request.getParameter("guardID"));
        int adminID = Integer.parseInt(request.getParameter("adminID"));

        PreparedStatement ps = conn.prepareStatement(
            "UPDATE patrolshift SET startTime=?, endTime=?, guardID=?, adminID=? WHERE patrolShiftID=?");
        ps.setString(1, startTime);
        ps.setString(2, endTime);
        ps.setInt(3, guardID);
        ps.setInt(4, adminID);
        ps.setInt(5, id);

        int updated = ps.executeUpdate();
        if (updated > 0) {
            conn.close();
            response.sendRedirect("manage_patrolshift.jsp"); // Redirect to view list
            return;
        }
    }

    // Load patrol shift details
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM patrolshift WHERE patrolShiftID=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Patrol Shift</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f7f8;
        }

        .form-container {
            width: 100%;
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
        }

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

        input, button {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input[type="submit"], .back-btn {
            background-color: #3399ff;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }

        input[type="submit"]:hover, .back-btn:hover {
            background-color: #007acc;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Edit Patrol Shift</h2>
    <form method="post">
        <label>Start Time:</label>
        <input type="time" name="startTime" value="<%= rs.getString("startTime") %>" required>

        <label>End Time:</label>
        <input type="time" name="endTime" value="<%= rs.getString("endTime") %>" required>

        <label>Guard ID:</label>
        <input type="number" name="guardID" value="<%= rs.getInt("guardID") %>" required>

        <label>Admin ID:</label>
        <input type="number" name="adminID" value="<%= rs.getInt("adminID") %>" required>

        <input type="submit" value="Update Shift">
    </form>
    <a href="manage_patrolshift.jsp"><button class="back-btn">Back</button></a>
</div>
</body>
</html>
<%
    rs.close();
    ps.close();
    conn.close();
%>
