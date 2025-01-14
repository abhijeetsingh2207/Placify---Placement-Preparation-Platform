// Image Preview Function
function previewImage(event) {
  const reader = new FileReader();
  const profilePic = document.getElementById('profilePic');

  reader.onload = function () {
      if (reader.readyState === 2) {
          profilePic.src = reader.result;
      }
  }
  reader.readAsDataURL(event.target.files[0]);
}

// Save Profile Function (could be expanded with actual functionality)
function saveProfile() {
  const name = document.getElementById('name').value;
  const email = document.getElementById('email').value;
  const phone = document.getElementById('phone').value;
  const enrollment = document.getElementById('enrollment').value;
  const year = document.getElementById('year').value;

  console.log("Profile Saved:", {
      name,
      email,
      phone,
      enrollment,
      year
  });

  alert('Profile saved successfully!');
}





