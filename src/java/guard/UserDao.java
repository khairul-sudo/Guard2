/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package guard;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    
    public List<Staff> getStaffList(String keyword) throws SQLException, ClassNotFoundException {
        List<Staff> list = new ArrayList<>();
        String sql = "SELECT * FROM staff WHERE CAST(AdministratoradminID AS CHAR) LIKE ? OR CAST(GuardguardID AS CHAR) LIKE ? OR ICnumber LIKE ? ORDER BY AdministratoradminID";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            String likeKeyword = "%" + keyword + "%";
            ps.setString(1, likeKeyword);
            ps.setString(2, likeKeyword);
            ps.setString(3, likeKeyword);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Staff staff = new Staff();
                    staff.setAdministratorAdminID(rs.getInt("AdministratoradminID"));
                    staff.setGuardGuardID(rs.getInt("GuardguardID"));
                    staff.setIcNumber(rs.getString("ICnumber"));
                    staff.setPhoneNumber(rs.getString("phoneNumber"));
                    list.add(staff);
                }
            }
        }
        return list;
    }

    public Staff getStaffById(int administratorAdminID, int guardGuardID) throws SQLException, ClassNotFoundException {
        Staff staff = null;
        String sql = "SELECT * FROM staff WHERE AdministratoradminID = ? AND GuardguardID = ?";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, administratorAdminID);
            ps.setInt(2, guardGuardID);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    staff = new Staff();
                    staff.setAdministratorAdminID(rs.getInt("AdministratoradminID"));
                    staff.setGuardGuardID(rs.getInt("GuardguardID"));
                    staff.setIcNumber(rs.getString("ICnumber"));
                    staff.setPhoneNumber(rs.getString("phoneNumber"));
                }
            }
        }
        return staff;
    }

    public boolean addStaff(Staff staff) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO staff (AdministratoradminID, GuardguardID, ICnumber, phoneNumber) VALUES (?, ?, ?, ?)";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, staff.getAdministratorAdminID());
            ps.setInt(2, staff.getGuardGuardID());
            ps.setString(3, staff.getIcNumber());
            ps.setString(4, staff.getPhoneNumber());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateStaff(Staff staff) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE staff SET ICnumber = ?, phoneNumber = ? WHERE AdministratoradminID = ? AND GuardguardID = ?";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, staff.getIcNumber());
            ps.setString(2, staff.getPhoneNumber());
            ps.setInt(3, staff.getAdministratorAdminID());
            ps.setInt(4, staff.getGuardGuardID());
            return ps.executeUpdate() > 0;
        }
    }
    
    public boolean administratorExists(int adminID) throws SQLException, ClassNotFoundException {
        String sql = "SELECT 1 FROM administrator WHERE adminID = ?";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, adminID);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();  
            }
        }
    }
    
    public boolean guardExists(int guardID) throws SQLException, ClassNotFoundException {
        String sql = "SELECT 1 FROM guard WHERE guardID = ?";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, guardID);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    public boolean deleteStaff(int administratorAdminID, int guardGuardID) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM staff WHERE AdministratoradminID = ? AND GuardguardID = ?";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, administratorAdminID);
            ps.setInt(2, guardGuardID);
            return ps.executeUpdate() > 0;
        }
    }

    public String exportStaffToCSV() throws SQLException, ClassNotFoundException {
        StringBuilder csv = new StringBuilder("AdministratoradminID,GuardguardID,ICnumber,PhoneNumber\n");
        String sql = "SELECT * FROM staff ORDER BY AdministratoradminID, GuardguardID";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                csv.append(rs.getInt("AdministratoradminID")).append(",");
                csv.append(rs.getInt("GuardguardID")).append(",");
                csv.append(rs.getString("ICnumber")).append(",");
                csv.append(rs.getString("phoneNumber")).append("\n");
            }
        }
        return csv.toString();
    }
    
    public boolean locationExists(int locationID) throws SQLException, ClassNotFoundException {
        String sql = "SELECT 1 FROM location WHERE locationID = ?";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, locationID);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
    
    // Insert new patrol session on check-in, returning the generated session ID
    public int addPatrolCheckin(int guardId, int locationId) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO patrollingsession (guardID, locationID, checkinTime) VALUES (?, ?, CURRENT_TIMESTAMP)";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, guardId);
            ps.setInt(2, locationId);
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1); // Return generated patrollingSessionID
                }
            }
        }
        return -1; // failed insert
    }
    
    // Get open session id (checkin done but no checkout yet) for guard & location
    public Integer getOpenSessionId(int guardId, int locationId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT patrollingSessionID FROM patrollingsession WHERE guardID = ? AND locationID = ? AND checkoutTime IS NULL LIMIT 1";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, guardId);
            ps.setInt(2, locationId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("patrollingSessionID");
                }
            }
        }
        return null;
    }
    
    // Update patrol session on checkout with checkout time, summary, and incident
    public boolean updatePatrolCheckout(int sessionId, String summary, String incident) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE patrollingsession SET checkoutTime = CURRENT_TIMESTAMP, summary = ?, incident = ? WHERE patrollingSessionID = ?";
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, summary);
            ps.setString(2, incident);
            ps.setInt(3, sessionId);
            return ps.executeUpdate() > 0;
        }
    }
    
    // Get patrol session details by session ID
    public PatrolSession getPatrolSessionById(int sessionId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM patrollingsession WHERE patrollingSessionID = ?";
        PatrolSession session = null;
        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, sessionId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    session = new PatrolSession();
                    session.setPatrollingSessionID(rs.getInt("patrollingSessionID"));
                    session.setGuardID(rs.getInt("guardID"));
                    session.setLocationID(rs.getInt("locationID"));
                    session.setCheckinTime(rs.getTimestamp("checkinTime"));
                    session.setCheckoutTime(rs.getTimestamp("checkoutTime"));
                    session.setSummary(rs.getString("summary"));
                    session.setIncident(rs.getString("incident"));
                }
            }
        }
        return session;
    }
}

