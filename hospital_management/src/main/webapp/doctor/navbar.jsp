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
            <!-- Left side navbar items (Home, Doctor, Appointment, Patient) -->
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link fw-normal" aria-current="page" href="index.jsp" style="color: rgba(255, 255, 255, 0.8); text-decoration: none;">
                        <i class="fa fa-sign-in me-1" aria-hidden="true"></i>HOME
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-normal" aria-current="page" href="patient.jsp" style="color: rgba(255, 255, 255, 0.8); text-decoration: none;">
                        <i class="fa fa-user-md me-1" aria-hidden="true"></i>PATIENT
                    </a>
                </li>
             
            </ul>
            
            <!-- Right side navbar items (Admin dropdown) -->
         <div class="dropdown ms-auto" style="position: relative; z-index: 10;">
    <button class="btn btn-light text-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: white; border-color: #3498db; color: #3498db; padding: 8px 16px; font-size: 14px;">
       <i class="fas fa-user-circle"></i> ${doctObj.fullName}
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="left: auto; right: 0;">
        <li><a class="dropdown-item text-white" href="edit_profile.jsp" style="color: white; background-color: #2980b9;">Edit Profile</a></li>
               <li><a class="dropdown-item text-white" href="../doctorLogout" style="color: white; background-color: #2980b9;">Log Out</a></li>
    </ul>
</div>

        </div>
    </div>
</nav>

