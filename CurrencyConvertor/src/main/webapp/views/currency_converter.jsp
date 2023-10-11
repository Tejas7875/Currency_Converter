<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="currencyConverter.title"/></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
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

        .container {
            background-color: rgba(255, 255, 255, 0.9); /* 0.8 is the alpha (transparency) value */
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }

        .container h1 {
            color: #343a40;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

 <div class="language-dropdown" style="position: absolute; top: 20px; right: 20px;">
     <form action="changeLang" method="post">
         <select name="lang">
             <option value="en" <c:if test="${pageContext.request.locale.language == 'en'}">selected</c:if>>English</option>
             <option value="fr" <c:if test="${pageContext.request.locale.language == 'fr'}">selected</c:if>>Français</option>
             <option value="sp" <c:if test="${pageContext.request.locale.language == 'sp'}">selected</c:if>>Spanish</option>
             <option value="lt" <c:if test="${pageContext.request.locale.language == 'lt'}">selected</c:if>>Latin</option>

             <!-- Add more language options here -->
         </select>
         <input type="hidden" id="selectedLanguage" name="selectedLanguage">
         <button type="submit">Change Language</button>
     </form>
 </div>



<div class="container mt-5">
    <h1><spring:message code="currencyConverter.title"/></h1>
    <form action="convert" method="get">
        <div class="form-group">
            <label for="fromCurrency"><spring:message code="currencyConverter.fromCurrency"/></label>
            <select class="form-control" name="from" id="fromCurrency">
                <option value="USD">USD (United States Dollar)</option>
                <option value="EUR">EUR (Euro)</option>
                <option value="JPY">JPY (Japanese Yen)</option>
                <option value="GBP">GBP (British Pound Sterling)</option>
                <option value="AUD">AUD (Australian Dollar)</option>
                <option value="CAD">CAD (Canadian Dollar)</option>
                <option value="CHF">CHF (Swiss Franc)</option>
                <option value="CNY">CNY (Chinese Yuan)</option>
                <option value="SEK">SEK (Swedish Krona)</option>
                <option value="NZD">NZD (New Zealand Dollar)</option>
                <option value="SGD">SGD (Singapore Dollar)</option>
                <option value="HKD">HKD (Hong Kong Dollar)</option>
                <option value="NOK">NOK (Norwegian Krone)</option>
                <option value="KRW">KRW (South Korean Won)</option>
                <option value="INR">INR (Indian Rupee)</option>
                <option value="BRL">BRL (Brazilian Real)</option>
                <option value="ZAR">ZAR (South African Rand)</option>
                <option value="RUB">RUB (Russian Ruble)</option>                <!-- Add more currency options here -->
            </select>
        </div>
        <div class="form-group">
            <label for="toCurrency"><spring:message code="currencyConverter.toCurrency"/></label>
            <select class="form-control" name="to" id="toCurrency">
                <option value="USD">USD (United States Dollar)</option>
                <option value="EUR">EUR (Euro)</option>
                <option value="JPY">JPY (Japanese Yen)</option>
                <option value="GBP">GBP (British Pound Sterling)</option>
                <option value="AUD">AUD (Australian Dollar)</option>
                <option value="CAD">CAD (Canadian Dollar)</option>
                <option value="CHF">CHF (Swiss Franc)</option>
                <option value="CNY">CNY (Chinese Yuan)</option>
                <option value="SEK">SEK (Swedish Krona)</option>
                <option value="NZD">NZD (New Zealand Dollar)</option>
                <option value="SGD">SGD (Singapore Dollar)</option>
                <option value="HKD">HKD (Hong Kong Dollar)</option>
                <option value="NOK">NOK (Norwegian Krone)</option>
                <option value="KRW">KRW (South Korean Won)</option>
                <option value="INR">INR (Indian Rupee)</option>
                <option value="BRL">BRL (Brazilian Real)</option>
                <option value="ZAR">ZAR (South African Rand)</option>
                <option value="RUB">RUB (Russian Ruble)</option>                <!-- Add more currency options here -->
            </select>
        </div>
        <div class="form-group">
            <label for="amount"><spring:message code="currencyConverter.amount"/></label>
            <input type="number" class="form-control" name="amount" id="amount" required>
        </div>
    <button type="submit" class="btn btn-primary btn-block"><spring:message code="currencyConverter.convert"/></button>
    </form>
    <br>
    <div>
        <button type="button" class="btn btn-secondary btn-block" onclick="viewHistoricalData()"><spring:message code="currencyConverter.viewHistoricalData"/></button>
    </div>
    <br>
    <div>
        <button type="button" class="btn btn-secondary btn-block" onclick="viewTransactionHistory()"><spring:message code="currencyConverter.viewTransactionHistory"/></button>
    </div>

   <c:if test="${not empty fromCurrency}">
               <h2><spring:message code="currencyConverter.resultTitle"/></h2>
               <p><spring:message code="currencyConverter.fromCurrency"/>: ${fromCurrency}</p>
               <p><spring:message code="currencyConverter.toCurrency"/>: ${toCurrency}</p>
               <p><spring:message code="currencyConverter.amount"/>: ${amount}</p>
               <p><spring:message code="currencyConverter.convertedAmount"/>: ${convertedAmount}</p>
           </c:if>
</div>
<script src="js/bootstrap.min.js"></script>
<script>

   function changeLanguage() {
           // Get the selected language value from the dropdown
           var selectedLanguage = document.querySelector(".language-dropdown select").value;

           // Set the hidden input field value
           document.getElementById("selectedLanguage").value = selectedLanguage;
            console.log("Selected language: " + selectedLanguage);


                document.querySelector(".language-dropdown form").submit();


           // Redirect to the current page with the selected language parameter
           window.location.href = "?lang=" + selectedLanguage;
       }

    function viewHistoricalData() {
        // Redirect to the date.jsp page
        window.location.href = "date";
    }

   function viewTransactionHistory() {
       // Get the selected language value from the dropdown
       var selectedLanguage = document.querySelector(".language-dropdown select").value;

      console.log("Selected language: " + selectedLanguage);


       // Construct the URL with the selected language parameter
       var url = "transactionRecords?lang=" + selectedLanguage;
        console.log("URL: " + url);

       // Redirect to the URL
       window.location.href = url;
   }


</script>



    <script src="js/bootstrap.min.js"></script>

</body>
</html>
