<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coordinator Module - Selection Page</title>
    <link rel="stylesheet" href="css/quiz.css">
</head>
<body>
    <div class="container">
        <h1>Choose an Option</h1>
        <div class="cards">
            <!-- Card 1: Previous Year Questions -->
            <div class="card" onclick="location.href='upload_quiz.jsp';">
                <h2>Upload Files</h2>
                <p>PDFs, GoogleForm etc.</p>
            </div>
            <!-- Card 2: Live Quiz Assessment -->
            <div class="card" onclick="location.href='create_live_quiz.jsp';">
                <h2>Live Quiz Upload</h2>
                <p>Create manually quiz</p>
            </div>
        </div>
    </div>
</body>
</html>
