package edu.utdallas.foodhunt.reservation.servlets;

import edu.utdallas.foodhunt.reservation.businesslayer.ReservationService;
import edu.utdallas.foodhunt.reservation.datalayer.entity.Reservation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

public class ModifyReservationController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String reservationID = request.getParameter("id");
        String newBookingDate = request.getParameter("bookingDate");
        String newBookingTime =  request.getParameter("bookingTime");
        Reservation reservation = new Reservation();
        reservation.setReservationID(Integer.parseInt(reservationID));
        reservation.setBookingDate(Date.valueOf(newBookingDate));
        reservation.setBookingTime(Time.valueOf(newBookingTime));
        ReservationService reservationService = new ReservationService();
        boolean isModified= reservationService.modifyReservation(reservation);
        request.setAttribute("reservations", new ReservationService().getReservations());
        if (isModified) {
            session.setAttribute("modifyResMsg", "success");
            request.getRequestDispatcher("myBookings.jsp").forward(request, response);
        } else {
            session.setAttribute("modifyResMsg", "fail");
            request.getRequestDispatcher("myBookings.jsp").forward(request, response);
        }
    }
}
