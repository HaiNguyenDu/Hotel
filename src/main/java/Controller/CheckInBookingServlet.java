package Controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.RoomDao;

import java.io.IOException;



@WebServlet("/checkIn")
public class CheckInBookingServlet extends HttpServlet {
    private RoomDao roomDao;

    public CheckInBookingServlet() {
        this.roomDao = new RoomDao();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String roomId = req.getParameter("roomId");
        System.out.println("Received roomId: " + roomId);
        roomDao.updateRoomStatus(roomId, "Đang sử dụng");
        RequestDispatcher dispatcher = req.getRequestDispatcher("nv");
        dispatcher.forward(req, resp);
    }
}
