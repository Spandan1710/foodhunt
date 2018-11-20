package edu.utdallas.foodhunt.restaurantmanagement.servlets;

import edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService;
import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Menu;
import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddMenuItemController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String menuItem = request.getParameter("menuName");
        String cuisine = request.getParameter("type");
        double menuPrice = Double.parseDouble(request.getParameter("Price"));
        String restaurantID = request.getParameter("restaurantID");
        String submitType = request.getParameter("submit");
        Menu menu = new Menu();
        menu.setMenuItem(menuItem);
        menu.setCuisine(cuisine);
        menu.setMenuPrice(menuPrice);
        menu.setRestaurantId(Integer.parseInt(restaurantID));
        RestaurantService restaurantService = new RestaurantService();
        if (submitType.equals("addMenuItem") && restaurantService.addMenuItem(menu)) {
            request.setAttribute("menuItems", restaurantService.getMenuItems(String.valueOf(menu.getRestaurantId())));
            session.setAttribute("menuMessage", "success");
            request.getRequestDispatcher("restaurantDetail.jsp?restaurantID=" + restaurantID).forward(request, response);
        } else {
            session.setAttribute("menuMessage", "fail");
            request.getRequestDispatcher("restaurantDetail.jsp?restaurantID=" + restaurantID).forward(request, response);
        }
    }
}
