package DAO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import BEAN.RoomType;

public class RoomTypeDao {

    public Map<String, RoomType> getAllRoomTypes() {
        Map<String, RoomType> roomTypes = new HashMap<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Database.loadDriver();
            con = Database.getConnection();

            String sql = "SELECT id, type_name, description, base_price, bed_type FROM room_type";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String id = rs.getString("id");
                String typeName = rs.getString("type_name");
                String description = rs.getString("description");
                Integer basePrice = rs.getInt("base_price");
                String bedType = rs.getString("bed_type");

                RoomType roomType = new RoomType(id, typeName, description, basePrice, bedType);
                roomTypes.put(id, roomType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return roomTypes;
    }
}
