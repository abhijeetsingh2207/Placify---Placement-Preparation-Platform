document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.querySelector(".search-form input");
    const cards = document.querySelectorAll(".ag-courses_item");

    searchInput.addEventListener("input", function() {
        const filter = searchInput.value.toLowerCase();

        cards.forEach(card => {
            const title = card.querySelector(".ag-courses-item_title").textContent.toLowerCase();
            if (title.includes(filter)) {
                card.style.display = "";
            } else {
                card.style.display = "none";
            }
        });
    });
});