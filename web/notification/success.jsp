<%-- 
    Document   : successfull
    Created on : 4 May 2025, 12:23:24 am
    Author     : khair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
    <script>
        let seconds = 5;

        function countdown() {
            const countdownElement = document.getElementById('countdown');
            countdownElement.innerText = seconds;

            if (seconds === 0) {
                window.location.href = '../Login.html';
            } else {
                seconds--;
                setTimeout(countdown, 1000);
            }
        }

        window.onload = countdown;
    </script>
</head>
<body>
    <h2>Registration Successful!</h2>
    <p>You will be redirected to the home page in <span id="countdown">5</span> seconds...</p>
    <p>If you are not redirected automatically, <a href="../Login.html">click here</a>.</p>
</body>
</html>
