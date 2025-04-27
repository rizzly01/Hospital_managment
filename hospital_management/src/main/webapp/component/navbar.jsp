<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(to right, #2c3e50, #3498db) !important;">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <i class="fa fa-hospital-o" aria-hidden="true"></i> 
            <span class="ms-2 fw-bold">MEDI HOME</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Left side navbar items (Appointment, View Appointment) -->
            <ul class="navbar-nav mb-2 mb-lg-0 ms-auto">
                <c:if test="${empty userObj }">
                    <!-- If userObj is empty, show these items -->
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="admin_login.jsp">
                            <i class="fa fa-sign-in me-1" aria-hidden="true"></i>ADMIN
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="doctor_login.jsp">
                            <i class="fa fa-user-md me-1" aria-hidden="true"></i>DOCTOR
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="user_appointment.jsp">
                            <i class="fa fa-calendar me-1" aria-hidden="true"></i>APPOINTMENT
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="user_login.jsp">
                            <i class="fa fa-user me-1" aria-hidden="true"></i>USER
                        </a>
                    </li>
                </c:if>
                
                <c:if test="${not empty userObj }">
                    <!-- If userObj is not empty, show the following -->
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="user_appointment.jsp">
                            <i class="fa fa-calendar me-1" aria-hidden="true"></i>APPOINTMENT
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="view_appointment.jsp">
                            <i class="fa fa-calendar-check me-1" aria-hidden="true"></i>VIEW APPOINTMENT
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            ${userObj.fullName}
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
                            <li><a class="dropdown-item" href="userLogout">Logout</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
