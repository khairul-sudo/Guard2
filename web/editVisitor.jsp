<%@page import="dao.visitorDAO"%>
<%@page import="user.Visitor"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    visitorDAO dao = new visitorDAO();
    Visitor visitor = dao.selectVisitor(id);
    String currentPurpose = visitor.getPurpose();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Visitor</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h1 class="mb-4">Edit Visitor</h1>

    <form action="<%= request.getContextPath() %>/updateVisitorServlet" method="post" class="needs-validation" novalidate>
        <input type="hidden" name="id" value="<%= visitor.getId() %>">

        <div class="mb-3">
            <label for="name" class="form-label">Full Name</label>
            <input type="text" class="form-control" id="name" name="Name" value="<%= visitor.getName() %>" required>
            <div class="invalid-feedback">Please enter full name.</div>
        </div>

        <div class="mb-3">
            <label for="ic" class="form-label">IC Number</label>
            <input type="text" class="form-control" id="ic" name="IC" value="<%= visitor.getIc() %>" pattern="^\d{6}-\d{2}-\d{4}$" required>
            <div class="invalid-feedback">Please enter a valid IC number (e.g. 991122-01-1234).</div>
        </div>

        <div class="mb-3">
            <label for="address" class="form-label">Address</label>
            <input type="text" class="form-control" id="address" name="Address" value="<%= visitor.getAddress() %>" required>
            <div class="invalid-feedback">Please enter address.</div>
        </div>

        <div class="mb-3">
            <label for="purpose" class="form-label">Purpose</label>
            <select class="form-select" id="purposeSelect" name="Purpose" required onchange="toggleOtherPurpose(this)">
                <option value="" disabled>Select purpose</option>
                <option value="Daftar Pelajar" <%= "Daftar Pelajar".equals(currentPurpose) ? "selected" : "" %>>Daftar Pelajar</option>
                <option value="Perjumpaan Dengan Pihak Universiti" <%= "Perjumpaan Dengan Pihak Universiti".equals(currentPurpose) ? "selected" : "" %>>Perjumpaan Dengan Pihak Universiti</option>
                <option value="Pergi ke Kompleks Siswa" <%= "Pergi ke Kompleks Siswa".equals(currentPurpose) ? "selected" : "" %>>Pergi ke Kompleks Siswa</option>
                <option value="Perjumpaan Dengan Tenaga Pengajar" <%= "Perjumpaan Dengan Tenaga Pengajar".equals(currentPurpose) ? "selected" : "" %>>Perjumpaan Dengan Tenaga Pengajar</option>
                <option value="Other" <%= (
                    !"Daftar Pelajar".equals(currentPurpose) &&
                    !"Perjumpaan Dengan Pihak Universiti".equals(currentPurpose) &&
                    !"Pergi ke Kompleks Siswa".equals(currentPurpose) &&
                    !"Perjumpaan Dengan Tenaga Pengajar".equals(currentPurpose)
                ) ? "selected" : "" %>>Other</option>
            </select>
            <div class="invalid-feedback">Please select purpose.</div>

            <div id="otherPurposeContainer" class="mt-2" style="<%= (
                    !"Daftar Pelajar".equals(currentPurpose) &&
                    !"Perjumpaan Dengan Pihak Universiti".equals(currentPurpose) &&
                    !"Pergi ke Kompleks Siswa".equals(currentPurpose) &&
                    !"Perjumpaan Dengan Tenaga Pengajar".equals(currentPurpose)
                ) ? "display:block;" : "display:none;" %>">
                <label for="otherPurpose" class="form-label">Specify Other Purpose</label>
                <input type="text" class="form-control" id="otherPurpose" name="PurposeOther"
                       value="<%= (
                            !"Daftar Pelajar".equals(currentPurpose) &&
                            !"Perjumpaan Dengan Pihak Universiti".equals(currentPurpose) &&
                            !"Pergi ke Kompleks Siswa".equals(currentPurpose) &&
                            !"Perjumpaan Dengan Tenaga Pengajar".equals(currentPurpose)
                        ) ? currentPurpose : "" %>">
            </div>
        </div>

        <div class="d-flex justify-content-between">
            <a href="<%= request.getContextPath() %>/visitorReport.jsp" class="btn btn-secondary">Cancel</a>
            <button type="submit" class="btn btn-primary">Update</button>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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

        // Show/hide other purpose input
        function toggleOtherPurpose(select) {
            const otherContainer = document.getElementById('otherPurposeContainer');
            const otherInput = document.getElementById('otherPurpose');

            if (select.value === "Other") {
                otherContainer.style.display = "block";
                otherInput.setAttribute("required", "required");
            } else {
                otherContainer.style.display = "none";
                otherInput.removeAttribute("required");
                otherInput.value = "";
            }
        }
    </script>
</body>
</html>
