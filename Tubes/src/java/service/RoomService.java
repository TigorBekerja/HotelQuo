/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;
import applications.JDBC;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Room;
/**
 *
 * @author vandi
 */
public class RoomService {
    JDBC db = new JDBC();
    
    public ArrayList<Room> getAllRoom(String hotel_id) {
        ArrayList<Room> arr_room = new ArrayList<>();
        try {
            ResultSet rs = db.getData("select * from rooms where hotel_id = '" + hotel_id + "'");
            while(rs.next()) {
                Room room = new Room (
                        rs.getString("room_id"),
                        rs.getString("hotel_id"),
                        rs.getString("type"),
                        rs.getFloat("price"),
                        rs.getString("description"),
                        rs.getString("image_url")
                );
                arr_room.add(room);
            }
            return arr_room;
        }catch (Exception e) {
            System.out.println("Error fetching hotels: " + e.getMessage());
        }
        return null;
    }
    public Room getRoomByID(String room_id) {
        try {
            ResultSet rs = db.getData("select * from rooms where room_id = '" + room_id + "'");
            Room room = null;
            while(rs.next()) {
                room = new Room (
                        rs.getString("room_id"),
                        rs.getString("hotel_id"),
                        rs.getString("type"),
                        rs.getFloat("price"),
                        rs.getString("description"),
                        rs.getString("image_url")
                );
                return room;
            }
            return room;
        } catch (Exception e) {
            return null;
        }
    }
}
