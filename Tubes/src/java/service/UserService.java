/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;
import model.User;
import applications.JDBC;
import java.sql.ResultSet;
import java.sql.Date;
/**
 *
 * @author vandi
 */
public class UserService {
    public JDBC db = new JDBC();
    
    public void saveUser(User user) {
        try {
            db.runQuery("insert into user (username, password, email) values "
                    + "('" + user.getUsername()+ "', '" + user.getPassword()+"', '" 
                    + user.getEmail()+"');");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public User searchUser(String email) {
        try {
            ResultSet rs = db.getData("select * from user where email = '" + email+"'");
            if (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String full_name = rs.getString("full_name");
                Date DOB = rs.getDate("DOB");
                String phone_number = rs.getString("phone_number");
                String country = rs.getString("country");
                return new User(username,password, full_name, email, DOB, phone_number, country);
            }
            return null;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    public void editUser(User user) {
        try {
            String sqlStatement = "update user set ";
            sqlStatement += "full_name = '" + user.getFull_name()+ "', ";
            sqlStatement += "country = '" + user.getCountry()+ "', ";
            sqlStatement += "DOB = '" + user.getDOB()+ "', ";
            sqlStatement += "phone_number = '" + user.getPhone_number()+ "' ";
            sqlStatement += "where email = '" + user.getEmail() + "';";
            db.runQuery(sqlStatement);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    public String getUserID(String email) {
        try {
            ResultSet rs = db.getData("select * from user where email = '" + email+"'");
            if (rs.next()) {
                return rs.getString("id");
            }
            return rs.getString("id");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "";
        }
    }
}
