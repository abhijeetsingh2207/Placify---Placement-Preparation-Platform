<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Syllabus Upload</title>
    <style>
        /* General Reset */
* {
   /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body Styling */
body {
    font-family: 'Arial', sans-serif;
    background: linear-gradient(to bottom right, #f0f4ff, #e4ecfa, #ffffff);
    color: #333;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    padding: 20px;
}

/* Heading Styling */
h1 {
    font-size: 28px;
    color: #0056b3;
    text-align: center;
    margin-bottom: 20px;
    position: relative;
    background: linear-gradient(to right, #0056b3, #007bff);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

h1::after {
    content: '';
    width: 80px;
    height: 4px;
    background: #007bff;
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    border-radius: 2px;
}

/* Form Container Styling */
form {
    width: 100%;
    max-width: 500px;
    background: linear-gradient(to bottom right, #ffffff, #e9f0ff);
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
    animation: fadeIn 0.8s ease-out;
}

/* Label Styling */
label {
    font-size: 16px;
    color: #444;
    margin-bottom: 8px;
    display: block;
}

/* Input and File Styling */
input[type="text"],
input[type="number"],
input[type="file"] {
    width: 100%;
    padding: 12px;
    margin-bottom: 20px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background: #f9f9f9;
    transition: all 0.3s ease;
}

input[type="text"]:focus,
input[type="number"]:focus,
input[type="file"]:focus {
    border-color: #007bff;
    box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
    outline: none;
}

/* Submit Button Styling */
input[type="submit"] {
    width: 100%;
    padding: 12px;
    font-size: 16px;
    color: #fff;
    background: linear-gradient(to right, #007bff, #0056b3);
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
}

input[type="submit"]:hover {
    background: linear-gradient(to right, #0056b3, #003f80);
    transform: scale(1.05);
}

/* Success Message Styling */
.message {
    max-width: 500px;
    margin: 20px auto;
    padding: 15px;
    font-size: 14px;
    background: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
    border-radius: 8px;
    text-align: center;
    animation: fadeIn 0.8s ease-out;
}

/* Home Button Styling */
.home-button {
    margin-top: 20px;
    text-align: center;
}

.home-button a {
    text-decoration: none;
    font-size: 16px;
    color: #ffffff;
    background: linear-gradient(to right, #007bff, #0056b3);
    padding: 10px 20px;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.home-button a:hover {
    background: linear-gradient(to right, #0056b3, #003f80);
    transform: scale(1.05);
}

/* Animation Effects */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive Design */
@media (max-width: 768px) {
    form {
        padding: 20px;
    }

    h1 {
        font-size: 24px;
    }

    input[type="submit"],
    .home-button a {
        font-size: 14px;
        padding: 10px;
    }
}

    </style>
</head>
<body>
    <h1>Upload Syllabus</h1>

    <!-- Placeholder for the success message -->
    <div id="message" class="message"></div>

    <form action="Upload_syllabus" method="post" enctype="multipart/form-data">
        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject" required>

        <label for="year">Year:</label>
        <input type="number" id="year" name="year" min="1" max="4" required>

        <label for="teacher_name">Teacher Name:</label>
        <input type="text" id="teacher_name" name="teacher_name" required>

        <label for="file">Choose File:</label>
        <input type="file" id="file" name="file" required>

        <input type="submit" value="Upload">
    </form>

    <!-- Home button -->
    <div class="home-button">
        <a href="coordinatore_home_page.jsp">Home</a>
    </div>

    <script>
        // Check if a message exists in the query string and display it
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');
        if (message) {
            const messageDiv = document.getElementById('message');
            messageDiv.innerText = message;
            messageDiv.style.display = 'block';
        }
    </script>
</body>
</html>
