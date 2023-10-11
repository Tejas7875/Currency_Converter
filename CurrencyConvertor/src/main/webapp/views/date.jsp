<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter Date</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        /* Your CSS styles here */
        body {
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }
        body {
            background-image: url('https://c1.wallpaperflare.com/path/487/672/896/bitcoin-blockchain-cryptocurrency-crypto-exchange-technology-b31f9757de42f7b4760a8ae4846defda.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1>Enter Date</h1>
        <form action="processDate" method="post">
            <div class="form-group">
                <label for="date">Date (YYYY-MM-DD):</label>
                <input type="text" class="form-control" name="date" id="date" placeholder="YYYY-MM-DD" required>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </form>
    </div>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
