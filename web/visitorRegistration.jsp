<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Visitor Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="guardManagementStyling.css">
</head>
<body>
    <div id="menu-btn" onclick="toggleSidebar()">&#9776;</div>
    <%@ include file="sidebar.jsp" %>
    <%@ include file="header.jsp" %>

    <div class="content container mt-5">
        <div class="card shadow-sm border-0">
            <div class="card-body">
                <h2 class="card-title mb-4 text-center">Visitor Registration</h2>
                <form action="VisitorRegistrationServlet" method="post" class="needs-validation" novalidate>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="Name" id="name" placeholder="Ali bin Abu" required>
                            <div class="invalid-feedback">Please enter your full name.</div>
                        </div>
                        <div class="col-md-6">
                            <label for="IC" class="form-label">IC Number</label>
                            <input type="text" class="form-control form-control-sm w-75" name="IC" id="IC" pattern="^\d{6}-\d{2}-\d{4}$" placeholder="991122-01-1234" required>
                            <div class="invalid-feedback">Please enter a valid IC number (e.g. 991122-01-1234).</div>
                        </div>

                        <div class="col-12">
                            <label for="address" class="form-label">Home Address</label>
                            <textarea class="form-control" name="Address" id="address" rows="2" placeholder="123, Jalan UMT, Terengganu" required></textarea>
                            <div class="invalid-feedback">Please enter your address.</div>
                        </div>

                        <div class="col-12">
                            <label for="purpose" class="form-label">Purpose of Visit</label>
                            <select class="form-select" name="Purpose" id="purposeSelect" required onchange="toggleOtherPurpose(this)">
                                <option value="" selected disabled>-- Select Purpose --</option>
                                <option value="Daftar Pelajar">Daftar Pelajar</option>
                                <option value="Perjumpaan Dengan Pihak Universiti">Perjumpaan Dengan Pihak Universiti</option>
                                <option value="Pergi ke Kompleks Siswa">Pergi ke Kompleks Siswa</option>
                                <option value="Perjumpaan Dengan Tenaga Pengajar">Perjumpaan Dengan Tenaga Pengajar</option>
                                <option value="Other">Other</option>
                            </select>
                            <div class="invalid-feedback">Please select a purpose.</div>

                            <div id="otherPurposeContainer" class="mt-2" style="display:none;">
                                <label for="otherPurpose" class="form-label">Please specify:</label>
                                <input type="text" class="form-control" id="otherPurpose" name="PurposeOther">
                                <div class="invalid-feedback">Please enter your purpose.</div>
                            </div>
                        </div>

                        <div class="col-12 text-end">
                            <button type="reset" class="btn btn-secondary me-2">Reset</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="HamburgerButton.js"></script>

    <script>
        // Bootstrap validation
        (function () {
            'use strict';
            const forms = document.querySelectorAll('.needs-validation');
            Array.from(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();

        // Show/hide custom purpose input
        function toggleOtherPurpose(select) {
            const otherContainer = document.getElementById('otherPurposeContainer');
            const otherInput = document.getElementById('otherPurpose');

            if (select.value === "Other") {
                otherContainer.style.display = "block";
                otherInput.setAttribute("required", "required");
            } else {
                otherContainer.style.display = "none";
                otherInput.removeAttribute("required");
                otherInput.value = ""; // Clear previous text
            }
        }
    </script>
</body>
</html>
