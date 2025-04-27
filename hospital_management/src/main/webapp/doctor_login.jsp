<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Login</title>
    <%@include file="component/allcss.jsp" %>
    <style type="text/css">

		.login-box {
    width: 520px;
    background: rgba(230, 240, 250, 0.6);
    padding: 40px;
    border-radius: 20px;
    border: 1px solid rgba(100, 149, 237, 0.3);
    box-shadow: 
        0 15px 35px rgba(100, 149, 237, 0.2), 
        0 5px 15px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(15px);
    transition: all 0.3s ease;
}

.login-box:hover {
    transform: translateY(-10px);
    box-shadow: 
        0 20px 40px rgba(100, 149, 237, 0.3), 
        0 7px 20px rgba(0, 0, 0, 0.15);
}

.login-box h2 {
    color: #2C3E50;
    text-align: center;
    margin-bottom: 30px;
    position: relative;
}

.login-box h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 80px;
    height: 3px;
    background: linear-gradient(to right, #3498DB, #2980B9);
}
		
        .login-box .form-control {
            background: rgba(255, 255, 255, 0.7);
            border: 1px solid #B0E0E6;
            color: #4682B4;
        }

      

        .login-box .btn-primary{
            background-color: #4682B4;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <%@include file="component/navbar.jsp" %>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="login-box">
                    <h2>Doctor Login</h2>
                    
                     
                       	<c:if test="${not empty succMsg }">
							<p class="text-center text-success fs-5">${succMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						
                    <form action="doctorLogin" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email Address</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>

                     

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary col-md-12">
                                Login
                            </button>
                        </div>

                    
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%@include file="component/footer.jsp" %>
    
</body>
</html>