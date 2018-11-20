package edu.utdallas.foodhunt.restaurantmanagement.servlets;

import edu.utdallas.foodhunt.reservation.businesslayer.ReservationService;
import edu.utdallas.foodhunt.reservation.datalayer.entity.Reservation;
import edu.utdallas.foodhunt.restaurantmanagement.businesslayer.RestaurantService;
import edu.utdallas.foodhunt.restaurantmanagement.datalayer.entity.Restaurant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import javax.servlet.http.HttpSession;


public class MakeReservationController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        Date bookingDate = Date.valueOf(request.getParameter("bookingDate"));
        Time bookingTime = Time.valueOf(request.getParameter("bookingTime") + ":00");
        int bookingSeats = Integer.parseInt(request.getParameter("bookingSeats"));
        String feedback = request.getParameter("feedback");
        int restaurantID = Integer.parseInt(request.getParameter("id"));
        String username = session.getAttribute("userName").toString();
        Reservation reservation = new Reservation();
        reservation.setCancelled(false);
        reservation.setFeedback(feedback);
        reservation.setBookedSeats(bookingSeats);
        reservation.setBookingDate(bookingDate);
        reservation.setBookingTime(bookingTime);
        reservation.setRestaurantID(restaurantID);
        reservation.setUsername(username);
        ReservationService reservationService = new ReservationService();
        Boolean isReservationDone = reservationService.addReservation(reservation);
        request.setAttribute("restaurants", new RestaurantService().getRestaurants());
        if (!isReservationDone) {
            request.setAttribute("reservations", reservationService.getReservations());
            session.setAttribute("resMessage", "success");
            request.getRequestDispatcher("userHome.jsp").forward(request, response);
        } else {
            session.setAttribute("resMessage", "fail");
            request.setAttribute("restaurantId",restaurantID);
            request.getRequestDispatcher("userHome.jsp").forward(request, response);
        }
    }


}
