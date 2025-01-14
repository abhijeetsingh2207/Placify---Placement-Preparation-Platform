<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Result</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
</head>
<style>
    /* General Body Styling */
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: #fff;
        margin: 0;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
    }

    /* Main Container */
    .container {
        background: #ffffff;
        color: #333;
        border-radius: 15px;
        padding: 30px 40px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        text-align: center;
        animation: slideDown 0.8s ease-out;
        max-width: 600px;
        width: 90%;
    }

    /* Page Title */
    h2 {
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 20px;
        color: #6a11cb;
        position: relative;
    }

    h2::after {
        content: '';
        display: block;
        width: 80px;
        height: 4px;
        background: #2575fc;
        margin: 10px auto 0;
        border-radius: 2px;
    }

    /* Score Display */
    p {
        font-size: 1.2rem;
        margin-bottom: 25px;
        font-weight: 500;
    }

    p strong {
        font-size: 1.5rem;
        color: #2575fc;
    }

    /* Back Button */
    .btn {
        display: inline-block;
        font-size: 1.2rem;
        font-weight: bold;
        padding: 12px 25px;
        background: linear-gradient(135deg, #2575fc, #6a11cb);
        border: none;
        border-radius: 8px;
        color: #fff;
        text-decoration: none;
        transition: all 0.3s ease-in-out;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .btn:hover {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        transform: translateY(-2px);
    }

    .btn:active {
        transform: translateY(2px);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    /* Animation */
    @keyframes slideDown {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .container {
            padding: 20px 30px;
        }

        h2 {
            font-size: 2rem;
        }

        p {
            font-size: 1rem;
        }

        .btn {
            font-size: 1rem;
            padding: 10px 20px;
        }
    }
    .loader-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
        }

        /* Loader Animation */
        .loader {
            border: 8px solid #f3f3f3;
            border-top: 8px solid #007bff;
            border-radius: 50%;
            width: 80px;
            height: 80px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        /* Result Card */
        .result-container {
            display: none;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .result-card {
            background: linear-gradient(135deg, #6c757d, #343a40);
            color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .result-card h2 {
            font-size: 2.5rem;
        }

        .result-card p {
            font-size: 1.5rem;
            margin: 15px 0;
        }

        .result-card a {
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .result-card a:hover {
            background-color: #0056b3;
        }
    
</style>

<body>
    <div class="container mt-5">
        <h2>Quiz Result</h2>
        <p>Your Score: <strong><%= request.getAttribute("score") %></strong></p>
        <a href="student_home_page.jsp" class="btn btn-primary">Back to Home</a>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
