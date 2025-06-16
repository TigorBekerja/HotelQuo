/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;

/**
 *
 * @author vandi
 */
public class Booking {
    private String booking_id;
    private String user_id;
    private String room_id;
    private Date check_in;
    private Date check_out;
    private String status;
    private float price;

    public Booking(String booking_id, String user_id, String room_id, Date check_in, Date check_out, String status, float price) {
        this.booking_id = booking_id;
        this.user_id = user_id;
        this.room_id = room_id;
        this.check_in = check_in;
        this.check_out = check_out;
        this.status = status;
        this.price = price;
    }

    public Booking(String user_id, String room_id, Date check_in, Date check_out, String status, float price) {
        this.user_id = user_id;
        this.room_id = room_id;
        this.check_in = check_in;
        this.check_out = check_out;
        this.status = status;
        this.price = price;
    }

    public String getBooking_id() {
        return booking_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getRoom_id() {
        return room_id;
    }

    public Date getCheck_in() {
        return check_in;
    }

    public Date getCheck_out() {
        return check_out;
    }

    public String getStatus() {
        return status;
    }

    public float getPrice() {
        return price;
    }

    public void setBooking_id(String booking_id) {
        this.booking_id = booking_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public void setCheck_in(Date check_in) {
        this.check_in = check_in;
    }

    public void setCheck_out(Date check_out) {
        this.check_out = check_out;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setPrice(float price) {
        this.price = price;
    }
}
