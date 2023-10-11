<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <title><spring:message code="currencyConverter.transactionRecords"/></title>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style>
        /* Center the content vertically and horizontally */
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Adjust the height as needed */
            margin: 0;
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

        /* Style your table here */
        table {
            border-collapse: collapse;
            width: 80%; /* Adjust the width as needed */
                        background-color: white;

        }

          h2 {
                    background-color: white;
                    padding: 10px;
                    border-radius: 5px;
                }


        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Transaction Records</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th><spring:message code="currencyConverter.fromCurrency"/>: ${fromCurrency}</th>
            <th><spring:message code="currencyConverter.toCurrency"/>: ${toCurrency}</th>
            <th><spring:message code="currencyConverter.amount"/>: ${amount}</th>
            <th><spring:message code="currencyConverter.convertedAmount"/>: ${convertedAmount}</th>
        </tr>
        <c:forEach var="record" items="${transactionRecords}">
            <tr>
                <td>${record.id}</td>
                <td>${record.fromCurrency}</td>
                <td>${record.toCurrency}</td>
                <td>${record.amount}</td>
                <td>${record.convertedAmount}</td> <!-- Display the convertedAmount -->
            </tr>
        </c:forEach>
    </table>
</body>
</html>
