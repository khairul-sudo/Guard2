<%-- 
    Document   : checkin
    Created on : 18 May 2025, 9:46:53 pm
    Author     : kirtie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Guard Management System - Check-In</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>
    <div class="form-container">
        <h2>Check-In / Check-Out Patrolling Session</h2>
        <form action="${pageContext.request.contextPath}/CheckpointServlet" method="post">
            Guard ID: <input type="number" name="guardId" required min="1" step="1"><br><br>
            Checkpoint ID: <input type="number" name="locationId" required min="1" step="1"><br><br>
            Action:
            <select name="action" required>
                <option value="checkin">Check-in</option>
                <option value="checkout">Check-out</option>
            </select><br><br>

            <label for="summary">Patrol Summary:</label><br>
            <textarea id="summary" name="summary" rows="4" cols="40"></textarea><br><br>

            <label for="incident">Incident (if any):</label><br>
            <textarea id="incident" name="incident" rows="3" cols="40"></textarea><br><br>

            <input type="submit" value="Submit Patrol Data">
        </form>
    </div>
</body>
</html>
