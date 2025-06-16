<%-- sidebar.jsp --%>
<link rel="stylesheet" href="guardManagementStyling.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<div class="sidebar">
    <div class="logo" style="text-align: center; padding: 1rem 0;">
        <img src="img/umt_logo2.png" alt="UMT" style="width: 100px;">
    </div>

    <a class="nav-link" href="#" onclick="toggleSubmenu('guard')"><i class="fas fa-user-shield"></i> Guard Task</a>
    <div id="guard-submenu" class="submenu">
        <a href="visitorRegistration.jsp">Visitor Registration</a>
        <a href="checkin.jsp">Patrolling</a>
        <a href="manage_patrolshift.jsp">Schedule</a>
    </div>

    <a class="nav-link" href="#" onclick="toggleSubmenu('management')"><i class="fas fa-cogs"></i> Management Task</a>
    <div id="management-submenu" class="submenu">
        <a href="manageStaff.jsp">Manage Staff</a>
        <a href="manage_patrolshift.jsp">Manage Schedule</a>
        <a href="manage_location.jsp">Manage Location</a>
    </div>

    <a class="nav-link" href="#" onclick="toggleSubmenu('visitor')"><i class="fas fa-id-badge"></i> Visitor Report</a>
    <div id="visitor-submenu" class="submenu">
        <a href="visitorReport.jsp">Visitor Report</a>
        <a href="#">Visitor Data</a>
    </div>

    <%-- <a class="nav-link" href="#" onclick="toggleSubmenu('report')"><i class="fas fa-chart-bar"></i> Report</a>
    <div id="report-submenu" class="submenu">
        <a href="#">Table</a>
        <a href="#">Graph</a>
    </div> --%> 
</div>
