package edu.utdallas.foodhunt.usermanagement.servlet;

import edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService;
import edu.utdallas.foodhunt.usermanagement.datalayer.dao.UserDao;
import edu.utdallas.foodhunt.usermanagement.datalayer.entity.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(true);
        UserDao userDao = new UserDao();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Boolean userType = username.equals("admin") ? true : false;
        String submitType = request.getParameter("submit");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setAdmin(userType);
        User validUser = userDao.validateUser(user);

        if (submitType.equals("login") && validUser != null && validUser.getUsername() != null && validUser.getActive()) {
            session.setAttribute("userName",validUser.getUsername());
            request.setAttribute("MSG","User logged in successfully");
            request.setAttribute("restaurants", new RestaurantService().getRestaurants());
            if (validUser.getAdmin()) {
                request.getRequestDispatcher("adminHome.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("userHome.jsp").forward(request, response);
            }

        } else if (submitType.equals("login") && validUser != null && validUser.getUsername() != null && !validUser.getActive()) {
            request.setAttribute("message", "Sorry! You are no more an active user. Please contact helpdesk!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (submitType.equals("register")) {
            validUser.setUsername(request.getParameter("username"));
            validUser.setPassword(request.getParameter("password"));
            validUser.setAdmin(userType);
            if (userDao.register(validUser)>0) {
                request.setAttribute("successMessage", "Registration done, please login!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (userDao.register(validUser)==0) {
                request.setAttribute("message", "Sorry! Some error occurred in the database.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            else{
                request.setAttribute("message", "Sorry! This username is already in use. Please use a different username.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("message", "Data Not Found! Please register!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

}
