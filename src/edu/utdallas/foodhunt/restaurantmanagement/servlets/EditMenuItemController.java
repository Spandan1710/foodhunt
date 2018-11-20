package edu.utdallas.foodhunt.restaurantmanagement.servlets;

import edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService;
import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Menu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditMenuItemController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String menuItem = request.getParameter("menuName");
        String cuisine = request.getParameter("type");
        double menuPrice = Double.parseDouble(request.getParameter("menuPrice"));
        String menuId = request.getParameter("menuID");
        RestaurantService restaurantService = new RestaurantService();
        Menu menu = restaurantService.getMenuItem(menuId);
        menu.setMenuItem(menuItem);
        menu.setCuisine(cuisine);
        menu.setMenuPrice(menuPrice);
        if (restaurantService.updateMenuItem(menu)) {
            request.setAttribute("menuItems", restaurantService.getMenuItems(String.valueOf(menu.getRestaurantId())));
            request.setAttribute("restaurantID", String.valueOf(menu.getRestaurantId()));
            session.setAttribute("menuEditMessage", "success");
            request.getRequestDispatcher("restaurantDetail.jsp").forward(request, response);
        } else {
            session.setAttribute("menuEditMessage", "fail");
            request.getRequestDispatcher("restaurantDetail.jsp").forward(request, response);
        }
    }

}
