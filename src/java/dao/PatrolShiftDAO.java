/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
import java.util.*;
import model.PatrolShift;

public class PatrolShiftDAO {
    public static List<PatrolShift> getAll() {
        List<PatrolShift> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM patrolshift");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PatrolShift psf = new PatrolShift();
                psf.setPatrolShiftID(rs.getInt("patrolShiftID"));
                psf.setStartTime(rs.getString("startTime"));
                psf.setEndTime(rs.getString("endTime"));
                psf.setGuardID(rs.getInt("guardID"));
                psf.setAdminID(rs.getInt("adminID"));
                list.add(psf);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}