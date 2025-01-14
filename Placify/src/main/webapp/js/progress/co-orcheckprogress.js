 document.addEventListener("DOMContentLoaded", () => {
    const studentIdInput = document.getElementById("studentId");
    const viewProgressBtn = document.getElementById("viewProgressBtn");
    const progressChartCanvas = document.getElementById("progressChart");

    let progressChart;

    viewProgressBtn.addEventListener("click", () => {
        const enrollmentNo = studentIdInput.value;
        if (!enrollmentNo) {
            alert("Please enter a valid enrollment number.");
            return;
        }

        fetch(`StudentProgressServlet?action=get_progress&enrollmentNo=${enrollmentNo}`)
            .then(response => response.text())
            .then(data => {
                if (data.startsWith("No progress data found") || data.startsWith("Invalid request")) {
                    alert(data);
                } else {
                    const parsedData = parsePlainTextResponse(data);
                    renderChart(parsedData);
                }
            })
            .catch(error => console.error("Error fetching progress data:", error));
    });

    function parsePlainTextResponse(data) {
        const rows = data.trim().split("\n");
        const parsed = rows.map(row => {
            const [quizTitle, score] = row.split("|");
            return { quizTitle, score: parseInt(score, 10) };
        });
        return parsed;
    }

    function renderChart(data) {
        const labels = data.map(item => item.quizTitle);
        const scores = data.map(item => item.score);

        if (progressChart) {
            progressChart.destroy();
        }

        progressChart = new Chart(progressChartCanvas, {
            type: "bar",
            data: {
                labels: labels,
                datasets: [{
                    label: "Scores",
                    data: scores,
                    backgroundColor: "rgba(75, 192, 192, 0.2)",
                    borderColor: "rgba(75, 192, 192, 1)",
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: true },
                },
                scales: {
                    x: { title: { display: true, text: "Quiz Titles" } },
                    y: { title: { display: true, text: "Scores" }, beginAtZero: true },
                },
            }
        });
    }
});
