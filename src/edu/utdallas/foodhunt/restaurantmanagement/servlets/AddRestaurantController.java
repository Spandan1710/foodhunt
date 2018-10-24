package edu.utdallas.foodhunt.restaurantmanagement.servlets;

import edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService;
import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.io.IOException;
import java.sql.Time;


public class AddRestaurantController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String name = request.getParameter("name");
        String restaurantType = request.getParameter("type");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        int zip = Integer.parseInt(request.getParameter("zip"));
        String country = request.getParameter("country");
        double latitude = Double.parseDouble(request.getParameter("latitude"));
        double longitude = Double.parseDouble(request.getParameter("longitude"));
        String phone = request.getParameter("phone");
        float foodRating = Float.parseFloat(request.getParameter("foodrating"));
        float accessibilityRating = Float.parseFloat(request.getParameter("accessibilityrating"));
        float ambienceRating = Float.parseFloat(request.getParameter("ambiencerating"));
        float overallRating = Float.parseFloat(request.getParameter("overallrating"));
        Time openTime = Time.valueOf(request.getParameter("opentiming")+":00");
        Time closeTime = Time.valueOf(request.getParameter("closetiming")+":00");
        int seatCapacity = Integer.parseInt(request.getParameter("seatcapacity"));
        String tableArrangement = request.getParameter("tablearrangement");
        boolean homeDelivery = Boolean.parseBoolean(request.getParameter("homedelivery"));
        String tags = request.getParameter("tags");
        String pictureUrl = request.getParameter("picture");
        String submitType = request.getParameter("submit");
        Restaurant restaurant = new Restaurant();
        restaurant.setName(name);
        restaurant.setRestaurantType(restaurantType);
        restaurant.setAddress(address);
        restaurant.setCity(city);
        restaurant.setState(state);
        restaurant.setZip(zip);
        restaurant.setCountry(country);
        restaurant.setLatitude(latitude);
        restaurant.setLongitude(longitude);
        restaurant.setPhone(phone);
        restaurant.setFoodRating(foodRating);
        restaurant.setAccessibilityRating(accessibilityRating);
        restaurant.setAmbienceRating(ambienceRating);
        restaurant.setOverallRating(overallRating);
        restaurant.setOpenTime(openTime);
        restaurant.setCloseTime(closeTime);
        restaurant.setSeatCapacity(seatCapacity);
        restaurant.setTableArrangement(tableArrangement);
        restaurant.setHomeDelivery(homeDelivery);
        restaurant.setTags(tags);
        restaurant.setPictureUrl(pictureUrl);
        restaurant.setStatus(true);
        RestaurantService restaurantService = new RestaurantService();
        boolean addRestaurant = restaurantService.addRestaurant(restaurant);
        if (submitType.equals("Add") && addRestaurant) {
            request.setAttribute("restaurants", new RestaurantService().getRestaurants());
            session.setAttribute("rmessage", "success");
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);
        }
        else{
            session.setAttribute("rmessage", "fail");
            request.getRequestDispatcher("addRestaurant.jsp").forward(request, response);
        }

    }

}
