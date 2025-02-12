

<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Add Doctor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
        <!-- FontAwesome for icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <%@include file="../css.jsp"%>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid p-3">
            <div class="row">
                <!-- Left Column (Form) -->


                <!-- Right Column (Doctor Details) -->
                <div class="col-md-12">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Doctor Details</p>
                            <c:if test="${not empty succMsg }">
                                <p class="text-center text-success fs-3">${succMsg}</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty errorMsg }">
                                <p class="text-center text-danger fs-5">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">DOB</th>
                                        <th scope="col">Qualification</th>
                                        <th scope="col">Specialist</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Mob No</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Example data for displaying doctors (you need to fill this with actual data from your DB) -->
                                    <% 
                                      // Sample data to show in the table
                                      // You can replace this with actual database results
                                      DoctorDao dao2=new DoctorDao(DbConnect.getConn());
                                      List<Doctor>list2 = dao2.getAllListDoctor();
                                      for (Doctor d : list2) 
                                      {
                                    %> 
                                        <tr>
                                            <td><%= d.getFullName() %></td>
                                            <td><%= d.getDob() %></td>
                                           <td><div class="center-content"><%= d.getQualification() %></div></td>
                                            <td><%= d.getSpecialist() %></td>
                                            <td><%= d.getEmail() %></td>
                                            <td><%= d.getMobNo() %></td>
                                            <td>
                                               <a href="edit_doctor.jsp?id=<%=d.getId()%>" class="btn btn-info btn-sm">Edit</a>

                                                <a href="../deleteDoctor?id=<%= d.getId() %>" class="btn btn-danger btn-sm">Delete</a>
                                            </td>
                                        </tr>
                                    <% } %> 
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    </body>
</html>
