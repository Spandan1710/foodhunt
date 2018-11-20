package edu.utdallas.foodhunt.usermanagement.servlet;

import edu.utdallas.foodhunt.usermanagement.businesslayer.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class AddMembershipController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String username = (String) session.getAttribute("userName");
        UserService userService = new UserService();
        if (userService.setPremiumMembership(username)) {
            session.setAttribute("premMsg", "success");
            session.setAttribute("isUserPremium","True");
            request.getRequestDispatcher("userHome.jsp").forward(request, response);
        } else {
            session.setAttribute("premMsg", "fail");
            request.getRequestDispatcher("userHome.jsp").forward(request, response);
        }
    }
}
