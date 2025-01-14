<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Section</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        /* General Body Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        /* Container Styling */
        .container {
            background: #ffffff;
            color: #333;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1.2s ease-in-out;
            max-width: 600px;
            width: 100%;
        }

        /* Heading Styling */
        h2 {
            text-align: center;
            font-size: 2.4rem;
            font-weight: bold;
            color: #4a4e69;
            margin-bottom: 20px;
            position: relative;
        }

        h2::after {
            content: '';
            width: 80px;
            height: 3px;
            background: #6a11cb;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            bottom: -10px;
            border-radius: 5px;
        }

        /* Form Styling */
        form {
            margin-top: 20px;
        }

        label {
            font-size: 1rem;
            font-weight: 600;
            color: #6a11cb;
        }

        input[type="text"] {
            border: 2px solid #6a11cb;
            border-radius: 8px;
            padding: 10px 15px;
            font-size: 1rem;
            transition: all 0.3s ease-in-out;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #2575fc;
            box-shadow: 0px 0px 10px rgba(38, 99, 255, 0.5);
        }

        /* Button Styling */
        button {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            border: none;
            color: white;
            font-size: 1rem;
            font-weight: bold;
            padding: 12px 20px;
            width: 100%;
            border-radius: 8px;
            box-shadow: 0px 5px 15px rgba(38, 99, 255, 0.4);
            transition: all 0.3s ease-in-out;
        }

        button:hover {
            background: linear-gradient(to right, #2575fc, #6a11cb);
            box-shadow: 0px 8px 20px rgba(38, 99, 255, 0.6);
            transform: translateY(-2px);
        }

        button:active {
            transform: translateY(2px);
        }

        /* Animation */
        @keyframes fadeIn {
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
                padding: 30px 20px;
            }

            h2 {
                font-size: 2rem;
            }

            button {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Enter Quiz Title</h2>
        <form action="ValidateQuizTitle" method="post">
            <div class="mb-3">
                <label for="quizTitle" class="form-label">Quiz Title</label>
                <input type="text" class="form-control" id="quizTitle" name="quizTitle" required>
            </div>
            <button type="submit" class="btn btn-primary">Start Quiz</button>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
