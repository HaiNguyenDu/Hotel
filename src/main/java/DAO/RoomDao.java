package DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import BEAN.Room;

public class RoomDao {

	public Map<Integer, List<Room>> getAllRoomsByFloor() {
		Map<Integer, List<Room>> roomsByFloor = new HashMap<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Database.loadDriver();
			con = Database.getConnection();

			String sql =
					"SELECT room.id AS id, " +
							"       booking.id AS bookingId, " +
							"       room.room_name AS room_name, " +
							"       booking.check_in_date AS checkin_date, " +
							"       booking.check_out_date AS checkout_date, " +
							"       customer.name AS customerName, " +
							"       customer.CCCD AS CCCD, " +
							"       room.status AS status, " +
							"       room.floor AS floor, " +
							"       room_type.id AS room_type_id, " +
							"       room_type.base_price AS base_price " +
							"FROM booking " +
							"JOIN booking_room ON booking.id = booking_room.booking_id " +
							"JOIN room ON booking_room.room_id = room.id " +
							"JOIN room_type ON room.room_type_id = room_type.id " +
							"JOIN customer ON booking.customer_id = customer.id " +
							"WHERE room.status <> 'Trống'";

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int floor = rs.getInt("floor");
				int base_price = rs.getInt("base_price");
				String roomId = rs.getString("id");
				String bookingId = rs.getString("bookingId");
				String roomName = rs.getString("room_name");
				String checkinDate = rs.getString("checkin_date");
				String checkoutDate = rs.getString("checkout_date");
				String customerName = rs.getString("customerName");
				String CCCD = rs.getString("CCCD");
				String status = rs.getString("status");
				String room_type_id = rs.getString("room_type_id");

				Room room = new Room(roomId, bookingId, roomName, checkinDate, checkoutDate, customerName, CCCD, status, room_type_id, base_price);
				roomsByFloor.computeIfAbsent(floor, k -> new ArrayList<>()).add(room);
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

		return roomsByFloor;
	}


	public List<Room> getAllRoomsActive() {
		List<Room> rooms = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Database.loadDriver();
			con = Database.getConnection();

			String sql = "SELECT room.id AS id, room.room_name AS room_name, " +
					"room.status AS status, room.floor AS floor, room_type.id as room_type_id, room_type.base_price as base_price, room.acreage as  acreage " +
					"FROM room " +
					"JOIN room_type ON room.room_type_id = room_type.id " +
					"WHERE room.status = 'Trống'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String roomId = rs.getString("id");
				String roomName = rs.getString("room_name");
				String status = rs.getString("status");
				String room_type_id = rs.getString("room_type_id");
				Integer base_price = rs.getInt("base_price");
				Integer acreage = rs.getInt("acreage");
				Room room = new Room(roomId, roomName, status, room_type_id, acreage, base_price);
				rooms.add(room);
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
		return rooms;
	}

	public List<Room> getAllRoomsWithType() {
		List<Room> rooms = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Database.loadDriver();
			con = Database.getConnection();

			String sql = "SELECT room.id AS roomId, room.room_name AS roomName, " +
					"room.status AS status, room.floor AS floor, room.acreage AS acreage, " +
					"room.description AS description, room_type.type_name AS roomTypeName, " +
					"room_type.base_price AS base_price " +
					"FROM room " +
					"JOIN room_type ON room.room_type_id = room_type.id";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String roomId = rs.getString("roomId");
				String roomName = rs.getString("roomName");
				String status = rs.getString("status");
				Integer floor = rs.getInt("floor");
				Integer acreage = rs.getInt("acreage");
				String description = rs.getString("description");
				String roomTypeName = rs.getString("roomTypeName");
				Integer basePrice = rs.getInt("base_price");

				Room room = new Room(roomId, roomName, status, floor, acreage, description, roomTypeName, basePrice);
				rooms.add(room);
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
		return rooms;
	}

