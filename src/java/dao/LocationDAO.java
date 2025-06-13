/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.Location;

public class LocationDAO {
    public static List<Location> getAll() {
        List<Location> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM location");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Location loc = new Location();
                loc.setLocationID(rs.getInt("locationID"));
                loc.setName(rs.getString("name"));
                loc.setAddress(rs.getString("address"));
                loc.setAdminID(rs.getInt("adminID"));
                loc.setGuardID(rs.getInt("guardID"));
                list.add(loc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}