<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 <%@include file="navbar.jsp" %>
<div class="container-fluid p-3">
    <div class="row">
        <!-- Left Column: Add Doctor Form -->
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
                            <select name="specialist" required class="form-control">
                                <option>--select--</option>
                                <%
                                SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                                List<Specalist> list = dao.getAllSpecialist();
                                for (Specalist s : list) {
                                %>
                                <option><%=s.getSpecialistName()%></option>
                                <%
                                }
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


</body>
</html>