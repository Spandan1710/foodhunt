package edu.utdallas.foodhunt.reservation.datalayer.dao;

import edu.utdallas.foodhunt.reservation.datalayer.entity.Reservation;
import edu.utdallas.foodhunt.utils.db.DBUtils;

import java.beans.ExceptionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ReservationDao {
    private Connection conn;
    private PreparedStatement ps;

    public ReservationDao() {
        conn = DBUtils.getDbConnection();
        ps = null;
    }

    public boolean cancelReservation(String reservationID) {
        try {
            ps = conn.prepareStatement("update reservation set isCancelled=true where id=?");
            ps.setInt(1, Integer.parseInt(reservationID));
            int result = ps.executeUpdate();
            if (result > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public List<Reservation> getReservations() {

        List<Reservation> reservations = new ArrayList<>();
        try {
            ps = conn.prepareStatement("select * from reservation where isCancelled=FALSE ");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setReservationID(rs.getInt(1));
                reservation.setUsername(rs.getString(2));
                reservation.setRestaurantID(rs.getInt(3));
                reservation.setBookingDate(rs.getDate(4));
                reservation.setBookingTime(rs.getTime(5));
                reservation.setBookedSeats(rs.getInt(6));
                reservation.setFeedback(rs.getString(7));
                reservation.setCancelled(rs.getBoolean(8));
                reservations.add(reservation);
            }
            return reservations;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean addReservation(Reservation reservation) {
        try {
            ps = conn.prepareStatement("insert into reservation(username,restaurant_id,booking_date,booking_time,booked_seats,feedback) values (?,?,?,?,?,?)");
            ps.setString(1,reservation.getUsername());
            ps.setInt(2,reservation.getRestaurantID());
            ps.setDate(3,reservation.getBookingDate());
            ps.setTime(4,reservation.getBookingTime());
            ps.setInt(5,reservation.getBookedSeats());
            ps.setString(6,reservation.getFeedback());
            return ps.executeUpdate() >0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    @Override
    protected void finalize() throws Throwable {
        conn.close();
    }
}
