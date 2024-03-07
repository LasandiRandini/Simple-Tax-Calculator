<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.service.TaxCalculationResult" %>

<html>
<head>
    <title>Tax Calculation History</title>
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
<div class="container-fluid">
    <h1 class="mt-4">Tax Calculation History</h1>

    <!-- <button id="clearHistoryButton">Clear History</button> -->

    <% if (request.getAttribute("taxCalcEntries") != null) {
        List<TaxCalculationResult> taxCalcEntries = (List<TaxCalculationResult>) request.getAttribute("taxCalcEntries");
        if (!taxCalcEntries.isEmpty()) { %>
    <div class="table-responsive">
        <table class="table table-bordered mt-4">
            <thead>
            <tr>
                <th>Salary</th>
                <th>Tax</th>
                <th>EPF</th>
                <th>ETF</th>
                <th>Net Salary</th>
            </tr>
            </thead>
            <tbody>
            <% for (TaxCalculationResult taxCalcEntry : taxCalcEntries) { %>
            <tr>
                <td><%= taxCalcEntry.getGrossSalary() %></td>
                <td><%= taxCalcEntry.getTax() %></td>
                <td><%= taxCalcEntry.getEpf() %></td>
                <td><%= taxCalcEntry.getEtf() %></td>
                <td><%= taxCalcEntry.getNet_salary() %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% }
    } %>
</div>
</body>
</html>

<%--<script>--%>
<%--    $("#clearHistoryButton").click(function () {--%>
<%--        clearHistory();--%>
<%--    });--%>

<%--    function clearHistory() {--%>
<%--        $.ajax({--%>
<%--            type: "DELETE",--%>
<%--            url: "hello-servlet",--%>
<%--            success: function () {--%>
<%--                // Optionally handle the success response--%>
<%--                console.log("History cleared successfully");--%>
<%--            },--%>
<%--            error: function () {--%>
<%--                console.error("Failed to clear history");--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
