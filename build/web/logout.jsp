<%-- 
    Document   : logout
    Created on : 15 Jun 2025, 4:33:44 pm
    Author     : khair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Custom Styling -->
    <link rel="stylesheet" href="guardManagementStyling.css">
</head>

<body class="logout-body">

<script>
            let seconds = 5;
            function countdown() {
                const countdownElement = document.getElementById('countdown');
                countdownElement.innerText = seconds;
                if (seconds === 0) {
                    window.location.href = 'Login.html';
                } else {
                    seconds--;
                    setTimeout(countdown, 1000);
                }
            }
            window.onload = countdown;
        </script>

<div class="logout-box">
    <i class="fas fa-sign-out-alt logout-icon"></i>
    <h2 class="logout-title">You’ve been logged out</h2>
    <p class="logout-message">Redirecting to login page in <span id="countdown" class="countdown-text">5</span> seconds...</p>
    <p class="logout-message">If not redirected, <a href="Login.html" class="logout-link">click here</a>.</p>
</div>

</body>
</html>
