package Controller;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Room;
import DAO.RoomDao;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;

@WebServlet("/room-admin")
public class RoomAdminServlet extends HttpServlet {
    private final RoomDao roomDao;

    public RoomAdminServlet() {
        this.roomDao = new RoomDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Lấy danh sách tất cả các phòng cùng thông tin loại phòng
        List<Room> rooms = roomDao.getAllRoomsWithType();
        request.setAttribute("rooms", rooms);
        RequestDispatcher dispatcher = request.getRequestDispatcher("room-admin.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String roomId = request.getParameter("roomId");

        if ("delete".equals(action)) {
            roomDao.deleteRoom(roomId);
        }

        response.sendRedirect("room-admin");
    }
}
