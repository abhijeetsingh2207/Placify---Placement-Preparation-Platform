<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="studentprofile.css">
</head>
<body>
    <div class="container profile-container mt-5">
        <div class="profile-header text-center">
            <div class="profile-pic">
                <label for="avatarUpload" class="upload-label">
                    <img src="https://via.placeholder.com/150" alt="Teacher" class="rounded-circle" id="profilePic">
                </label>
                <input type="file" id="avatarUpload" accept="image/*" onchange="previewImage(event)" hidden>
            </div>
            <h2 class="mt-3">Edit Your Profile</h2>
        </div>

        <form class="profile-form mt-4">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter your name" value="John Doe">
                </div>
                <div class="col-md-6">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter your email" value="john@example.com">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="phone" class="form-label">Phone No</label>
                    <input type="text" class="form-control" id="phone" placeholder="Enter your phone no." value="9876543210">
                </div>
                <div class="col-md-6">
                    <label for="enrollment" class="form-label">Enrollment No</label>
                    <input type="text" class="form-control" id="enrollment" placeholder="Enter your enrollment no." value="123456789">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="year" class="form-label">Year</label>
                    <input type="text" class="form-control" id="year" placeholder="Enter your year" value="4th Year">
                </div>
            </div>
            <div class="text-center">
                <button type="button" class="btn btn-primary save-btn" onclick="saveProfile()">Save Profile</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="test.js"></script>
</body>
</html>