	public List<Room> getAllRooms(Date checkinday, Date checkoutday) {
		List<Room> rooms = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		java.sql.Date sqlDatein = new java.sql.Date(checkinday.getTime());
		java.sql.Date sqlDateout = new java.sql.Date(checkoutday.getTime());
		try {
			Database.loadDriver();
			con = Database.getConnection();

			String sql = "SELECT \n" +
					"    room.id AS id, \n" +
					"    room.room_name AS room_name,\n" +
					"    room.status AS status, \n" +
					"    room.floor AS floor, \n" +
					"    room_type.id as room_type_id, \n" +
					"    room_type.base_price as base_price,                     \n" +
					"    room.acreage as acreage \n" +
					"FROM \n" +
					"    room  \n" +
					"LEFT JOIN \n" +
					"    booking_room \n" +
					"ON \n" +
					"    room.id = booking_room.room_id \n" +
					"LEFT JOIN \n" +
					"    room_type \n" +
					"ON \n" +
					"    room.room_type_id = room_type.id \n" +
					"WHERE \n" +
					"room.status ='Trống'; ";
			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {
				String roomId = rs.getString("id");
				String roomName = rs.getString("room_name");
				String status = rs.getString("status");
				String room_type_id = rs.getString("room_type_id");
				Integer base_price = rs.getInt("base_price");
				Integer acreage = rs.getInt("acreage");
				Room room = new Room(roomId, roomName, status, room_type_id, acreage, base_price);
				rooms.add(room);
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
		return rooms;
	}

	public Room findById(String id) {
			Room room = new Room();
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;

			try {
				Database.loadDriver();
				con = Database.getConnection();

				String sql = "SELECT room.id AS id, room.room_name AS room_name, " +
						"room.status AS status, room.floor AS floor, room_type.id as room_type_id, room_type.base_price as base_price, room.acreage as  acreage " +
						"FROM room " +
						"JOIN room_type ON room.room_type_id = room_type.id " +
						"WHERE room.id = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				rs = ps.executeQuery();

				while (rs.next()) {
					String roomId = rs.getString("id");
					String roomName = rs.getString("room_name");
					String status = rs.getString("status");
					String room_type_id = rs.getString("room_type_id");
					Integer base_price = rs.getInt("base_price");
					Integer acreage = rs.getInt("acreage");
					room = new Room(roomId, roomName, status, room_type_id, acreage, base_price);
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
			return room;
		}

	public boolean updateCheckinStatus(String roomId) {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			Database.loadDriver();
			con = Database.getConnection();

			String sql = "UPDATE room " +
					"SET status = 'Đã Nhận Phòng' " +
					"WHERE id = ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, roomId);

			int rowsUpdated = ps.executeUpdate();

			if (rowsUpdated > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return false;
	}

	public void updateRoomStatus(String roomId, String newStatus) {
		try (Connection conn = Database.getConnection();
			 PreparedStatement stmt = conn.prepareStatement("UPDATE room SET status = ? WHERE id = ?")) {
			stmt.setString(1, newStatus);
			stmt.setString(2, roomId);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean addRoom(Room room) {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			Database.loadDriver();
			con = Database.getConnection();

			String sql = "INSERT INTO room (roomId, roomName, status, floor, acreage, description, roomTypeName, basePrice) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, room.getRoomId());
			ps.setString(2, room.getRoomName());
			ps.setString(3, room.getStatus());
			ps.setInt(4, room.getFloor());
			ps.setInt(5, room.getAcreage());
			ps.setString(6, room.getDescription());
			ps.setString(7, room.getRoomTypeName());
			ps.setInt(8, room.getBase_price());

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
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
	}

	public boolean editRoom(Room room) {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			Database.loadDriver();
			con = Database.getConnection();

			// Update room details
			String sql = "UPDATE room SET room_type_id = ?, room_name = ?, floor = ?, acreage = ?, description = ? WHERE id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, room.getRoom_type_id());
			ps.setString(2, room.getRoomName());
			ps.setInt(3, room.getFloor());
			ps.setInt(4, room.getAcreage());
			ps.setString(5, room.getDescription());
			ps.setString(6, room.getRoomId());

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
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
	}

	public boolean deleteRoom(String roomId) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Database.loadDriver();
			con = Database.getConnection();

			// Check the room status
			String checkStatusSql = "SELECT status FROM room WHERE id = ?";
			ps = con.prepareStatement(checkStatusSql);
			ps.setString(1, roomId);
			rs = ps.executeQuery();

			if (rs.next()) {
				String status = rs.getString("status");
				if (!"Trống".equals(status)) {
					// Room is not empty, cannot delete
					System.out.println("Cannot delete room. Room is not empty.");
					return false;
				}
			} else {
				// Room not found
				System.out.println("Room not found.");
				return false;
			}

			// Close the previous PreparedStatement
			ps.close();

			// Proceed with deletion
			String deleteSql = "DELETE FROM room WHERE id = ?";
			ps = con.prepareStatement(deleteSql);
			ps.setString(1, roomId);

			int rowsAffected = ps.executeUpdate();
			return rowsAffected > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
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
	}


}