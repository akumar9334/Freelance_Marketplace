

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
                <div class="col-md-5 offset-md-4">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Add Doctor</p>
                            <c:if test="${not empty errorMsg}">
                                <p class="fs-3 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>
                            <form action="../addDoctor" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" required name="fullname" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">DOB</label>
                                    <input type="date" required name="dob" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Qualification</label>
                                    <input required name="qualification" type="text" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Specialist</label>
                                    <select name="spec" required class="form-control">
                                        <option>--select--</option>
                                        <% SpecialistDao dao = new SpecialistDao(DbConnect.getConn());
                                       List<Specialist> list = dao.getAllSpecialist();
                                       for(Specialist s:list)
                                       {%>
                                        
                                         <option><%=s.getSpecialistName()%></option>
                                        
               
                                        <%}
                                        
                                        %>
                                       
                                    </select>
                                </div>  

                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="text" required name="email" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mob No</label>
                                    <input type="text" required name="mobno" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Password</label>
                                    <input required name="password" type="password" class="form-control">
                                </div>

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>



            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    </body>
</html>
