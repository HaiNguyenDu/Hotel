package Controller;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Booking;
import DAO.BookingDao;
import DAO.CustomerDao;
import DAO.RoomDao;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@WebServlet("/insertBooking")
public class InsertBookingServlet extends HttpServlet {
    private final BookingDao bookingDao;
    private CustomerDao customerDao;
    private static final long serialVersionUID = 1L;
    private final RoomDao roomDao;

    public InsertBookingServlet() {
        this.bookingDao = new BookingDao();
        this.roomDao = new RoomDao();
    }

    public void init() {
        customerDao = new CustomerDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String roomId = request.getParameter("roomId");
        Double total = Double.valueOf(request.getParameter("total"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String cccd = request.getParameter("cccd");
        String birthday = request.getParameter("birthday");
        String checkin = request.getParameter("daycheckin");
        String checkout = request.getParameter("daycheckout");

        // Kiểm tra trùng lặp số điện thoại và CCCD
        boolean isPhoneExists = customerDao.isPhoneExists(phone);
        boolean isCCCDExists = customerDao.isCCCDExists(cccd);

        if (isPhoneExists) {
            response.getWriter().write("Phone Number already exists.");
            return;
        }

        if (isCCCDExists) {
            response.getWriter().write("CCCD already exists.");
            return;
        }

        roomDao.updateRoomStatus(roomId, "Đã đặt");
        LocalDate currentDate = LocalDate.now();

        // Định dạng ngày theo định dạng mong muốn
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDate = currentDate.format(formatter);

        Booking booking = new Booking();
        booking.setRoomId(roomId);
        booking.setCustomerName(name);
        booking.setAmount(total);
        booking.setPhoneNumber(phone);
        booking.setEmail(email);
        booking.setCccd(cccd);
        booking.setBirthday(birthday);
        booking.setCheckinDate(checkin);
        booking.setCheckoutDate(checkout);
        booking.setBookingDay(String.valueOf(Date.from(Instant.now())));
        booking.setBookingDay(formattedDate);

        bookingDao.insert(booking);

        request.getRequestDispatcher("/successful.jsp").forward(request, response);
    }
}
