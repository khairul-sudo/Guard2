<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="guardManagementStyling.css">
</head>
<body class="background-Register">
    <div class="form-container">
        <h2>Register</h2>
        <form action="RegisterServlet" method="post" onsubmit="return validateForm()">
            <label>Name:</label>
            <input type="text" name="name" required value="${param.name}">
            <label>Address:</label>
            <input type="text" name="address" required value="${param.address}">
            <label>IC Number:</label>
            <input type="text" name="ICnum" required value="${param.ICnum}" id="icNumberInput" oninput="validateICNumber()">
            <span id="icNumberError" class="error-message">${requestScope.icNumberError}</span><br>
            <label>Role:</label>
            <select name="roles" required>
                <option value="Administrator" ${param.roles == 'Administrator' ? 'selected' : ''}>Administrator</option>
                <option value="Staff" ${param.roles == 'Staff' ? 'selected' : ''}>Staff</option>
            </select>
            <label>Email:</label>
            <input type="email" name="email" required value="${param.email}">
            <label>Contact:</label>
            <input type="text" name="contact" required value="${param.contact}">
            <label>Password:</label>
            <input type="password" name="password" required>
            <input type="submit" value="Register">
        </form>
        <a href="Login.html">Back to Login</a>
    </div>

</body>
</html>

<script>
        function validateICNumber() {
            const icNumberInput = document.getElementById('icNumberInput');
            const icNumber = icNumberInput.value;
            const errorSpan = document.getElementById('icNumberError');
            const isNumeric = /^\d+$/.test(icNumber);

            if (!isNumeric) {
                errorSpan.textContent = 'IC Number must contain only numbers.';
                return false;
            } else {
                errorSpan.textContent = '';
                return true;
            }
        }

        function validateForm() {
            return validateICNumber(); // Add other validation functions here if needed
        }
    </script>