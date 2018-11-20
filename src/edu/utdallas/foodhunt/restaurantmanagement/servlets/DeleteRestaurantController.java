package edu.utdallas.foodhunt.restaurantmanagement.servlets;

import edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class DeleteRestaurantController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String restaurantID = request.getParameter("id");
        RestaurantService restaurantService = new RestaurantService();
        boolean deleteRestaurant = restaurantService.deleteRestaurant(restaurantID);
        if (deleteRestaurant) {
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);
        }
    }


}
