package edu.utdallas.foodhunt.search.servlets;

import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant;
import edu.utdallas.foodhunt.search.businesslayer.SearchService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class PageController extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNo =Integer.parseInt(request.getParameter("pageNo"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String keyword = request.getParameter("keyword");
        List<Restaurant> restaurants = new SearchService().getPageOfRestaurant(pageNo,pageSize);

        request.setAttribute("restaurants", restaurants);
        request.getRequestDispatcher("userHome.jsp").forward(request, response);

    }
}
