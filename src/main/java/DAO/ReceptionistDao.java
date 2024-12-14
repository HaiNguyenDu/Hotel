package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Receptionist;

public class ReceptionistDao {
	public List<Receptionist> findAll() {
		List<Receptionist> receptionists = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Database.loadDriver();
			con = Database.getConnection();

			String sql = "SELECT * from receptionist";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String id = rs.getString(1);
				String name = rs.getString(2);
				Float salary = rs.getFloat(3);
				String gender = rs.getString(4);
				String phone_number = rs.getString(5);
				String CCCD = rs.getString(6);
				String address = rs.getString(7);
				String role = rs.getString(8);
				String email = rs.getString(9);
				String password = rs.getString(10);

				Receptionist receptionist = new Receptionist(id, name, salary, gender, phone_number, CCCD, address, role, email, password);
				receptionists.add(receptionist);
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
		return receptionists;
	}

	public boolean delete(String id) {
		Connection con = null;
		PreparedStatement psBooking = null;
		PreparedStatement psReceptionist = null;

		try {
			Database.loadDriver();
			con = Database.getConnection();

			// Bắt đầu giao dịch
			con.setAutoCommit(false);

			// Xóa các bản ghi trong bảng booking
			String sqlBooking = "DELETE FROM booking WHERE receptionist_id = ?";
			psBooking = con.prepareStatement(sqlBooking);
			psBooking.setString(1, id);
			psBooking.executeUpdate();

			// Xóa nhân viên trong bảng receptionist
			String sqlReceptionist = "DELETE FROM receptionist WHERE id = ?";
			psReceptionist = con.prepareStatement(sqlReceptionist);
			psReceptionist.setString(1, id);
			int rowsAffected = psReceptionist.executeUpdate();

			// Hoàn tất giao dịch
			con.commit();

			return rowsAffected > 0;
		} catch (SQLException e) {
			if (con != null) {
				try {
					con.rollback(); // Rollback nếu có lỗi
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			e.printStackTrace();
			return false;
		} finally {
			if (psBooking != null) {
				try {
					psBooking.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (psReceptionist != null) {
				try {
					psReceptionist.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.setAutoCommit(true);
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public boolean edit(Receptionist receptionist) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			Database.loadDriver();
			con = Database.getConnection();

			// Check for unique phone number, CCCD, and email
			String checkSql = "SELECT id FROM receptionist WHERE (phone_number = ? OR CCCD = ? OR email = ?) AND id != ?";
			ps = con.prepareStatement(checkSql);
			ps.setString(1, receptionist.getPhone_number());
			ps.setString(2, receptionist.getCCCD());
			ps.setString(3, receptionist.getEmail());
			ps.setString(4, receptionist.getId());
			rs = ps.executeQuery();

			if (rs.next()) {
				return false; // Duplicate found, return false
			}

			// No duplicates found, proceed with update
			String sql = "UPDATE receptionist SET name = ?, salary = ?, gender = ?, phone_number = ?, CCCD = ?, address = ?, role = ?, email = ?, password = ? WHERE id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, receptionist.getName());
			ps.setFloat(2, receptionist.getSalary());
			ps.setString(3, receptionist.getGender());
			ps.setString(4, receptionist.getPhone_number());
			ps.setString(5, receptionist.getCCCD());
			ps.setString(6, receptionist.getAddress());
			ps.setString(7, receptionist.getRole());
			ps.setString(8, receptionist.getEmail());
			ps.setString(9, receptionist.getPassword());
			ps.setString(10, receptionist.getId());
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

	public Receptionist findById(String id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Receptionist receptionist = null;

		try {
			Database.loadDriver();
			con = Database.getConnection();
			String sql = "SELECT * FROM receptionist WHERE id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				String name = rs.getString("name");
				Float salary = rs.getFloat("salary");
				String gender = rs.getString("gender");
				String phone_number = rs.getString("phone_number");
				String CCCD = rs.getString("CCCD");
				String address = rs.getString("address");
				String role = rs.getString("role");
				String email = rs.getString("email");
				String password = rs.getString("password");

				receptionist = new Receptionist(id, name, salary, gender, phone_number, CCCD, address, role, email, password);
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
		return receptionist;
	}
}
