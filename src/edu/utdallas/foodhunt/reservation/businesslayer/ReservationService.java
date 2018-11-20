package edu.utdallas.foodhunt.reservation.businesslayer;

import edu.utdallas.foodhunt.reservation.datalayer.dao.ReservationDao;
import edu.utdallas.foodhunt.reservation.datalayer.entity.Reservation;
import edu.utdallas.foodhunt.restaurantmanagement.datalayer.dao.RestaurantDao;

import java.util.List;

public class ReservationService {
    private ReservationDao reservationDao;
    private RestaurantDao restaurantDao;

    public ReservationService() {
        reservationDao = new ReservationDao();
        restaurantDao = new RestaurantDao();
    }

    public List<Reservation> getReservations() {
        return reservationDao.getReservations();
    }

    public boolean cancelReservation(String reservationID) {
        return reservationDao.cancelReservation(reservationID);
    }

    public boolean addReservation(Reservation reservation) {

        return !reservationDao.isAlreadyActiveReservation(reservation) && checkRestaurantAvailability(reservation) && reservationDao.addReservation(reservation);
    }

    public boolean modifyReservation(Reservation reservation){
        return !reservationDao.isAlreadyActiveReservation(reservation) && checkRestaurantAvailability(reservation) && reservationDao.modifyReservation(reservation);
    }

    public boolean checkRestaurantAvailability(Reservation reservation) {
        List<Reservation> reservationList = reservationDao.getReservations();
        int totalFilledSeats = 0;
        boolean flag = false;
        for (Reservation reservation1 : reservationList) {
            if ((reservation1.getRestaurantID() == reservation.getRestaurantID()) && (reservation1.getBookingDate().getTime() == (reservation.getBookingDate().getTime()))) {
                flag = true;
                System.out.println("required: "+reservation.getBookingTime().getTime());
                System.out.println("already there: "+reservation1.getBookingTime().getTime());
                if (((reservation.getBookingTime().getTime() - 1800000) <= reservation1.getBookingTime().getTime()) || ((reservation.getBookingTime().getTime() + 1800000) <= reservation1.getBookingTime().getTime())) {
                    totalFilledSeats += reservation1.getBookedSeats();
                }
            }
        }
        if (!flag) {
            return true;
        }
        int seatCapacity = restaurantDao.getRestaurant(String.valueOf(reservation.getRestaurantID())).getSeatCapacity();
        if (reservation.getBookedSeats() + totalFilledSeats <= seatCapacity) {
            return true;
        }
        return false;
    }

}
