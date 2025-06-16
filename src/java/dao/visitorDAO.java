package dao;

import DB.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import user.Visitor;

public class visitorDAO {

    private static final String INSERT_SQL = "INSERT INTO visitor (Name, IC, Address, Purpose, visit_datetime, userID) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL = "SELECT * FROM visitor";
    private static final String DELETE_SQL = "DELETE FROM visitor WHERE visitorID=?";
    private static final String UPDATE_SQL = "UPDATE visitor SET Name=?, IC=?, Address=?, Purpose=? WHERE visitorID=?";
    private static final String SELECT_BY_ID = "SELECT * FROM visitor WHERE visitorID=?";

    protected Connection getConnection() throws SQLException {
        try {
            return DBConnection.getConnection();
        } catch (Exception ex) {
            Logger.getLogger(visitorDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void insertVisitor(Visitor visitor, String userID) throws SQLException {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(INSERT_SQL)) {
            ps.setString(1, visitor.getName());
            ps.setString(2, visitor.getIc());
            ps.setString(3, visitor.getAddress());
            ps.setString(4, visitor.getPurpose());
            ps.setString(5, visitor.getVisitDateTime());
            ps.setString(6, userID);
            ps.executeUpdate();
        }
    }

    public List<Visitor> selectAllVisitors() throws SQLException {
        List<Visitor> visitors = new ArrayList<>();
        try (Connection con = getConnection(); Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(SELECT_ALL);
            while (rs.next()) {
                Visitor v = new Visitor();
                v.setId(rs.getInt("visitorID"));
                v.setName(rs.getString("Name"));
                v.setIc(rs.getString("IC"));
                v.setAddress(rs.getString("Address"));
                v.setPurpose(rs.getString("Purpose"));
                v.setUserID(rs.getString("userID"));
                v.setVisitDateTime(rs.getString("visit_datetime"));
                visitors.add(v);
            }
        }
        return visitors;
    }

    public void deleteVisitor(int id) throws SQLException {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(DELETE_SQL)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public void updateVisitor(Visitor v) throws SQLException {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(UPDATE_SQL)) {
            ps.setString(1, v.getName());
            ps.setString(2, v.getIc());
            ps.setString(3, v.getAddress());
            ps.setString(4, v.getPurpose());
            ps.setInt(5, v.getId());
            ps.executeUpdate();
        }
    }

    public Visitor selectVisitor(int id) throws SQLException {
        Visitor v = null;
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(SELECT_BY_ID)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                v = new Visitor();
                v.setId(rs.getInt("visitorID"));
                v.setName(rs.getString("Name"));
                v.setIc(rs.getString("IC"));
                v.setAddress(rs.getString("Address"));
                v.setPurpose(rs.getString("Purpose"));
                v.setUserID(rs.getString("userID"));
            }
        }
        return v;
    }

    public List<Visitor> searchVisitors(String keyword) throws SQLException {
        List<Visitor> visitors = new ArrayList<>();
        String SEARCH_SQL = "SELECT * FROM visitor WHERE Name LIKE ? OR IC LIKE ? OR Purpose LIKE ?";

        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(SEARCH_SQL)) {
            String searchPattern = "%" + keyword + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ps.setString(3, searchPattern);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Visitor v = new Visitor();
                v.setId(rs.getInt("visitorID"));
                v.setName(rs.getString("Name"));
                v.setIc(rs.getString("IC"));
                v.setAddress(rs.getString("Address"));
                v.setPurpose(rs.getString("Purpose"));
                v.setUserID(rs.getString("userID"));
                v.setVisitDateTime(rs.getString("visit_datetime"));
                visitors.add(v);
            }
        }
        return visitors;
    }

    public List<Visitor> selectVisitorsWithPagination(int offset, int limit) throws SQLException {
        List<Visitor> visitors = new ArrayList<>();
        String sql = "SELECT * FROM visitor LIMIT ? OFFSET ?";

        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, limit);
            ps.setInt(2, offset);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Visitor v = new Visitor();
                v.setId(rs.getInt("visitorID"));
                v.setName(rs.getString("Name"));
                v.setIc(rs.getString("IC"));
                v.setAddress(rs.getString("Address"));
                v.setPurpose(rs.getString("Purpose"));
                v.setUserID(rs.getString("userID"));
                v.setVisitDateTime(rs.getString("visit_datetime"));
                visitors.add(v);
            }
        }
        return visitors;
    }

    public int countVisitors() throws SQLException {
        String sql = "SELECT COUNT(*) FROM visitor";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    // ✅ NEW: Search with pagination
    public List<Visitor> searchVisitorsWithPagination(String keyword, int offset, int limit) throws SQLException {
        List<Visitor> visitors = new ArrayList<>();
        String sql = "SELECT * FROM visitor WHERE Name LIKE ? OR IC LIKE ? OR Purpose LIKE ? LIMIT ? OFFSET ?";

        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            String searchPattern = "%" + keyword + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ps.setString(3, searchPattern);
            ps.setInt(4, limit);
            ps.setInt(5, offset);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Visitor v = new Visitor();
                v.setId(rs.getInt("visitorID"));
                v.setName(rs.getString("Name"));
                v.setIc(rs.getString("IC"));
                v.setAddress(rs.getString("Address"));
                v.setPurpose(rs.getString("Purpose"));
                v.setUserID(rs.getString("userID"));
                v.setVisitDateTime(rs.getString("visit_datetime"));
                visitors.add(v);
            }
        }
        return visitors;
    }

    // ✅ NEW: Count search results
    public int countSearchVisitors(String keyword) throws SQLException {
        String sql = "SELECT COUNT(*) FROM visitor WHERE Name LIKE ? OR IC LIKE ? OR Purpose LIKE ?";
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            String searchPattern = "%" + keyword + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            ps.setString(3, searchPattern);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
}
