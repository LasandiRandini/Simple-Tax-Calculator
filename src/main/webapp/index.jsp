<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body class="p-3 m-0 border-0 bd-example m-0 border-0">

<nav class="navbar navbar-expand-lg "style="background-color: #2ecc71; "data-bs-theme="dark">
    <div class="container-fluid">
        <a class="navbar-brand"><b>TAX</b> Calculator</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0" style="display: flex;justify-content: space-between;">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="hello-servlet?action=view">History</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div><p></p></div>
<div class="row align-items-md-stretch">
    <div class="col-md-6">
        <div class="h-100 p-5  rounded-3 custom-border-radius-green"style="background-color: #2ecc71; color:snow">
            <h2>Your Salary:</h2>
            <form id="salaryForm" method="post" action="hello-servlet">
                <input id="salaryInput" class="form-control" type="text" placeholder="Salary input here..." aria-label="readonly input example" name="salary"><br>
                <small id="salaryError" style="color: white"></small><br><br>
                <input class="btn btn-outline-light" type="submit" value="Submit">
            </form>

        </div>
    </div>

    <div class="col-md-6">
        <div class="h-100 p-5 bg-body-tertiary border rounded-3 custom-border-radius-white">
            <h2>TAX Calculation</h2>
            <p>
            <div class="input-group mb-3">
                <label class="input-group-text">Gross Salary</label>
                <span class="input-group-text">Rs.</span>
                <input id="grossSalary" type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)"readonly>
            </div>
            <div class="input-group mb-3">
                <label class="input-group-text">Tax</label>
                <span class="input-group-text">Rs.</span>
                <input id="tax" type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)"readonly>
            </div>
            <div class="input-group mb-3">
                <label class="input-group-text">EPF</label>
                <span class="input-group-text">Rs.</span>
                <input id="epf" type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)"readonly>
            </div>
            <div class="input-group mb-3">
                <label class="input-group-text">ETF</label>
                <span class="input-group-text">Rs.</span>
                <input id="etf" type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)"readonly>
            </div>
            <div class="input-group mb-3">
                <label class="input-group-text">Net Salary</label>
                <span class="input-group-text">Rs.</span>
                <input id="net_salary" type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)"readonly>
            </div>
            </p>
        </div>
    </div>
</div>
</body>
</html>

<script>
    $(document).ready(function () {
        $("#salaryForm").submit(function (event) {
            event.preventDefault(); // Prevent the default form submission
            submitForm();
        });
    });

    function submitForm() {
        var salary = $("input[name='salary']").val();

        $.ajax({
            type: "POST",
            url: "hello-servlet",
            data: { salary: salary },
            dataType: "json",
            success: function (data) {
                // Update the relevant parts of your HTML with the received data
                $("#grossSalary").val(data.grossSalary);
                $("#tax").val(data.tax);
                $("#epf").val(data.epf);
                $("#etf").val(data.etf);
                $("#net_salary").val(data.net_salary);
            },
            error: function () {
                alert("Error submitting the form");
            }
        });
    }
</script>

<script>
    document.getElementById("salaryInput").addEventListener("keypress", function (event) {
        // Check if the key pressed is a number or a dot (for decimal numbers)
        if (!/[\d.]/.test(String.fromCharCode(event.keyCode))) {
            event.preventDefault();
            document.getElementById("salaryError").innerText = "Only positive numbers are allowed.";
        } else {
            document.getElementById("salaryError").innerText = "";
        }
    });
</script>
