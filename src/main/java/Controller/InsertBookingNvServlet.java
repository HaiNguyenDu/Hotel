package Controller;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Booking;
import BEAN.Room;
import DAO.BookingDao;
import DAO.RoomDao;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@WebServlet("/insertBookingNv")
public class InsertBookingNvServlet extends HttpServlet {
    private final BookingDao bookingDao;
    private final RoomDao roomDao;
    private static final long serialVersionUID = 1L;

    public InsertBookingNvServlet() {
        this.bookingDao = new BookingDao();
        this.roomDao = new RoomDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomId = request.getParameter("roomId");
        Double total = Double.valueOf(request.getParameter("total"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String cccd = request.getParameter("cccd");
        String birthday = request.getParameter("birthday");
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String address = request.getParameter("address");
        this.roomDao.updateRoomStatus(roomId, "Đã đặt");
        Booking booking = new Booking();
        booking.setRoomId(roomId);
        booking.setCustomerName(name);
        booking.setAmount(total);
        booking.setPhoneNumber(phone);
        booking.setEmail(email);
        booking.setCccd(cccd);
        booking.setBirthday(birthday);
        booking.setCheckinDate(checkInDate);
        booking.setCheckoutDate(checkOutDate);
        booking.setBookingDay(String.valueOf(Date.from(Instant.now())));
        booking.setAddress(address);
        Room room = roomDao.findById(roomId);
        booking.setAmount(total + room.getBase_price());
        bookingDao.insertNv(booking);

        request.setAttribute("roomId", roomId);
        request.setAttribute("total", total + room.getBase_price());
        request.setAttribute("name", name);
        request.setAttribute("phone", phone);
        request.setAttribute("email", email);
        request.setAttribute("cccd", cccd);
        request.setAttribute("birthday", birthday);

        request.getRequestDispatcher("/scnv.jsp").forward(request, response);
    }
}
