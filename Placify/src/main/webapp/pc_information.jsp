<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Information</title>
    <style>
       /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    background: linear-gradient(to bottom right, #eef2f3, #ffffff);
    color: #333;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

/* Container Styles */
.container {
    max-width: 600px;
    width: 100%;
    background-color: #ffffff;
    border-radius: 12px;
    padding: 30px;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    text-align: center;
}

.container:hover {
    transform: translateY(-10px);
    box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.2);
}

/* Heading Styles */
h1 {
    font-size: 26px;
    color: #007bff;
    margin-bottom: 25px;
    position: relative;
}

h1::after {
    content: '';
    width: 50px;
    height: 3px;
    background-color: #007bff;
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: -5px;
    border-radius: 2px;
}

/* Form Styles */
form {
    display: flex;
    flex-direction: column;
    align-items: stretch;
    gap: 15px;
}

/* Label Styles */
label {
    font-size: 16px;
    color: #555;
    text-align: left;
    font-weight: bold;
}

/* Input and Select Styles */
select,
textarea {
    font-size: 16px;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background: #f9f9f9;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
    width: 100%;
    box-sizing: border-box;
}

select:focus,
textarea:focus {
    border-color: #007bff;
    box-shadow: 0px 0px 8px rgba(0, 123, 255, 0.3);
    outline: none;
}

/* Button Styles */
button {
    font-size: 18px;
    font-weight: bold;
    padding: 12px;
    border: none;
    border-radius: 8px;
    background: linear-gradient(to right, #007bff, #0056b3);
    color: white;
    cursor: pointer;
    transition: background 0.3s ease, transform 0.2s ease;
}

button:hover {
    background: linear-gradient(to right, #0056b3, #004080);
    transform: scale(1.05);
}

/* Back Button Styles */
.back-button {
    margin-top: 20px;
}

.back-button a {
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    padding: 10px 20px;
    color: white;
    border-radius: 8px;
    background: linear-gradient(to right, #6c757d, #495057);
    transition: background 0.3s ease, transform 0.2s ease;
    display: inline-block;
}

.back-button a:hover {
    background: linear-gradient(to right, #495057, #343a40);
    transform: scale(1.05);
}

/* Footer */
footer {
    margin-top: 20px;
    font-size: 14px;
    color: #888;
    text-align: center;
}

    </style>
</head>
<body>
    <div class="container">
        <h1>Upload Year-wise Information</h1>
        <form action="UploadInformation" method="post">
            <!-- Year selection -->
            <label for="year">Year:</label>
            <select name="year" id="year" required>
                <option value="" disabled selected>Select Year</option>
                <option value="1st Year">1st Year</option>
                <option value="2nd Year">2nd Year</option>
                <option value="3rd Year">3rd Year</option>
                <option value="4th Year">4th Year</option>
            </select>
            
            <!-- Message input -->
            <label for="message">Message:</label>
            <textarea name="message" id="message" rows="4" cols="50" placeholder="Write your message here..." required></textarea>

            <!-- Submit button -->
            <button type="submit">Submit</button>
        </form>

        <!-- Back button -->
        <div class="back-button">
            <a href="coordinatore_home_page.jsp">Back</a>
        </div>
    </div>
</body>
</html>