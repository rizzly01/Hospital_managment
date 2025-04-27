<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp" %>
    <style>
        /* Custom CSS for Admin Dashboard */
        body {
            background-color: #f5f8fa; /* Light background for the body */
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .card-body {
            padding: 30px;
            text-align: center;
        }

        .card i {
            color: #2980b9; /* Blue icon color */
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: 600;
        }

        .card-text {
            font-size: 1rem;
        }

        .paint-card {
            background-color: #ffffff;
            border-left: 5px solid #2980b9; /* Blue border color */
        }

        .paint-card .card-body {
            color: #2c3e50; /* Darker text color for contrast */
        }

        .card .fs-4 {
            font-size: 1.2rem;
            font-weight: 500;
        }

        .text-success {
            color: #3498db !important; /* Light blue color for text */
        }

        /* Navbar styling adjustments for contrast */
        .navbar {
            background: linear-gradient(to right, #3498db, #2980b9) !important; /* Blue gradient background */
        }

        .navbar .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: white;
        }

        .navbar .navbar-nav .nav-link {
            color: white;
        }

        .navbar .navbar-nav .nav-link:hover {
            color: #2980b9; /* Darker blue for hover effect */
        }

        .dropdown-menu {
            background-color: #2980b9; /* Dark blue dropdown background */
        }
        .dropdown-menu .dropdown-item:hover {
            background-color: #3498db; /* Lighter blue for hover effect */
        }
    </style>
</head>
<body>
    <c:if test="${ empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
<%@include file="navbar.jsp" %>
        <h1 class="text-center mb-4" style="color: #3498db;">Doctor Dashboard</h1> <!-- Light blue color for header -->
       <%
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		%>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card paint-card">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-user-md fa-3x"></i><br>
                        <p class="fs-4">Doctor <br><%=dao.countDoctor()%>
                    </div>
                </div>
            </div>
            
       

            <div class="col-md-4 mb-4">
                <div class="card paint-card">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-user-circle fa-3x"></i><br>
                        <p class="fs-4">User <br><%=dao.countUSer()%>
                    </div>
                </div>
            </div>
            
              <div class="col-md-4 mb-4">
                <div class="card paint-card">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-user-circle fa-3x"></i><br>
                        <p class="fs-4">Total Appointment <br><%=dao.countAppointment()%>
                    </div>
                </div>
            </div>
         </div>

</body>
</html>