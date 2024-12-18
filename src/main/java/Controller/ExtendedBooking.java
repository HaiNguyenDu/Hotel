package Controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Booking;
import DAO.BookingDao;
import DAO.RoomDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;



@WebServlet("/exended")
public class ExtendedBooking extends HttpServlet {
    private final BookingDao bookingDao;

    public ExtendedBooking() {
        this.bookingDao = new BookingDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Id = req.getParameter("id");
        String time = req.getParameter("time");
        if(time == null || time.equals("")) {
        	Booking book = null;
			try {
				book = bookingDao.getByID(Id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			resp.setContentType("application/json");
	        PrintWriter out = resp.getWriter();
	        out.print("{");
	        out.print("\"IDBooking\":\"" + book.getId() + "\",");
	        out.print("\"Name\":\"" + book.getCustomerName() + "\",");
	        out.print("\"CCCD\":\"" + book.getCccd() + "\",");
	        out.print("\"Room\":\"" + book.getRoom_name() + "\",");
	        out.print("\"date\":\"" + book.getCheckoutDate() + "\"");
	        out.print("}");
	        out.flush();
        }
        else {
        	boolean idExists = true;
            try {
            	Booking book = new Booking();
            	book.setId(Id);
            	book.setCheckoutDate(time);
            	bookingDao.extendedCheckoutTime(new Booking());
            } catch (Exception e) {
                e.printStackTrace();
                idExists = false;
            }
            // Tạo JSON response
            String jsonResponse = "{\"exists\":" + idExists + "}";
            // Trả về JSON response
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");

            PrintWriter out = resp.getWriter();
            out.print(jsonResponse);
            out.flush();
        }
    }
}
