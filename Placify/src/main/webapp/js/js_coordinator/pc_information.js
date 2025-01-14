let currentGroup = '';
const teacherName = "Teacher"; // Set the teacher's name here
const groups = {
    'Group 1': ['Student A', 'Student B', 'Student C'],
    'Group 2': ['Student D', 'Student E', 'Student F'],
    'Group 3': ['Student G', 'Student H', 'Student I'],
    'Group 4': ['Student J', 'Student K', 'Student L'],
};

const messages = []; // Array to store chat messages
let currentDate = ''; // To keep track of the displayed date

window.onload = function () {
    const urlParams = new URLSearchParams(window.location.search);
    currentGroup = urlParams.get('group');
    document.getElementById('groupName').textContent = currentGroup;
    loadStudents();
    updateChatDisplay(); // Show existing messages
};

function loadStudents() {
    const studentsList = document.getElementById('studentsList');
    studentsList.innerHTML = ''; // Clear existing list
    groups[currentGroup].forEach(student => {
        const studentElem = document.createElement('p');
        studentElem.textContent = student;
        studentsList.appendChild(studentElem);
    });
}

function sendMessageToGroup() {
    const messageText = document.getElementById('message').value;
    const fileInput = document.getElementById('fileInput');

    // Check if there is a message or file to send
    if (messageText.trim() === '' && fileInput.files.length === 0) return; // Don't send empty messages

    const now = new Date();
    const dateString = now.toLocaleDateString(); // Get the current date

    // Check if the date has changed
    if (currentDate !== dateString) {
        currentDate = dateString; // Update currentDate
    }

    const timestamp = now.toLocaleTimeString(); // Only time for each message

    // Create a message object
    const messageObj = {
        text: messageText.trim(),
        timestamp,
        sender: teacherName, // Add sender name
        type: 'sent',
        file: fileInput.files.length > 0 ? URL.createObjectURL(fileInput.files[0]) : null // Create URL for file
    };

    messages.push(messageObj); // Add message to the array

    // Update the display
    updateChatDisplay();

    // Clear the input fields
    document.getElementById('message').value = '';
    fileInput.value = ''; // Clear file input
}

function updateChatDisplay() {
    const messagesList = document.getElementById('messagesList');
    messagesList.innerHTML = ''; // Clear existing messages

    // Display the current date at the top if it's set
    if (currentDate) {
        const dateElem = document.createElement('div');
        dateElem.className = 'chat-date';
        dateElem.textContent = currentDate; // Display the current date
        dateElem.style.textAlign = 'center'; // Center the date
        dateElem.style.margin = '10px 0'; // Margin for spacing
        messagesList.appendChild(dateElem);
    }

    messages.forEach(msg => {
        const messageElem = document.createElement('div');
        messageElem.className = `message ${msg.type}`;
        
        // Display sender's name
        const senderElem = document.createElement('strong');
        senderElem.textContent = msg.sender; // Display sender name
        messageElem.appendChild(senderElem);
        
        // Display text message
        if (msg.text) {
            const textElem = document.createElement('span');
            textElem.textContent = `: ${msg.text}`; // Add colon after sender's name
            messageElem.appendChild(textElem);
        }

        // Display uploaded file if exists
        if (msg.file) {
            const fileElem = document.createElement('img'); // Create an image element
            fileElem.src = msg.file; // Set the src to the file URL
            fileElem.alt = "Uploaded Image";
            fileElem.style.maxWidth = "100%"; // Limit the size of the image
            fileElem.style.borderRadius = "10px"; // Add some styling
            messageElem.appendChild(fileElem);
        }

        // Add timestamp below the message content
        const timestampElem = document.createElement('div');
        timestampElem.className = 'timestamp';
        timestampElem.textContent = msg.timestamp; // Display timestamp
        timestampElem.style.fontSize = '0.75em'; // Smaller font size for timestamp
        timestampElem.style.color = '#999'; // Lighter color for visibility
        timestampElem.style.marginTop = '5px'; // Add some space above the timestamp
        messageElem.appendChild(timestampElem);

        messagesList.appendChild(messageElem);
    });

    // Scroll to the bottom of the chat area
    const chatArea = document.getElementById('chatArea');
    chatArea.scrollTop = chatArea.scrollHeight;
}

function addStudent() {
    const studentName = document.getElementById('studentName').value;
    if (studentName) {
        groups[currentGroup].push(studentName);
        loadStudents();
        document.getElementById('studentName').value = ''; // Clear the input
    }
}

function removeStudent() {
    const studentName = document.getElementById('studentName').value;
    if (studentName) {
        groups[currentGroup] = groups[currentGroup].filter(student => student !== studentName);
        loadStudents();
        document.getElementById('studentName').value = ''; // Clear the input
    }
}
