package edu.utdallas.foodhunt.search.servlets;

import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant;
import edu.utdallas.foodhunt.search.businesslayer.SearchService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class AlternateSearchController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double latitude = Double.parseDouble(request.getParameter("latitude"));
        double longitude = Double.parseDouble(request.getParameter("longitude"));
        String restaurantId = request.getParameter("restaurantId");

        List<Restaurant> restaurants = new SearchService().searchAlternateRestaurants(restaurantId,latitude,longitude);

        if(restaurants != null && restaurants.size() > 0){
            request.setAttribute("restaurants", restaurants);
            request.getRequestDispatcher("userHome.jsp").forward(request,response);
        }
    }
}
