<%-- 
    Document   : error
    Created on : 29 Apr 2025, 11:50:48?pm
    Author     : khair
--%>

<%-- error.jsp --%>
<html>
<body>
    <h2>Error Occurred</h2>
    <p><%= request.getAttribute("errorMessage") %></p>
    <a href="../Login.html">Go Back</a>
</body>
</html>

