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

public class EditMenuItemVisibilityController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String menuId = request.getParameter("menuId");
        RestaurantService restaurantService = new RestaurantService();
        Menu menu = restaurantService.getMenuItem(menuId);
        boolean flag = menu.isActive();
        if (restaurantService.editMenuItemVisibility(menuId, !flag)) {
            request.setAttribute("menuItems", restaurantService.getMenuItems(String.valueOf(menu.getRestaurantId())));
            session.setAttribute("menuEditVisibilityMessage", "success");
            request.getRequestDispatcher("restaurantDetail.jsp").forward(request, response);
        } else {
            session.setAttribute("menuEditVisibilityMessage", "fail");
            request.getRequestDispatcher("restaurantDetail.jsp").forward(request, response);
        }
    }


}