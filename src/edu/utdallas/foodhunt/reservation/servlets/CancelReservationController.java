package edu.utdallas.foodhunt.reservation.servlets;

import edu.utdallas.foodhunt.reservation.businesslayer.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class CancelReservationController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String reservationID = request.getParameter("id");
        ReservationService reservationService = new ReservationService();
        Boolean isCancelled = reservationService.cancelReservation(reservationID);
        request.setAttribute("reservations", new ReservationService().getReservations());
        if (isCancelled) {

            request.getRequestDispatcher("myBookings.jsp").forward(request, response);
        } else {

            request.getRequestDispatcher("myBookings.jsp").forward(request, response);
        }

    }

}
