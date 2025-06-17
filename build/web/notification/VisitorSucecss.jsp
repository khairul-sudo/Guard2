<%-- 
    Document   : successfull
    Created on : 4 May 2025, 12:23:24 am
    Author     : khair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Custom Styling -->
    <link rel="stylesheet" href="../guardManagementStyling.css">

    <script>
        let seconds = 5;

        function countdown() {
            const countdownElement = document.getElementById('countdown');
            countdownElement.innerText = seconds;

            if (seconds === 0) {
                window.location.href = '../homepage.jsp';
            } else {
                seconds--;
                setTimeout(countdown, 1000);
            }
        }

        window.onload = countdown;
    </script>
</head>

<body class="logout-body">
    <div class="logout-box">
        <i class="fas fa-check-circle logout-icon" style="color: #27ae60;"></i>
        <h2 class="logout-title">Registration Successful!</h2>
        <p class="logout-message">
            Redirecting to the home page in <span id="countdown" class="countdown-text">5</span> seconds...
        </p>
        <p class="logout-message">
            If not redirected, <a href="../homepage.jsp" class="logout-link">click here</a>.
        </p>
    </div>
</body>
</html>
