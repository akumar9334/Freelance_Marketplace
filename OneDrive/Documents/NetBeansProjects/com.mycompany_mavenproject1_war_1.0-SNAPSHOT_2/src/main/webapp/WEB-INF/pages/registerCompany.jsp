<%-- 
    Document   : register
    Created on : Jan 17, 2025, 11:21:52 AM
    Author     : kumar
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Register Companies</title>
    
    <!-- Link to external CSS and favicon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/files/style.css" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/files/images/favicon-32x32.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        a {
            text-decoration: none;
            font-size: 25px;
            text-align: center;
            justify-content: center;
        }
    </style>
</head>
<body>
        <script>
    $(document).ready(function () {
        // Success Message Alert
        <c:if test="${not empty succMsg}">
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: '${succMsg}',
                confirmButtonText: 'OK',
                allowOutsideClick: false, // Prevent closing by clicking outside
                allowEscapeKey: false,// Prevent closing with the Escape key
                 confirmButtonColor: '#dc3545'  
            });
        </c:if>

        // Error Message Alert
        <c:if test="${not empty errorMsg}">
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: '${errorMsg}',
                confirmButtonText: 'Try Again',
                allowOutsideClick: false, // Prevent closing by clicking outside
                allowEscapeKey: false, // Prevent closing with the Escape key
                confirmButtonColor: '#ffc107'
            });
        </c:if>
    });
</script>
<section class="container">
    <nav class="navbar navbar-expand-lg custom_nav-container">
        <a href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/files/images/logo.png" alt="Project Logo" />
            <span>ProjectPulse</span>
        </a>
    </nav>
  
    <header>Hire the best freelancers for any job, online. Registration Here</header>
  
    <form id="registrationForm" action="${pageContext.request.contextPath}/registerCompany" class="form" method="post" enctype="multipart/form-data">
        <!-- Name input -->
        <div class="input-box">
            <label>Personal Name/Organization Name</label>
            <input type="text" placeholder="Enter name" required name="name" pattern="[A-Za-z\s]{1,}" title="Name should only contain letters and spaces." />
        </div>

        <!-- Email input -->
        <div class="input-box">
            <label>Email</label>
            <input type="email" placeholder="Enter email address" required name="email" />
        </div>

        <!-- Phone Number input -->
        <div class="input-box">
            <label>Phone Number</label>
            <input type="tel" placeholder="Enter Contact number" name="number" required pattern="\d{10}" title="Phone number should be 10 digits." />
        </div>

        <!-- Website input  -->
        <div class="input-box">
            <label>Company Website</label>
            <input type="url" placeholder="Enter Company Website" name="website" required pattern="https?://.+" title="Enter a valid URL starting with http:// or https://." />
        </div>     

        <!-- File upload input   -->
        <div class="input-box">
            <label>Company Photo or Banner</label>
            <input type="file" name="filename" required accept="image/*" title="Please upload a valid image file." />
        </div> 

        <!-- Password input -->
        <div class="input-box">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter Password" required pattern=".{6,}" title="Password must be at least 6 characters long." />
        </div>

        <!-- Confirm Password input -->
        <div class="input-box">
            <label>Confirm Password</label>
            <input type="password" name="confirmpassword" placeholder="Enter Confirm Password" required pattern=".{8,}" title="Password must be at least 8 characters long." />
        </div>

        <button type="submit">Register</button>
        <br>
        <a href="${pageContext.request.contextPath}/logincompany">
            <button type="button">Login</button>
        </a>
        Already Have Account?
    </form>
</section>

<script>
document.getElementById('registrationForm').addEventListener('submit', function(event) {
    // Get the form elements
    var form = event.target;
    var password = form.elements['password'].value;
    var confirmPassword = form.elements['confirmpassword'].value;

    // Check if passwords match
    if (password !== confirmPassword) {
        alert('Passwords do not match.');
        event.preventDefault(); // Prevent form submission
    }
});
</script>

<style>
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
    }

    body {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
        background-image: url('https://images.pexels.com/photos/4348404/pexels-photo-4348404.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
        background-size: cover;
        background-repeat: no-repeat;
    }

    .container {
        position: relative;
        max-width: 700px;
        width: 100%;
        background: #fff;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }

    .container header {
        font-size: 1.5rem;
        color: #333;
        font-weight: 500;
        text-align: center;
    }

    .container .form {
        margin-top: 30px;
    }

    .form .input-box {
        width: 100%;
        margin-top: 20px;
    }

    .input-box label {
        color: #333;
    }

    .form :where(.input-box input, .select-box) {
        position: relative;
        height: 50px;
        width: 100%;
        outline: none;
        font-size: 1rem;
        color: #707070;
        margin-top: 8px;
        border: 1px solid #ddd;
        border-radius: 6px;
        padding: 0 15px;
    }

    .input-box input:focus {
        box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
    }

    .form button {
        height: 55px;
        width: 100%;
        color: #fff;
        font-size: 1rem;
        font-weight: 400;
        margin-top: 30px;
        border: none;
        cursor: pointer;
        transition: all 0.2s ease;
        background: rgb(130, 106, 251);
    }

    .form button:hover {
        background: rgb(88, 56, 250);
    }

    /* Responsive design */
    @media screen and (max-width: 500px) {
        .form .column {
            flex-wrap: wrap;
        }
    }
</style>

</body>
</html>

