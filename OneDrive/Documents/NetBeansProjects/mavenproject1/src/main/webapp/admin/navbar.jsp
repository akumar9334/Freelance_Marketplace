<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        * Custom style to narrow down the navbar *
        /*.navbar {
            max-width: 100%;  Set a specific maximum width 
            margin-left: auto;   Center the navbar 
            margin-right: auto;  Center the navbar 
        }
        
         Alternatively, reduce the padding inside navbar 
        .navbar-nav {
            padding-left: 20px;
            padding-right: 20px;
        }*/

    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome for icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-success">
            <div class="container-fluid">
                <a class="navbar-brand" href="../index.jsp"><i
                        class="fas fa-clinic-medical"></i> Medi Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                        <li class="nav-item"><a class="nav-link active" href="indexdoc.jsp">HOME</a></li>
                        <li class="nav-item"><a class="nav-link active" href="doctor.jsp">AddDOCTOR</a></li>
                        <li class="nav-item"><a class="nav-link active" href="view_doctor.jsp">VIEW DOCTOR</a></li>
                        <li class="nav-item"><a class="nav-link active" href="patientd.jsp">PATIENT</a></li>


                    </ul>

                    <form class="d-flex">
                        <div class="dropdown">
                            <button class="btn btn-light dropdown-toggle" type="button"
                                    id="dropdownMenuButton1" data-bs-toggle="dropdown"
                                    aria-expanded="false">Admin</button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </nav
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>

</html>
