<%@page import="com.Db.DbConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@ include file="../css.jsp" %>
        <!-- SweetAlert2 CDN -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>



        <div class="container p-5">
            <p class="text-center fs-3">Admin Dashboard</p>
            <!-- Check if the admin session is empty and redirect if true -->

            <c:if test="${empty adminObj}">
                <c:redirect url="../admin_login.jsp" />
            </c:if>
            <!-- Error message -->
            <c:if test="${not empty errorMsg}">
                <p class="fs-3 text-center text-danger">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session" />
            </c:if>

            <!-- Success message -->
            <c:if test="${not empty succMsg}">
                <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                <c:remove var="succMsg" scope="session" />
            </c:if>

            <c:if test="${not empty succMsg1}">
                <div class="fs-3 text-center text-success" role="alert">${succMsg1}</div>
                <c:remove var="succMsg1" scope="session" />
            </c:if>
                <%DoctorDao dao = new DoctorDao(DbConnect.getConn());%>
            <div class="row">
                <div class="col-md-4">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fas fa-user-md fa-3x"></i><br>
                            <p class="fs-4 text-center">Doctor <br><%=dao.countDoctor()%></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="fas fa-user-circle fa-3x"></i><br>
                            <p class="fs-4 text-center">User <br><%=dao.countuser()%></p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card paint-card">
                        <div class="card-body text-center text-success">
                            <i class="far fa-calendar-check fa-3x"></i><br>
                            <p class="fs-4 text-center">Total Appointment <br><%=dao.countAppointment() %> </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 mt-2">
                    <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal"">
                        <div class="card-body text-center text-success">
                            <i class="far fa-calendar-check fa-3x"></i><br>
                            <p class="fs-4 text-center">Specialist <br><%=dao.countspecialist()%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>         
        <!--// this both are same  below modal bhi boton for spelist  pop--> 
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../addSpecialist" method="post" id="specialistForm">
                            <div class="form-group">
                                <label>Enter Specialist Name</label>
                                <input type="text" name="specName" id="specName" class="form-control">
                            </div>
                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript to show popups for login msg -->  
        <script type="text/javascript">
            // This function mimics the behavior of an alert box
            function showCustomAlert(message) {
                // Create a container for the custom alert
                var alertBox = document.createElement("div");
                alertBox.id = "customAlertBox";
                alertBox.style.position = "fixed";
                alertBox.style.top = "50%";
                alertBox.style.left = "50%";
                alertBox.style.transform = "translate(-50%, -50%)";
                alertBox.style.backgroundColor = "#f8f9fa"; // Light background
                alertBox.style.padding = "20px";
                alertBox.style.borderRadius = "10px";
                alertBox.style.textAlign = "center";
                alertBox.style.fontSize = "20px";
                alertBox.style.fontWeight = "bold"; // Bold text
                alertBox.style.color = "green"; // Green text
                alertBox.style.boxShadow = "0 0 10px rgba(0, 0, 0, 0.1)";
                alertBox.style.zIndex = "1000";
                alertBox.style.display = "block"; // Show the alert box initially

                // Create message text and set the custom message
                var messageText = document.createElement("h2");
                messageText.textContent = message;

                // Create the OK button
                var okButton = document.createElement("button");
                okButton.textContent = "OK";
                okButton.style.padding = "10px 20px";
                okButton.style.backgroundColor = "#28a745"; // Green button
                okButton.style.color = "white";
                okButton.style.border = "none";
                okButton.style.borderRadius = "5px";
                okButton.style.cursor = "pointer";
                okButton.style.marginTop = "20px";

                // When OK button is clicked, hide the custom alert box
                okButton.addEventListener("click", function () {
                    alertBox.style.display = "none"; // Hide the alert box
                });

                // Append message and button to the custom alert box
                alertBox.appendChild(messageText);
                alertBox.appendChild(okButton);

                // Append the alert box to the body
                document.body.appendChild(alertBox);
            }

            // Example usage
            <%
                if (session != null) {
                    // Check if the login was successful
                    if (session.getAttribute("loginSuccess") != null) {
            %>
            // Show custom alert for login success
            showCustomAlert("Login Successful!");
            <%
                    session.removeAttribute("loginSuccess"); // Remove the success message after showing
                }

                // Check if there's an error message
                if (session.getAttribute("errorMsg") != null) {
            %>
            // Show custom alert for error
            showCustomAlert("<%= session.getAttribute("errorMsg")%>");
            <%
                        session.removeAttribute("errorMsg"); // Remove the error message after showing
                    }
                }
            %>

            // JavaScript form validation for formspecialist until not work until not fill

            document.getElementById("specialistForm").addEventListener("submit", function (event) {
                // Get the value of the "specName" input field
                var specName = document.getElementById("specName").value;

                // Check if the input field is empty
                if (specName.trim() === "") {
                    // Prevent form submission
                    event.preventDefault();

                    // Alert the user to fill in the specialist name
                    alert("Please enter a Specialist Name.");

                    // Optionally, you can also highlight the input field to guide the user
                    document.getElementById("specName").style.borderColor = "red";
                } else {
                    // Optionally, you can clear the red border if the field is filled
                    document.getElementById("specName").style.borderColor = "";
                }
            });
        </script>


        <!-- Modal Section (Commented out for now) -->
        <!-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../addSpecialist" method="post">
                            <div class="form-group">
                                <label>Enter Specialist Name</label> <input type="text" name="specName" class="form-control">
                            </div>
                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div> -->

    </body>
</html>
