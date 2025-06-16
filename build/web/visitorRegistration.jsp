<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Visitor Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="guardManagementStyling.css">
</head>
<body>
    <div id="menu-btn" onclick="toggleSidebar()">&#9776;</div>
    <%@ include file="sidebar.jsp" %>
    <%@ include file="header.jsp" %>

    <div class="content container mt-5">
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <h2 class="card-title mb-4 text-center">Visitor Registration</h2>
                <form action="VisitorRegistrationServlet" method="post" class="needs-validation" novalidate>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="Name" id="name" placeholder="Ali bin Abu" required>
                        </div>
                        <div class="col-md-6">
                            <label for="IC" class="form-label">IC Number</label>
                            <input type="text" class="form-control form-control-sm w-50" name="IC" id="IC" placeholder="991122-01-1234" required>
                        </div>
                        <div class="col-12">
                            <label for="address" class="form-label">Home Address</label>
                            <textarea class="form-control" name="Address" id="address" rows="2" placeholder="123, Jalan UMT, Terengganu" required></textarea>
                        </div>
                        <div class="col-12">
                            <label for="purpose" class="form-label">Purpose of Visit</label>
                            <input type="text" class="form-control" name="Purpose" id="purpose" placeholder="Meeting, Delivery, etc." required>
                        </div>
                        <div class="col-12 text-end">
                            <button type="reset" class="btn btn-secondary me-2">Reset</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="HamburgerButton.js"></script>
</body>
</html>
