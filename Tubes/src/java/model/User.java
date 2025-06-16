/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.Date;
import java.util.Objects;
/**
 *
 * @author vandi
 */
public class User {
    private String user_id;
    private String username;
    private String password;
    private String full_name;
    private String email;
    private Date DOB;
    private String phone_number;
    private String country;

    public User(String user_id, String username, String password, String full_name, String email, Date DOB, String phone_number, String country) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.full_name = full_name;
        this.email = email;
        this.DOB = DOB;
        this.phone_number = phone_number;
        this.country = country;
    }
    
    public User(String username, String password, String full_name, String email, Date DOB, String phone_number, String country) {
        this.username = username;
        this.password = password;
        this.full_name = full_name;
        this.email = email;
        this.DOB = DOB;
        this.phone_number = phone_number;
        this.country = country;
    }

    // buat edit
    public User(String username, String full_name, String email, Date DOB, String phone_number, String country) {
        this.username = username;
        this.full_name = full_name;
        this.email = email;
        this.DOB = DOB;
        this.phone_number = phone_number;
        this.country = country;
    }
    
    public User(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public User(){
    }
    
    public String getUser_id() {
        return user_id;
    }
    
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int hashCode(String password) {
        int hash = 7919;
        hash = 6829 * hash + Objects.hashCode(password);
        return hash;
    }

    public boolean equals(String password) {
        return Objects.equals(this.password, hashCode(password));
    }
    
    public String getFull_name() {
        return full_name;
    }

    public String getEmail() {
        return email;
    }

    public Date getDOB() {
        return DOB;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public String getCountry() {
        return country;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    
    
}
