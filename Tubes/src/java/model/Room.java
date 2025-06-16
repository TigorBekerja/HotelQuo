/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vandi
 */
public class Room {
    private String room_id;
    private String hotel_id;
    private String type;
    private float price;
    private String description;
    private String image_url;

    public Room(String room_id, String hotel_id, String type, float price, String description, String image_url) {
        this.room_id = room_id;
        this.hotel_id = hotel_id;
        this.type = type;
        this.price = price;
        this.description = description;
        this.image_url = image_url;
    }

    public String getRoom_id() {
        return room_id;
    }

    public String getHotel_id() {
        return hotel_id;
    }

    public String getType() {
        return type;
    }

    public float getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public void setHotel_id(String hotel_id) {
        this.hotel_id = hotel_id;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }
}
