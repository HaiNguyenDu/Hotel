package Controller;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.RoomDao;

import java.io.IOException;

@WebServlet("/delete-room")
public class DeleteRoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomId = request.getParameter("id");
        RoomDao roomDao = new RoomDao();

        boolean success = roomDao.deleteRoom(roomId);

        if (success) {
            response.sendRedirect("room-admin");
        } else {
            request.setAttribute("errorMessage", "Cannot delete room. Room is not empty or does not exist.");
            request.getRequestDispatcher("room-admin").forward(request, response);
        }
    }
}
