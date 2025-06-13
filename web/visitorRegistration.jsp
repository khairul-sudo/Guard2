<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Visitor Registration</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="guardManagementStyling.css">
    </head>
    <body>
        <div id="menu-btn" onclick="toggleSidebar()">&#9776;</div>
        <%@ include file="sidebar.jsp" %>
        <%@include file="header.jsp" %>

        <div class="content container mt-5">
            <h1 class="mb-4">Visitor Registration</h1>
            <form action="VisitorRegistrationServlet" method="post" class="row g-3 needs-validation" novalidate>
                <div class="col-md-6">
                    <label for="name" class="form-label">Full Name</label>
                    <input type="text" class="form-control" name="Name" id="name" placeholder="Ali bin Abu" required>
                </div>
                <div class="col-md-6">
                    <label for="IC" class="form-label">IC Number</label>
                    <input type="text" class="form-control" name="IC" id="IC" placeholder="991122-01-1234" required>
                </div>
                <div class="col-12">
                    <label for="address" class="form-label">Home Address</label>
                    <input type="text" class="form-control" name="Address" id="address" placeholder="123, Jalan UMT, Terengganu" required>
                </div>
                <div class="col-12">
                    <label for="purpose" class="form-label">Purpose of Visit</label>
                    <input type="text" class="form-control" name="Purpose" id="purpose" placeholder="Meeting, Delivery, etc." required>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
            </form>
        </div>
    </body>
</html>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="HamburgerButton.js"></script>