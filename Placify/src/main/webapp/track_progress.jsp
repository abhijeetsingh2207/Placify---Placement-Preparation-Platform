<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Leader Board & Check Progress</title>
  <link rel="stylesheet" href="css/css_progress/cards.css">
</head>
<body>
  <div class="container">
    
    <div class="card-container">
      <div class="card" id="leaderboard">
        <h2>Leader Board</h2>
        <p>View the rankings of students based on  quiz performances.</p>
        <form action="leaderboard_student.jsp" method="post">
        <button class="btn" type="submit">View Leader Board</button>
        </form>
      </div>
      <div class="card" id="check-progress">
        <h2>Check Progress</h2>
        <p>Analyze your progress with detailed visualizations and insights.</p>
        <form action="Student_Progress" method="post">
         <input type="hidden" name="action" value="get_progress">
        <button class="btn" type="submit">Check Progress</button>
        </form>
      </div>
    </div>
  </div>
 <!--  <script src="js/progress/cards.js"></script>  -->
</body>
</html>