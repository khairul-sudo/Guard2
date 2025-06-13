<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Guard Management System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">

    </head>
    <body>
        <div id="menu-btn" onclick="toggleSidebar()">&#9776;</div>

        <div id="sidebar" class="sidebar">
            <div class="logo"><img src="UMT_logo.png" alt="UMT"></div>
            <div class="sidebar-section" onclick="toggleSubmenu('guard')">Guard Task</div>
            <div id="guard-submenu" class="submenu">
                <a href="visitorRegistration.jsp">Visitor Registration</a>
                <a href="checkin.jsp">Patrolling</a>
                <a href="#">Schedule</a>
            </div>
            <div class="sidebar-section" onclick="toggleSubmenu('management')">Management Task</div>
            <div id="management-submenu" class="submenu">
                <a href="manageStaff.jsp">Manage Staff</a>
                <a href="#">Manage Schedule</a>
                <a href="#">Manage Location</a>
            </div>
            <div class="sidebar-section" onclick="toggleSubmenu('visitor')">Visitor Report</div>
            <div id="visitor-submenu" class="submenu">
                <a href="visitorReport.jsp">Visitor Report</a>
                <a href="visitor">visitor data</a>
            </div>
            <div class="sidebar-section" onclick="toggleSubmenu('report')">Report</div>
            <div id="report-submenu" class="submenu">
                <a href="#">Table</a>
                <a href="#">Graph</a>
            </div>
        </div>

        <a href="homepage.jsp" class="home-icon">
            <i class="fa fa-home"></i>
        </a>
        
        <a class="logout" href="logout.jsp">LOGOUT</a>

        <div class="content">
            <h1>WELCOME TO SECURITY TRACKER SYSTEM</h1>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="format.js"></script>
    </body>

</body>
</html>
