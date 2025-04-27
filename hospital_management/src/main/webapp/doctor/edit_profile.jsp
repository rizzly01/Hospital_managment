<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.profile-box {
    width: 100%;
    max-width: 520px;
    background: rgba(230, 240, 250, 0.6); /* Faint Blue */
    padding: 40px;
    border-radius: 20px;
    border: 1px solid rgba(100, 149, 237, 0.3); /* Light Blue Border */
    box-shadow: 
        0 15px 35px rgba(100, 149, 237, 0.2), 
        0 5px 15px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(15px);
    transition: all 0.3s ease;
}

.profile-box:hover {
    transform: translateY(-5px);
    box-shadow: 
        0 20px 40px rgba(100, 149, 237, 0.3), 
        0 7px 20px rgba(0, 0, 0, 0.15);
}

.profile-box h2 {
    color: #2C3E50;
    text-align: center;
    margin-bottom: 20px;
    position: relative;
}

.profile-box h2::after {
    content: '';
    position: absolute;
    bottom: -8px;
    left: 50%;
    transform: translateX(-50%);
    width: 70px;
    height: 3px;
    background: linear-gradient(to right, #3498DB, #2980B9);
}

.profile-box .form-control {
    background: rgba(255, 255, 255, 0.7);
    border: 1px solid #B0E0E6;
    color: #4682B4;
}

.btn-custom {
    background: #5B9BD5; /* Soft Blue */
    font-size: 16px;
    font-weight: bold;
    color: white;
    padding: 10px;
    border-radius: 8px;
    width: 100%;
    border: none;
    transition: all 0.3s ease;
}

.btn-custom:hover {
    background: #1F497D; /* Darker Blue */
    transform: translateY(-3px);
}

</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>

<div class="container p-4">
    <div class="row">
        <!-- Change Password Box -->
        <div class="col-md-4">
            <div class="profile-box">
                <h2>Change Password</h2>
                <c:if test="${not empty succMsg}">
                    <p class="text-center text-success fs-5">${succMsg}</p>
                    <c:remove var="succMsg" scope="session" />
                </c:if>
                <c:if test="${not empty errorMsg}">
                    <p class="text-center text-danger fs-5">${errorMsg}</p>
                    <c:remove var="errorMsg" scope="session" />
                </c:if>
                <form action="../doctChangePassword" method="post">
                    <div class="mb-3">
                        <label>Enter New Password</label>
                        <input type="password" name="newPassword" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label>Enter Old Password</label>
                        <input type="password" name="oldPassword" class="form-control" required>
                    </div>
                    <input type="hidden" value="${doctObj.id}" name="uid">
                    <button class="btn btn-custom col-md-12">Change Password</button>
                </form>
            </div>
        </div>

        <!-- Edit Profile Box -->
        <div class="col-md-5 offset-md-2">
            <div class="profile-box">
                <h2>Edit Profile</h2>
                <c:if test="${not empty succMsgd}">
                    <p class="text-center text-success fs-5">${succMsgd}</p>
                    <c:remove var="succMsgd" scope="session" />
                </c:if>
                <c:if test="${not empty errorMsgd}">
                    <p class="text-center text-danger fs-5">${errorMsgd}</p>
                    <c:remove var="errorMsgd" scope="session" />
                </c:if>
                <form action="../doctorUpdateProfile" method="post">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="fullname" class="form-control" value="${doctObj.fullName}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">DOB</label>
                        <input type="date" name="dob" class="form-control" value="${doctObj.dob}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Qualification</label>
                        <input type="text" name="qualification" class="form-control" value="${doctObj.qualification}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Specialist</label>
                        <select name="spec" class="form-control" required>
                            <option>${doctObj.specialist}</option>
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
                        <input type="text" name="email" class="form-control" value="${doctObj.email}" readonly required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mob No</label>
                        <input type="text" name="mobno" class="form-control" value="${doctObj.mobNo}" required>
                    </div>
                    <input type="hidden" name="id" value="${doctObj.id}">
                    <button type="submit" class="btn btn-custom col-md-12">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>