/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author vandi
 */
public class Hotel {
    private String id;
    private String name;
    private String location;
    private String description;
    private float rating;
    private String imageUrl;
    private String facilities; 
    private double price;

    public Hotel(String id, String name, String location, String description, float rating, String imageUrl, String facilities, double price) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.description = description;
        this.rating = rating;
        this.imageUrl = imageUrl;
        this.facilities = facilities;
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getLocation() {
        return location;
    }

    public String getDescription() {
        return description;
    }

    public float getRating() {
        return rating;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getFacilities() {
        return facilities;
    }

    public double getPrice() {
        return price;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void setFacilities(String facilities) {
        this.facilities = facilities;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
    
}
