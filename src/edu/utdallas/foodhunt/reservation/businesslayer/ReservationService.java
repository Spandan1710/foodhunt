package edu.utdallas.foodhunt.reservation.businesslayer;

import edu.utdallas.foodhunt.reservation.datalayer.dao.ReservationDao;
import edu.utdallas.foodhunt.reservation.datalayer.entity.Reservation;

import java.util.List;

public class ReservationService {
    private ReservationDao reservationDao;
    public ReservationService(){
        reservationDao=new ReservationDao();
    }

    public List<Reservation> getReservations(){
        return reservationDao.getReservations();
    }

    public boolean cancelReservation(String reservationID){
        return reservationDao.cancelReservation(reservationID);
    }

    public boolean addReservation(Reservation reservation){
        return reservationDao.addReservation(reservation);
    }
}
