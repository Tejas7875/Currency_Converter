<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Currency Exchange Rates</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style>
        h2 {
            text-align: center;
            padding: 10px; /* Add some padding to the title card */
            background-color: white; /* White background color */
        }

        .table-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 80vh; /* Adjust the minimum height as needed */
            background-color: white; /* White background color */
            padding: 20px; /* Add some padding to the table card */
            border-radius: 10px; /* Add border radius for card effect */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add shadow for card effect */
        }

        body {
            background-image: url('https://c1.wallpaperflare.com/path/487/672/896/bitcoin-blockchain-cryptocurrency-crypto-exchange-technology-b31f9757de42f7b4760a8ae4846defda.jpg');
            background-size: cover; /* Adjust this as needed */
            background-repeat: no-repeat;
            background-attachment: fixed; /* Fixed to prevent scrolling */
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0; /* Reset body margin */
            padding: 0; /* Reset body padding */
        }

        table {
            margin-top: 20px; /* Add margin to the top of the table */
        }
    </style>
</head>
<body>
<div class="table-container"> <!-- Container to center the table and h2 -->

    <h2>Exchange Rates at "${customExchangeRates.last_updated_at}"</h2>
    <h2> 1 Doller = <h2>

    <table border="1">
        <tr>
            <th>Currency Code</th>
            <th>Value</th>
        </tr>
        <c:forEach var="entry" items="${customExchangeRates.exchangeRates}">
            <tr>
                <td>${entry.key}</td>
                <td>${entry.value}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
