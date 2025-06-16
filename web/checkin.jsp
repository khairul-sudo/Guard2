<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Guard Management System - Check-In</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
    <link rel="stylesheet" href="guardManagementStyling.css">
    
    <style>
        .content-wrapper {
            margin-left: 250px; /* same width as your sidebar */
            padding: 40px 20px;
        }

        .form-card {
            max-width: 600px;
            width: 100%;
            margin: 0 auto;
            padding: 25px 30px;
            border-radius: 10px;
        }

        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div id="menu-btn" onclick="toggleSidebar()">&#9776;</div>
    <%@ include file="sidebar.jsp" %>
    <%@ include file="header.jsp" %>

    <div class="content-wrapper">
        <div class="card shadow bg-white form-card">
            <h4 class="text-center text-primary mb-4">Check-In / Check-Out Patrolling Session</h4>

            <form action="${pageContext.request.contextPath}/CheckpointServlet" method="post">
                <div class="mb-3">
                    <label for="guardId" class="form-label">Guard ID</label>
                    <input type="number" id="guardId" name="guardId" class="form-control" required min="1" step="1">
                </div>

                <div class="mb-3">
                    <label for="locationId" class="form-label">Checkpoint ID</label>
                    <input type="number" id="locationId" name="locationId" class="form-control" required min="1" step="1">
                </div>

                <div class="mb-3">
                    <label for="action" class="form-label">Action</label>
                    <select name="action" id="action" class="form-select" required>
                        <option value="checkin">Check-in</option>
                        <option value="checkout">Check-out</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="summary" class="form-label">Patrol Summary</label>
                    <textarea id="summary" name="summary" class="form-control" rows="3"></textarea>
                </div>

                <div class="mb-3">
                    <label for="incident" class="form-label">Incident (if any)</label>
                    <textarea id="incident" name="incident" class="form-control" rows="2"></textarea>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Submit Patrol Data</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
