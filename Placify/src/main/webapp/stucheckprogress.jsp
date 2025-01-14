 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Progress</title>
    <link rel="stylesheet" href="styles/stucheckprogress.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>


<body>
    <div class="progress-container">
        <h1 class="title">Your Progress</h1>

        <c:if test="${not empty progressList}">
            <!-- Chart Container -->
            <div class="chart-container">
                <canvas id="progressChart"></canvas>
            </div>

            <!-- Summary Section -->
            <div class="summary-container">
                <h2>Performance Summary</h2>
                <p>
                    Highest Score: <strong>${highestScore}</strong><br>
                    Lowest Score: <strong>${lowestScore}</strong><br>
                    Average Score: <strong>${averageScore}</strong>
                </p>
            </div>

            <!-- Test Details -->
            <table border="1">
                <thead>
                    <tr>
                        <th>Test Name</th>
                        <th>Score</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="progress" items="${progressList}">
                        <tr>
                            <td>${progress.testName}</td>
                            <td>${progress.score}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty progressList}">
            <p>No progress data found for your enrollment ID.</p>
        </c:if>
    </div>

    <script>
        const progressList = [
            <c:forEach var="progress" items="${progressList}">
                { testName: "${progress.testName}", score: ${progress.score} },
            </c:forEach>
        ];

        if (progressList.length > 0) {
            const labels = progressList.map(item => item.testName);
            const scores = progressList.map(item => item.score);

            new Chart(document.getElementById("progressChart"), {
                type: "bar",
                data: {
                    labels: labels,
                    datasets: [{
                        label: "Test Scores",
                        data: scores,
                        backgroundColor: "rgba(54, 162, 235, 0.6)",
                        borderColor: "rgba(54, 162, 235, 1)",
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: { beginAtZero: true }
                    }
                }
            });
        }
    </script>
</body>
</html>
 