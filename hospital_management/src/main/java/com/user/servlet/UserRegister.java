package com.user.servlet;

import java.io.IOException;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get parameters from the registration form
            String fullName = req.getParameter("fullname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();
            UserDao dao = new UserDao(DBConnect.getConn());

            // Step 1: Check if the email already exists in the database
            if (dao.isEmailExist(email)) {
                // If the email exists, set error message and redirect back to the signup page
                session.setAttribute("errorMsg", "Email already exists. Please use a different email.");
                resp.sendRedirect("signup.jsp");
                return;
            }

            // Step 2: Validate password length (at least 8 characters)
            if (password.length() < 8) {
                // If password is less than 8 characters, set error message and redirect back
                session.setAttribute("errorMsg", "Password must be at least 8 characters long.");
                resp.sendRedirect("signup.jsp");
                return;
            }

            // Step 3: Create a new User object and register the user
            User u = new User(fullName, email, password);

            boolean registrationSuccess = dao.register(u);

            if (registrationSuccess) {
                // If registration is successful, set success message and redirect
                session.setAttribute("sucMsg", "Registration successful!");
                resp.sendRedirect("signup.jsp");
            } else {
                // If there is any issue with registration, set an error message
                session.setAttribute("errorMsg", "Something went wrong, please try again.");
                resp.sendRedirect("signup.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Handle exception and display a generic error message
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "An error occurred. Please try again.");
            resp.sendRedirect("signup.jsp");
        }
    }
}
