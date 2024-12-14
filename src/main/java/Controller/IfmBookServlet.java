package Controller;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Room;
import DAO.RoomDao;

import java.io.IOException;

@WebServlet("/ifmbook")
public class IfmBookServlet extends HttpServlet {
    private final RoomDao roomDao;

    public IfmBookServlet() {
        this.roomDao = new RoomDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String roomId = request.getParameter("roomId");

        HttpSession session = request.getSession();
        session.setAttribute("selectedRoomId", roomId);
        String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");


        Room room = roomDao.findById(roomId);
        System.out.println(room);
        request.setAttribute("room", room);
        request.setAttribute("checkin", checkin);
        request.setAttribute("checkout", checkout);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ifmbook.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String roomId = request.getParameter("roomId");
        HttpSession session = request.getSession();

    }
}



