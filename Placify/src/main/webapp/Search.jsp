<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search User</title>
    <style>
        /* General reset and body styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f2f5;
            color: #333;
        }

        /* Container styling */
        .container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        /* Title styling */
        h1 {
            font-size: 1.8rem;
            margin-bottom: 20px;
            color: #333;
        }

        /* Input group styling */
        .input-group {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 15px;
            width: 100%;
        }

        label {
            align-self: flex-start;
            font-size: 1rem;
            margin-bottom: 5px;
            color: #333;
        }

        /* Input styling */
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        /* Submit button styling */
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Responsive design */
        @media (max-width: 480px) {
            h1 {
                font-size: 1.6rem;
            }

            input[type="text"], input[type="password"], input[type="submit"] {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Enter ID </h1>
        <form action="Search_user" method="POST">
            <div class="input-group">
                <label for="id">ID</label>
                <input type="text" id="id" name="enrollmentNo" placeholder="Enter ID" required/>
            </div>
            <!-- 
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter Password" required/>
            </div>
             -->
            <input type="submit" value="Search" />
        </form>
    </div>
</body>
</html>
