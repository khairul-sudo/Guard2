<%-- 
    Document   : checkinResult
    Created on : 26 May 2025, 6:45:35 pm
    Author     : kirtie
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Check-In Result</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>
    <div class="form-container">
  <h2>Patrol check-in recorded successfully!</h2>
  <p>Guard ID: ${guardId}</p>
  <p>Checkpoint ID: ${locationId}</p>
  <p>Check-in Time: ${checkinTime}</p><br>
  <a href="checkin.jsp">Back to Check-In</a>
    </div>
</body>
</html>
