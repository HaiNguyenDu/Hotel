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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/bookResult")
public class BookResultServlet extends HttpServlet {
    private final RoomDao roomDao;

    public BookResultServlet() {
        this.roomDao = new RoomDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        int daycheckin = Integer.parseInt(request.getParameter("daycheckin"));
        int daycheckout = Integer.parseInt(request.getParameter("daycheckout"));
        String dateStringin = "2024-7-"+daycheckin;
        String dateStringout = "2024-7-"+daycheckout;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date datein,dateout;
        try {
             datein = dateFormat.parse(dateStringin);
             dateout = dateFormat.parse(dateStringout);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }


            RoomDao roomDao = new RoomDao();
            List<Room> rooms = roomDao.getAllRooms(datein,dateout);
            request.setAttribute("rooms", rooms);
        request.setAttribute("checkin", dateStringin);
        request.setAttribute("checkout", dateStringout);

        RequestDispatcher dispatcher = request.getRequestDispatcher("bookResult.jsp");
        dispatcher.forward(request, response);
    }
}


