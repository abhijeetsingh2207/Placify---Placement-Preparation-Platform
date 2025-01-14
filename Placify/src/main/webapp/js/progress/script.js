document.addEventListener("DOMContentLoaded", () => {
    const leaderboardContainer = document.getElementById("leaderboard");
    const titleSelect = document.getElementById("titleSelect");
    const downloadBtn = document.getElementById("downloadBtn");
    let currentLeaderboardData = []; // To store the displayed leaderboard data
    let currentTitle = ""; // To track the selected title

    downloadBtn.style.display = "none"; // Initially hide the download button

    // Fetch available titles from the backend
    fetch("http://localhost/leaderboard/backend.php?action=get_titles")
        .then(response => response.json())
        .then(data => {
            if (data && data.length > 0) {
                data.forEach(title => {
                    const option = document.createElement("option");
                    option.value = title;
                    option.textContent = title;
                    titleSelect.appendChild(option);
                });
            }
        })
        .catch(error => console.error("Error fetching titles:", error));

    // Event listener for title selection
    titleSelect.addEventListener("change", (e) => {
        const selectedTitle = e.target.value;
        if (selectedTitle) {
            currentTitle = selectedTitle;
            fetchLeaderboardData(selectedTitle);
        } else {
            leaderboardContainer.innerHTML = "<p>Please select a title.</p>";
            downloadBtn.style.display = "none"; // Hide the button if no title is selected
        }
    });

    // Fetch leaderboard data based on selected title
    function fetchLeaderboardData(title) {
        fetch(`http://localhost/leaderboard/backend.php?action=get_leaderboard&title=${title}`)
            .then(response => response.json())
            .then(data => {
                currentLeaderboardData = data; // Store the fetched data
                renderLeaderboard(data);
                downloadBtn.style.display = "block"; // Show the download button
            })
            .catch(error => {
                console.error("Error fetching leaderboard data:", error);
                leaderboardContainer.innerHTML = "<p>Error loading leaderboard.</p>";
                downloadBtn.style.display = "none";
            });
    }

    // Function to render leaderboard in HTML
    function renderLeaderboard(data) {
        leaderboardContainer.innerHTML = ""; // Clear any previous leaderboard
        if (data.length === 0) {
            leaderboardContainer.innerHTML = "<p>No data available for this title.</p>";
            downloadBtn.style.display = "none";
            return;
        }

        data.forEach((entry, index) => {
            const item = document.createElement("div");
            item.classList.add("leaderboard-item");
            item.innerHTML = `
                <span>#${index + 1}</span>
                <span>Student ID: ${entry.student_id}</span>
                <span>Score: ${entry.score}</span>
            `;
            leaderboardContainer.appendChild(item);
        });
    }

    // Download leaderboard as CSV
    downloadBtn.addEventListener("click", () => {
        if (currentLeaderboardData.length === 0) return;

        let csvContent = "Rank,Student ID,Score\n";
        currentLeaderboardData.forEach((entry, index) => {
            csvContent += `${index + 1},${entry.student_id},${entry.score}\n`;
        });

        const blob = new Blob([csvContent], { type: "text/csv" });
        const url = URL.createObjectURL(blob);
        const a = document.createElement("a");
        a.href = url;
        a.download = `${currentTitle}_leaderboard.csv`;
        a.click();
        URL.revokeObjectURL(url);
    });
});
