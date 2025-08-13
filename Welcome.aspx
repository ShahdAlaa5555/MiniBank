<!DOCTYPE html>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Pages_Welcome" %>
<html lang="en">
<head runat="server">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>National Bank of Egypt</title>
<link rel="icon" type="image/x-icon" runat="server" href="~/Images/nbe_Logo.jpg"/>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    /* Navbar */
     .navbar {
  background-color: white;  /* Green background */
   border-bottom: 4px solid #007336; /* Green bottom border */
  height: 100px; /* Navbar height */
  display: flex;
  align-items: center;
  justify-content: space-between; /* Keep items aligned to the left */
  padding: 0 20px;
  position: fixed; /* Stay at the top */
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000; /* Stay above other content */
}


    .navbar h1 {
        margin: 0;
        font-size: 24px;
        color: black;
    }
    .navbar .buttons button {
        background-color: #007336;
        color: white;
        border: none;
        padding: 8px 15px;
        margin-left: 10px;
        cursor: pointer;
        border-radius: 5px;
        font-size: 16px;
    }
    /* Fullscreen Image Slider */
    .slider {
        display: flex;
        overflow-x: auto;
        scroll-snap-type: x mandatory;
        width: 100%;
        height: 100vh;
        margin-top: 64px; /* navbar height */
    }
    .slider img {
        width: 100%;
        height: 100%;
        object-fit: contain;
        scroll-snap-align: center;
        flex-shrink: 0;
    }
    /* Videos Section */
    .videos {
        padding: 40px 20px;
        text-align: center;
    }
    .videos iframe {
        margin: 10px;
        border-radius: 10px;
        width: 560px;
        height: 315px;
        max-width: 100%;
    }
    /* Contact Section */
    .contact {
        background-color: #007336;
        color: white;
        padding: 20px;
        text-align: left;
    }
    /* Logo inside navbar */
.top-left-logo {
  height: 70px; /* Adjust size */
  width: auto; /* Keep proportions */
  margin-right: 20px; /* Space between logo and links */
}
.top-left {
  display: flex;
  align-items: center;
}
.logo {
  margin-bottom: 20px;
}
/* Splash screen styles */
#splash {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: white; /* page background color */
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 9999;
}

#splash_logo {
  width: 500px; /* bigger size */
  opacity: 0;
  transform: scale(0.8);
  animation: splashFade 5s ease-in-out forwards;
}

/* Animation: fade in, stay, fade out */
@keyframes splashFade {
  0% {
    opacity: 0;
    transform: scale(0.8);
  }
  20% {
    opacity: 1;
    transform: scale(1.1);
  }
  80% {
    opacity: 1;
    transform: scale(1);
  }
  100% {
    opacity: 0;
    transform: scale(0.8);
  }
}

</style>
</head>
<body>
 <!-- Splash Screen -->
<div id="splash">
  <img src="~/Images/logo.jpg" runat="server"  alt="NBE Logo" id="splash_logo">
</div>


<!-- Navbar -->
<div class="navbar">
       <div class="top-left">
   <img src="~/Images/logo.jpg" runat="server" alt="Logo" class="top-left-logo">
    </div>
    <div class="buttons">
        <button onclick="window.location.href='Login.aspx'">Login</button>
        <button onclick="window.location.href='Register.aspx'">Sign Up</button>
    </div>
</div>

<!-- Image Slider -->
<div class="slider">
    <img src="~\Images\n1.jpg" runat="server" alt="Service 1">
    <img src="~\Images\n2.jpg" runat="server" alt="Service 2">
</div>

<!-- Videos Section -->
<div class="videos">
    <h2>About Our Services</h2>
    <iframe src="https://www.youtube.com/embed/ktlvorTf0F8" frameborder="0" allowfullscreen></iframe>
    <iframe src="https://www.youtube.com/embed/UFcjNpPFRdY" frameborder="0" allowfullscreen></iframe>
</div>


<!-- Contact Info -->
<div class="contact">
    <h2>Contact Us</h2>
    <p>Email: info@NBE.com</p>
    <p>Phone: +123 456 789</p>
    <p>Head Office: 1187 Business Street, City</p>
</div>
  <script>
      window.addEventListener("load", function () {
          setTimeout(function () {
              document.getElementById("splash").style.display = "none";
          }, 4000); // duration matches animation length
      });
  </script>




</body>
</html>
