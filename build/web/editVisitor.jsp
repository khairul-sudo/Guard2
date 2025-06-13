<%--
  Document   : editVisitor
  Created on : 12 May 2025, 11:10:00?pm
  Author     : khair
--%>

<%@page import="dao.visitorDAO"%>
<%@page import="user.Visitor"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    visitorDAO dao = new visitorDAO();
    Visitor visitor = dao.selectVisitor(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Visitor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h1>Edit Visitor</h1>
    <form action="<%= request.getContextPath() %>/updateVisitorServlet" method="post">
        <input type="hidden" name="id" value="<%= visitor.getId() %>">
        <div class="mb-3">
            <label for="name" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="name" name="Name" value="<%= visitor.getName() %>" required>
        </div>
        <div class="mb-3">
            <label for="ic" class="form-label">IC Number</label>
            <input type="text" class="form-control" id="ic" name="IC" value="<%= visitor.getIc() %>" required>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <input type="text" class="form-control" id="address" name="Address" value="<%= visitor.getAddress() %>" required>
        </div>
        <div class="mb-3">
            <label for="purpose" class="form-label">Purpose</label>
            <input type="text" class="form-control" id="purpose" name="Purpose" value="<%= visitor.getPurpose() %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="<%= request.getContextPath() %>/visitorReport.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</body>
</html>