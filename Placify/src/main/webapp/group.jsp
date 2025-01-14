<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Group</title>
    <link rel="stylesheet" href="pc_information.css">
</head>
<body>
    <div class="container">
        <h1>Manage <span id="groupName">Group</span></h1>
        <div class="group-info">
            <div class="students" id="studentsList">
                <!-- Student list will be populated here -->
            </div>
        </div>
        <div class="chat-area" id="chatArea">
            <div class="messages" id="messagesList">
                <!-- Messages will be displayed here -->
            </div>
            <div id="chatDate" class="chat-date"></div> <!-- Date will be displayed here -->
        </div>
        <div class="controls">
            <textarea id="message" placeholder="Type your message here..."></textarea>
            <input type="file" id="fileInput" accept="image/*, application/pdf, .doc, .docx" /> <!-- Added file input -->
            <button onclick="sendMessageToGroup()">Send Message</button>
            <div class="student-controls">
                <input type="text" id="studentName" placeholder="Add/Remove Student">
                <button onclick="addStudent()">Add Student</button>
                <button onclick="removeStudent()">Remove Student</button>
            </div>
        </div>
    </div>
    
    <script src="pc_information.js"></script>
</body>
</html>
