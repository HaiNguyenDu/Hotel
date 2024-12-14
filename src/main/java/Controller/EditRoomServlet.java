package Controller;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Room;
import DAO.RoomDao;

@WebServlet("/edit-room")
public class EditRoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String id = request.getParameter("id");
        RoomDao roomDao = new RoomDao();
        Room room = roomDao.findById(id);

        if (room != null) {
            request.setAttribute("room", room);
            request.getRequestDispatcher("edit-room.jsp").forward(request, response);
        } else {
            response.getWriter().println("Room not found.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String id = request.getParameter("id");
        String roomTypeId = request.getParameter("room_type_id");
        String roomName = request.getParameter("room_name");
        Integer floor = Integer.parseInt(request.getParameter("floor"));
        Integer acreage = Integer.parseInt(request.getParameter("acreage"));
        String description = request.getParameter("description");

        Room room = new Room(id, roomTypeId, roomName, "Trống", floor, acreage, description); // Assuming status is always "Trống"
        RoomDao roomDao = new RoomDao();
        boolean success = roomDao.editRoom(room);

        if (success) {
            response.sendRedirect("room-admin");
        } else {
            request.setAttribute("errorMessage", "Failed to update room.");
            doGet(request, response);  // Re-show the form with error message
        }
    }
}
