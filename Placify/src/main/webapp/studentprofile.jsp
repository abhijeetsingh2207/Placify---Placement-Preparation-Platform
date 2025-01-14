<!DOCTYPE html>
<%@page import="java.util.List"%>
  <% List<Object> lt = (List<Object>) request.getAttribute("list"); %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css\studentprofile.css">
</head>
<body>
    <div class="container profile-container mt-5">
        <div class="profile-header text-center">
            <div class="profile-pic">
                <label for="avatarUpload" class="upload-label">
                    <img src="img\Student Images\studentavtar.jpeg" alt="User Avatar" class="rounded-circle" id="profilePic">
                </label>
                <input type="file" id="avatarUpload" accept="image/*" onchange="previewImage(event)" hidden>
            </div>
            <h2 class="mt-3">Edit Your Profile</h2>
        </div>
  
        <form action="Update_student" method="POST">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" id="name" value="<%= (String) lt.get(0) %>" readonly>
                </div>
                <div class="col-md-6">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" id="email" value="<%= (String) lt.get(1) %>" >
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="enrollment" class="form-label">Enrollment No</label>
                    <input type="text" name="enrollmentNo" class="form-control" id="enrollment" value="<%= (String) lt.get(2) %>" readonly> 
                </div> 
                <div class="col-md-6">
                    <label for="phone" class="form-label">Phone No</label>
                    <input type="text" name="phoneNo" class="form-control" id="phone" value="<%= (Integer) lt.get(3) %>" >
                </div> 
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="year" class="form-label">Year</label>
                    <input type="text" name="year" class="form-control" id="year" value="<%= (Integer) lt.get(4) %>" readonly>
                </div>
                <div class="col-md-6">
                    <label for="password" class="form-label">Password</label>
                    <input type="text" name="password" class="form-control" id="password" value="<%= (String) lt.get(5) %>" >
                </div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary save-btn"  value="Update">Submit</button>
            </div>
        </form>
        
        <!-- Back Button -->
        <div class="text-center mt-3">
            <a href="student_home_page.jsp" class="btn btn-secondary">Back</a>
        </div>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js\studentprofile.js"></script>
</body>
</html>
