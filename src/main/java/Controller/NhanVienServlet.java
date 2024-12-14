package Controller;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Room;
import DAO.BookingDao;
import DAO.RoomDao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "NhanVienServlet", value = "/nv")
public class NhanVienServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final RoomDao roomDao;
    private final BookingDao bookingDao;

    public NhanVienServlet() {
        super();
        this.roomDao = new RoomDao();
        this.bookingDao = new BookingDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set UTF-8 encoding for request and response
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        Map<Integer, List<Room>> roomsByFloor = roomDao.getAllRoomsByFloor();
        if(roomsByFloor==null)
        {
            System.out.println("nulllroima");
        }
        request.setAttribute("roomsByFloor", roomsByFloor);

        RequestDispatcher dispatcher = request.getRequestDispatcher("nv.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set UTF-8 encoding for request and response
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Handle POST request logic here
    }
}
