<%-- error.jsp --%>
<html>
<body>
    <h2>Error Occurred</h2>
    <p><%= request.getAttribute("errorMessage") %></p>
    <a href="../visitorRegistration.jsp">Go Back</a>
</body>
</html>