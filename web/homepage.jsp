<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h2 class="mb-4">Admin Dashboard</h2>

        <!-- Cards -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-shopping-cart"></i> New Orders</h5>
                        <p class="card-text fs-4">150</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-success mb-3">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-chart-line"></i> Bounce Rate</h5>
                        <p class="card-text fs-4">53%</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-user-plus"></i> User Registrations</h5>
                        <p class="card-text fs-4">44</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-white bg-danger mb-3">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-users"></i> Unique Visitors</h5>
                        <p class="card-text fs-4">65</p>
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
                labels: ['Chrome', 'IE', 'Firefox', 'Safari', 'Opera', 'Navigator'],
                datasets: [{
                    label: 'Browser Usage',
                    data: [40, 15, 20, 10, 10, 5],
                    backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#c9cbcf']
                }]
            }
        });

        const barChart = new Chart(document.getElementById('barChart'), {
            type: 'bar',
            data: {
                labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                datasets: [
                    {
                        label: 'Electronics',
                        backgroundColor: '#FF6384',
                        data: [65, 59, 80, 81, 56, 55, 40]
                    },
                    {
                        label: 'Fashion',
                        backgroundColor: '#4BC0C0',
                        data: [28, 48, 40, 19, 86, 27, 90]
                    },
                    {
                        label: 'Foods',
                        backgroundColor: '#36A2EB',
                        data: [40, 60, 50, 30, 70, 60, 75]
                    }
                ]
            }
        });
    </script>
</body>
</html>
