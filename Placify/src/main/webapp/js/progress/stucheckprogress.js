document.addEventListener("DOMContentLoaded", () => {
    const studentIdInput = document.getElementById("studentId");
    const viewProgressBtn = document.getElementById("viewProgressBtn");
    const progressChartCanvas = document.getElementById("progressChart");
    const chartContainer = document.querySelector(".chart-container");
    const summaryContainer = document.querySelector(".summary-container");
    const summaryText = document.getElementById("summaryText");

    let progressChart;

    viewProgressBtn.addEventListener("click", () => {
        const studentId = studentIdInput.value;
        if (!studentId) {
            alert("Please enter a Student ID.");
            return;
        }

        fetch(`http://localhost/student_check_progress/stucheckprogress.php?action=get_progress&student_id=${studentId}`)
            .then(response => response.json())
            .then(data => {
                if (data.length === 0) {
                    alert("No progress data available for this student.");
                    return;
                }
                renderChart(data);
                renderSummary(data);
                chartContainer.style.display = "block";
                summaryContainer.style.display = "block";
                document.querySelector(".input-container").style.display = "none";
            })
            .catch(error => console.error("Error fetching progress data:", error));
    });

    function renderChart(data) {
        const labels = data.map(item => `${item.test_name} (${item.company_name})`); // Show company name with test name
        const scores = data.map(item => item.score);

        if (progressChart) {
            progressChart.destroy();
        }

        progressChart = new Chart(progressChartCanvas, {
            type: "line", // Use 'bar' for bar chart
            data: {
                labels: labels,
                datasets: [{
                    label: "Test Scores",
                    data: scores,
                    backgroundColor: "rgba(75, 192, 192, 0.2)",
                    borderColor: "rgba(75, 192, 192, 1)",
                    borderWidth: 2,
                    tension: 0.3
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true,
                        position: "top",
                        labels: {
                            color: "white",
                        }
                    },
                },
                scales: {
                    x: { 
                        title: { display: true, text: "Tests", color: "white" },
                        ticks: { color: "white" }
                    },
                    y: { 
                        title: { display: true, text: "Scores", color: "white" },
                        ticks: { color: "white" }
                    },
                },
            }
        });
    }

    function renderSummary(data) {
        const scores = data.map(item => item.score);
        const highestScore = Math.max(...scores);
        const lowestScore = Math.min(...scores);
        const averageScore = (scores.reduce((a, b) => a + b, 0) / scores.length).toFixed(2);

        const companyData = data.map(item => `${item.company_name}: ${item.test_name} - Score: ${item.score}`).join("<br>");

        summaryText.innerHTML = `
            Your highest score was <strong>${highestScore}</strong>, 
            your lowest score was <strong>${lowestScore}</strong>, 
            and your average score is <strong>${averageScore}</strong>. 
            <br><br>Details of the tests you attempted:
            <br>${companyData}
            <br><br>Keep up the good work and focus on improving further!
        `;
    }
});
