/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;
import model.Booking;
import applications.JDBC;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
/**
 *
 * @author vandi
 */
public class BookingService {
    JDBC db = new JDBC();
    
    public ArrayList<Booking> getAllBooking(String user_id) {
        ArrayList<Booking> arr_booking = new ArrayList<>();
        try {
            ResultSet rs = db.getData("select * from bookings where user_id = '" + user_id + "'");
            while(rs.next()) {
                Booking booking = new Booking(
                        rs.getString("booking_id"),
                        rs.getString("user_id"),
                        rs.getString("room_id"),
                        rs.getDate("check_in"),
                        rs.getDate("check_out"),
                        rs.getString("status"),
                        rs.getFloat("price")
                );
                arr_booking.add(booking);
            }
            return arr_booking;
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public void book(Booking book) {
        try {
            db.runQuery("insert into bookings (user_id, room_id, check_in, check_out, status, price)"
                    + "values ('" + book.getUser_id() + "','" + book.getRoom_id() + "','" + 
                    book.getCheck_in() + "','" + book.getCheck_out() + "','" + book.getStatus()+"','" +
                    book.getPrice()+"');");
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public void delBook(String book_id) {
        try {
            db.runQuery("delete from bookings where booking_id = " + book_id);
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
