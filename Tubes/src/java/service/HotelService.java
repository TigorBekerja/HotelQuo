/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;
import model.Hotel;
import applications.JDBC;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author vandi
 */
public class HotelService {
    JDBC db = new JDBC();
    
    public ArrayList<Hotel> getAllHotels() {
        ArrayList<Hotel> hotels = new ArrayList<>();
        try {
            ResultSet rs = db.getData("select * from hotels");
            while (rs.next()) {
                Hotel hotel = new Hotel(
                    rs.getString("hotel_id"),
                    rs.getString("name"),
                    rs.getString("location"),
                    rs.getString("description"),
                    rs.getFloat("rating"),
                    rs.getString("image_url"),
                    rs.getString("facilities"),
                    rs.getDouble("price")
                );
                hotels.add(hotel);
            }
        } catch (Exception e) {
            System.out.println("Error fetching hotels: " + e.getMessage());
        }
        return hotels;
    }
    
    public ArrayList<Hotel> searchHotelsByLocation(String location) {
        ArrayList<Hotel> hotels = new ArrayList<>();
        try {
            String query = "SELECT * FROM hotels WHERE location LIKE '" + location + "';";
            ResultSet rs = db.getData(query);
            while (rs.next()) {
                Hotel hotel = new Hotel(
                    rs.getString("hotel_id"),
                    rs.getString("name"),
                    rs.getString("location"),
                    rs.getString("description"),
                    rs.getFloat("rating"),
                    rs.getString("image_url"),
                    rs.getString("facilities"),
                    rs.getDouble("price")
                );
                hotels.add(hotel);
            }
        } catch (Exception e) {
            System.out.println("Error searching hotels: " + e.getMessage());
        }
        return hotels;
    }
    public Hotel searchHotelByID(String id) {
        try {
            String query = "SELECT * FROM hotels WHERE hotel_id = '" + id + "'";
            ResultSet rs = db.getData(query);
            while (rs.next()) {
                Hotel hotel = new Hotel(
                    rs.getString("hotel_id"),
                    rs.getString("name"),
                    rs.getString("location"),
                    rs.getString("description"),
                    rs.getFloat("rating"),
                    rs.getString("image_url"),
                    rs.getString("facilities"),
                    rs.getDouble("price")
                );
                return hotel;
            }
        } catch (Exception e) {
            System.out.println("Error searching hotels: " + e.getMessage());
        }
        return null;
    }
}
