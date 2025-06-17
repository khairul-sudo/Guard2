<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.* , DB.DBConnection"%>
<%@ page import="java.util.LinkedHashMap" %>
<%
    int staffCount = 0, visitorCount = 0, checkpointCount = 0, userCount = 0;
    try {
        Connection con = DBConnection.getConnection();
        Statement stmt = con.createStatement();

        ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM guard");
        if (rs1.next()) {
            staffCount = rs1.getInt(1);
        }

        ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) FROM visitor");
        if (rs2.next()) {
            visitorCount = rs2.getInt(1);
        }

        ResultSet rs3 = stmt.executeQuery("SELECT COUNT(*) FROM user");
        if (rs3.next()) {
            userCount = rs3.getInt(1);
        }

        ResultSet rs4 = stmt.executeQuery("SELECT COUNT(*) FROM location");
        if (rs4.next()) {
            checkpointCount = rs4.getInt(1);
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<%
    LinkedHashMap<String, Integer> monthlyVisitorData = new LinkedHashMap<>();
    try {
        Connection con = DBConnection.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(
                "SELECT DATE_FORMAT(visit_datetime, '%M') AS month, COUNT(*) AS total "
                + "FROM visitor WHERE visit_datetime IS NOT NULL "
                + "GROUP BY MONTH(visit_datetime)"
        );

        while (rs.next()) {
            monthlyVisitorData.put(rs.getString("month"), rs.getInt("total"));
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<%
    int adminCount = 0, guardCount = 0;
    try {
        Connection con = DBConnection.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT roles, COUNT(*) AS total FROM user GROUP BY roles");

        while (rs.next()) {
            String role = rs.getString("roles");
            if ("Administrator".equalsIgnoreCase(role)) {
                adminCount = rs.getInt("total");
            } else if ("Guard".equalsIgnoreCase(role)) {
                guardCount = rs.getInt("total");
            }
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Guard Management System</title>

        <!-- Bootstrap CSS & FontAwesome -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

        <!-- Custom CSS -->
        <link rel="stylesheet" href="guardManagementStyling.css">
    </head>
    <body>

        <!-- Sidebar toggle and includes -->
        <div id="menu-btn" onclick="toggleSidebar()">&#9776;</div>
        <%@ include file="sidebar.jsp" %>
        <%@ include file="header.jsp" %>

        <!-- Main Content -->
        <div class="content p-4">
            <h2 class="mb-4">Data Overview</h2>

            <!-- Cards -->
            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-user-tie"></i> Total Staff</h5>
                            <p class="card-text fs-4"><%= staffCount%></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-id-badge"></i> Total Visitor</h5>
                            <p class="card-text fs-4"><%= visitorCount%></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-warning mb-3">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-user-plus"></i> New User Registrations</h5>
                            <p class="card-text fs-4"><%= userCount%></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card text-white bg-danger mb-3">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-route"></i> Total Daily Checkpoint</h5>
                            <p class="card-text fs-4"><%= checkpointCount%></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Charts -->
            <div class="row">
                <div class="col-md-6">
                    <canvas id="doughnutChart"></canvas>
                </div>
                <div class="col-md-6">
                    <canvas id="barChart"></canvas>
                </div>
            </div>
        </div>

        <!-- Bootstrap & Chart.js Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="HamburgerButton.js"></script>

        <!-- Chart JS Setup -->
        <script>
            const doughnutChart = new Chart(document.getElementById('doughnutChart'), {
            type: 'doughnut',
                    data: {
                    labels: ['Admin', 'Guard'],
                            datasets: [{
                            label: 'User Roles',
                                    data: [<%= adminCount%>, <%= guardCount%>],
                                    backgroundColor: ['#36A2EB', '#FF6384']
                            }]
                    },
                    options: {
                    responsive: true,
                            plugins: {
                            legend: {
                            display: true,
                                    position: 'top'
                            }
                            }
                    }
            });
            const barChart = new Chart(document.getElementById('barChart'), {
            type: 'bar',
                    data: {
                    labels: [
            <% for (String month : monthlyVisitorData.keySet()) {%>
                    "<%= month%>",
            <% } %>
                    ],
                            datasets: [{
                            label: 'Visitors Registered',
                                    backgroundColor: '#36A2EB',
                                    data: [
            <% for (int count : monthlyVisitorData.values()) {%>
            <%= count%>,
            <% }%>
                                    ]
                            }]
                    },
                    options: {
                    responsive: true,
                            plugins: {
                            legend: {
                            display: true
                            }
                            },
                            scales: {
                            y: {
                            beginAtZero: false,
                                    min: 1,
                                    max: 10,
                                    ticks: {
                                    stepSize: 1
                                    }
                            }
                            }
                    }
            });
        </script>

    </body>
</html>
