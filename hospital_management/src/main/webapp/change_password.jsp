<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>

<style>
/* Centered Form Styling */
.paint-card {
    background: rgba(230, 240, 250, 0.7); /* Faint blue */
    box-shadow: 0 8px 20px rgba(100, 149, 237, 0.3); /* Soft shadow */
    border-radius: 12px;
    border: 1px solid rgba(100, 149, 237, 0.4);
    padding: 20px;
    transition: all 0.3s ease-in-out;
}

.paint-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 25px rgba(100, 149, 237, 0.4);
}

/* Text Styling */
.text-center.fs-3 {
    color: #2C3E50; /* Darker shade for contrast */
    font-weight: bold;
}

/* Form Styling */
.form-control {
    background: rgba(255, 255, 255, 0.8);
    border: 1px solid #B0E0E6;
    color: #4682B4;
    padding: 10px;
    border-radius: 8px;
}

/* Button Styling */
.btn-success {
    background: #5DADE2;
    border: none;
    font-size: 18px;
    font-weight: bold;
    transition: all 0.3s ease-in-out;
}

.btn-success:hover {
    background: #3498DB;
    transform: translateY(-2px);
}

/* Responsive Design */
@media (max-width: 768px) {
    .col-md-4 {
        width: 90%;
        margin: auto;
    }
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<c:if test="${ empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>

					<!-- Success Message -->
					<c:if test="${not empty succMsg }">
						<p class="text-center text-success fs-5">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<!-- Error Message -->
					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<div class="card-body">
						<form action="userChangePassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> 
								<input type="password" name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> 
								<input type="password" name="oldPassword" class="form-control" required>
							</div>

							<input type="hidden" value="${userObj.id }" name="uid">
							<button class="btn btn-success col-md-12">Change Password</button>
						</form>
					</div> 
				</div>
			</div>
		</div>
	</div>
	<%@include file="component/footer.jsp" %>
	
</body>
</html>
