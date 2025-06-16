<%-- sidebar.jsp --%>
<link rel="stylesheet" href="guardManagementStyling.css">
<div id="sidebar" class="sidebar">
    <div class="logo"><img src="img/umt_logo2.png" alt="UMT"></div>
    <div class="sidebar-section" onclick="toggleSubmenu('guard')">Guard Task</div>
    <div id="guard-submenu" class="submenu">
        <a href="visitorRegistration.jsp">Visitor Registration</a>
        <a href="checkin.jsp">Patrolling</a>
        <a href="manage_patrolshift.jsp">Schedule</a>
    </div>
    <div class="sidebar-section" onclick="toggleSubmenu('management')">Management Task</div>
    <div id="management-submenu" class="submenu">
        <a href="manageStaff.jsp">Manage Staff</a>
        <a href="manage_patrolshift.jsp">Manage Schedule</a>
        <a href="manage_location.jsp">Manage Location</a>
    </div>
    <div class="sidebar-section" onclick="toggleSubmenu('visitor')">Visitor Report</div>
    <div id="visitor-submenu" class="submenu">
        <a href="visitorReport.jsp">VisitorReport</a>
        <a href="visitor">visitor data</a>
    </div>
    <div class="sidebar-section" onclick="toggleSubmenu('report')">Report</div>
    <div id="report-submenu" class="submenu">
        <a href="#">Table</a>
        <a href="#">Graph</a>
    </div>
</div>