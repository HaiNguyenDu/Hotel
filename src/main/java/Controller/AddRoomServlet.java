package Controller;



import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Database;

@WebServlet("/add-room")
public class AddRoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");  // Ensure request encoding is set to UTF-8
        response.setContentType("text/html; charset=UTF-8");  // Ensure response content type is set to UTF-8
        RequestDispatcher dispatcher = request.getRequestDispatcher("add-room.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");  // Ensure request encoding is set to UTF-8
        response.setContentType("text/html; charset=UTF-8");  // Ensure response content type is set to UTF-8

        String id = request.getParameter("id");
        String roomTypeId = request.getParameter("room_type_id");
        String roomName = request.getParameter("room_name");
        String status = request.getParameter("status");
        String floorStr = request.getParameter("floor");
        String acreageStr = request.getParameter("acreage");
        String description = request.getParameter("description");

        StringBuilder errorMessage = new StringBuilder();

        // Validate inputs
        if (id == null || id.isEmpty() || roomTypeId == null || roomTypeId.isEmpty() ||
                roomName == null || roomName.isEmpty() || status == null || status.isEmpty() ||
                floorStr == null || floorStr.isEmpty() || acreageStr == null || acreageStr.isEmpty() ||
                description == null || description.isEmpty()) {
            errorMessage.append("All fields are required.<br>");
        }

        if (!id.matches("^9\\d{9}$")) {
            errorMessage.append("Room ID must start with 9 and be 10 digits long.<br>");
        }

        if (!roomTypeId.matches("^300000000[1-9]$")) {
            errorMessage.append("Room Type ID must be between 3000000001 and 3000000009.<br>");
        }

        Integer floor = null;
        try {
            floor = Integer.parseInt(floorStr);
        } catch (NumberFormatException e) {
            errorMessage.append("Invalid floor format.<br>");
        }

        Integer acreage = null;
        try {
            acreage = Integer.parseInt(acreageStr);
        } catch (NumberFormatException e) {
            errorMessage.append("Invalid acreage format.<br>");
        }

        if (errorMessage.length() > 0) {
            request.setAttribute("errorMessage", errorMessage.toString());
            RequestDispatcher dispatcher = request.getRequestDispatcher("add-room.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            Database.loadDriver();
            Connection con = Database.getConnection();

            // Check for unique room ID
            String checkIdSql = "SELECT COUNT(*) FROM room WHERE id = ?";
            PreparedStatement checkIdStmt = con.prepareStatement(checkIdSql);
            checkIdStmt.setString(1, id);
            ResultSet rs = checkIdStmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                request.setAttribute("errorMessage", "Room ID already exists.<br>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("add-room.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Check for unique room name
            String checkNameSql = "SELECT COUNT(*) FROM room WHERE room_name = ?";
            PreparedStatement checkNameStmt = con.prepareStatement(checkNameSql);
            checkNameStmt.setString(1, roomName);
            ResultSet rsName = checkNameStmt.executeQuery();
            if (rsName.next() && rsName.getInt(1) > 0) {
                request.setAttribute("errorMessage", "Room name already exists.<br>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("add-room.jsp");
                dispatcher.forward(request, response);
                return;
            }

            String sql = "INSERT INTO room (id, room_type_id, room_name, status, floor, acreage, description) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, roomTypeId);
            ps.setString(3, roomName);
            ps.setString(4, status);
            ps.setInt(5, floor);
            ps.setInt(6, acreage);
            ps.setString(7, description);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("room-admin");
            } else {
                request.setAttribute("errorMessage", "Failed to add room.<br>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("add-room.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to add room.<br>");
            RequestDispatcher dispatcher = request.getRequestDispatcher("add-room.jsp");
            dispatcher.forward(request, response);
        }
    }
}
