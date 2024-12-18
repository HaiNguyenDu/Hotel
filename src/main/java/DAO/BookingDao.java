package DAO;

import java.sql.Timestamp; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import BEAN.Booking;

public class BookingDao {
	
	public boolean extendedCheckoutTime(Booking bo) {
		try {
			Database.loadDriver();
			Connection conn = Database.getConnection();
			String updateSQL = "Update booking set check_out_date = ? where id = ?";
			PreparedStatement customerStmt = conn.prepareStatement(updateSQL);
			customerStmt.setString(1, bo.getCheckoutDate());
			customerStmt.setString(2, bo.getId());
			customerStmt.executeUpdate();
			return true;
		}catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
		
	}

	public List<Booking> getBookingsByDate(String selectedDate, String selectedMonth) throws SQLException {
		Database.loadDriver();
		Connection connection = Database.getConnection();
		List<BEAN.Booking> bookings = new ArrayList<>();
		String query = "SELECT booking.id as id, customer.Name as customer_name, booking.booking_amount as booking_amount, booking.booking_day as booking_day FROM booking " +
				"inner join customer on customer.id = booking.customer_id  " +
				"WHERE booking.booking_day = ? AND MONTH(booking.booking_day) = MONTH(?)";

		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, selectedDate);
			statement.setString(2, selectedMonth);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				Booking booking = new Booking();
				booking.setId(resultSet.getString("id"));
				booking.setCustomerName(resultSet.getString("customer_name"));
				booking.setAmount(resultSet.getDouble("booking_amount"));
				booking.setBookingDay(resultSet.getString("booking_day"));
				bookings.add(booking);
			}
		}

		return bookings;
	}

	public List<Booking> getAll() throws SQLException {
		Database.loadDriver();
		Connection connection = Database.getConnection();
		List<Booking> bookings = new ArrayList<>();
		String query = "SELECT booking.id as id, customer.Name as customer_name, customer.cccd as cccd, room.floor as floor, booking.booking_amount as booking_amount, " +
				"booking.check_in_date as check_in_date, booking.check_out_date as check_out_date, booking.booking_day as booking_day, room.room_name as room_name FROM booking " +
				"inner join customer on customer.id = booking.customer_id " +
				"inner join booking_room on booking_room.booking_id = booking.id " +
				"inner join room on booking_room.room_id = room.id";

		try (PreparedStatement statement = connection.prepareStatement(query)) {
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Booking booking = new Booking();
				booking.setId(resultSet.getString("id"));
				booking.setCustomerName(resultSet.getString("customer_name"));
				booking.setCccd(resultSet.getString("cccd"));
				booking.setFloor(resultSet.getInt("floor"));
				booking.setAmount(resultSet.getDouble("booking_amount"));
				booking.setBookingDay(resultSet.getString("booking_day"));
				booking.setCheckinDate(resultSet.getString("check_in_date"));
				booking.setCheckoutDate(resultSet.getString("check_out_date"));
				booking.setRoom_name(resultSet.getString("room_name"));
				bookings.add(booking);
			}
		}

		return bookings;
	}

	public List<Booking> getByDate(String dateFilter) throws SQLException {
		if (dateFilter == null || dateFilter.trim().isEmpty()) {
			throw new SQLException("Invalid DATE value: " + dateFilter);
		}

		Database.loadDriver();
		Connection connection = Database.getConnection();
		List<Booking> bookings = new ArrayList<>();
		String query = "SELECT booking.id as id, customer.Name as customer_name, booking.booking_amount as booking_amount, booking.check_in_date as check_in_date " +
				"FROM booking " +
				"INNER JOIN customer ON customer.id = booking.customer_id " +
				"WHERE booking.check_in_date = ?";

		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, dateFilter);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Booking booking = new Booking();
				booking.setId(resultSet.getString("id"));
				booking.setCustomerName(resultSet.getString("customer_name"));
				booking.setAmount(resultSet.getDouble("booking_amount"));
				booking.setCheckinDate(resultSet.getString("check_in_date"));
				bookings.add(booking);
			}
		}

		return bookings;
	}
	
	public Booking getByID(String ID) throws SQLException {
		Database.loadDriver();
		Connection connection = Database.getConnection();
		List<Booking> bookings = new ArrayList<>();
		String query = "SELECT booking.id as id, customer.Name as customer_name, customer.cccd as cccd, room.floor as floor, booking.booking_amount as booking_amount, " +
				"booking.check_in_date as check_in_date, booking.check_out_date as check_out_date, booking.booking_day as booking_day, room.room_name as room_name FROM booking " +
				"inner join customer on customer.id = booking.customer_id " +
				"inner join booking_room on booking_room.booking_id = booking.id " +
				"inner join room on booking_room.room_id = room.id "
				+ " where booking.id = ?";

		try (PreparedStatement statement = connection.prepareStatement(query)) {
			statement.setString(1, ID);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Booking booking = new Booking();
				booking.setId(resultSet.getString("id"));
				booking.setCustomerName(resultSet.getString("customer_name"));
				booking.setCccd(resultSet.getString("cccd"));
				booking.setFloor(resultSet.getInt("floor"));
				booking.setAmount(resultSet.getDouble("booking_amount"));
				booking.setBookingDay(resultSet.getString("booking_day"));
				booking.setCheckinDate(resultSet.getString("check_in_date"));
				booking.setCheckoutDate(resultSet.getString("check_out_date"));
				booking.setRoom_name(resultSet.getString("room_name"));
				bookings.add(booking);
			}
		}

		return bookings.get(0);
	}

	public void insert(Booking booking) {
		Database.loadDriver();
		try (Connection conn = Database.getConnection();) {
			String insertCustomerSQL = "INSERT INTO customer (id, Name, phone_number, email, cccd, Date_of_birth,gender,address) VALUES (?, ?, ?, ?, ?, ?,?,?)";
			PreparedStatement customerStmt = conn.prepareStatement(insertCustomerSQL);
			Random random = new Random();
			System.out.println(booking.getCustomerName());
			String customerId = String.format("%04d", random.nextInt(10000));

			customerStmt.setString(1, customerId);
			customerStmt.setString(2, booking.getCustomerName());
			customerStmt.setString(3, booking.getPhoneNumber());
			customerStmt.setString(4, booking.getEmail());
			customerStmt.setString(5, booking.getCccd());
			customerStmt.setString(6, booking.getBirthday());
			customerStmt.setString(7, booking.getGender());
			customerStmt.setString(8, booking.getAddress());
			customerStmt.executeUpdate();



			String insertBookingSQL = "INSERT INTO booking (id, customer_id, booking_day, booking_amount, receptionist_id,check_in_date,check_out_date) VALUES (?, ?, ?, ?, '4000000001',?,?)";
			PreparedStatement bookingStmt = conn.prepareStatement(insertBookingSQL);
			String bookingId = String.format("%04d", random.nextInt(10000));
			bookingStmt.setString(1, bookingId);
			bookingStmt.setString(2, customerId);
			bookingStmt.setTimestamp(3, Timestamp.from(Instant.now()));
			bookingStmt.setDouble(4, booking.getAmount());
            bookingStmt.setString(5, booking.getCheckinDate());
            bookingStmt.setString(6, booking.getCheckoutDate());
			bookingStmt.executeUpdate();
            System.out.println(booking.getCheckoutDate());
			insertBookingSQL = "INSERT INTO booking_room (booking_id, room_id) VALUES (?, ?)";
			bookingStmt = conn.prepareStatement(insertBookingSQL);
			bookingStmt.setString(1, bookingId);
			bookingStmt.setString(2, booking.getRoomId());
			bookingStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insertNv(Booking booking) {
		Database.loadDriver();
		try (Connection conn = Database.getConnection();) {
			String insertCustomerSQL = "INSERT INTO customer (id, Name, phone_number, email, cccd, Date_of_birth, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement customerStmt = conn.prepareStatement(insertCustomerSQL);
			Random random = new Random();
			String customerId = String.format("%04d", random.nextInt(10000));

			customerStmt.setString(1, customerId);
			customerStmt.setString(2, booking.getCustomerName());
			customerStmt.setString(3, booking.getPhoneNumber());
			customerStmt.setString(4, booking.getEmail());
			customerStmt.setString(5, booking.getCccd());
			customerStmt.setString(6, booking.getBirthday());
			customerStmt.setString(7, booking.getAddress());
			customerStmt.executeUpdate();
			String insertBookingSQL = "INSERT INTO booking (id, customer_id, booking_day, booking_amount, receptionist_id,check_in_date,check_out_date) VALUES (?, ?, ?, ?, '4000000001',?,?)";
			PreparedStatement bookingStmt = conn.prepareStatement(insertBookingSQL);
			String bookingId = String.format("%04d", random.nextInt(10000));
			bookingStmt.setString(1, bookingId);
			bookingStmt.setString(2, customerId);
			bookingStmt.setTimestamp(3, Timestamp.from(Instant.now()));
			bookingStmt.setDouble(4, booking.getAmount());
			bookingStmt.setString(5, booking.getCheckinDate());
			bookingStmt.setString(6, booking.getCheckoutDate());
			bookingStmt.executeUpdate();
			System.out.println(booking.getCheckoutDate());
			insertBookingSQL = "INSERT INTO booking_room (booking_id, room_id) VALUES (?, ?)";
			bookingStmt = conn.prepareStatement(insertBookingSQL);
			bookingStmt.setString(1, bookingId);
			bookingStmt.setString(2, booking.getRoomId());
			bookingStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}