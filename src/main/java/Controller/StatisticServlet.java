package Controller;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BookingDao;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/statistics")
public class StatisticServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final BookingDao bookingDao;

    public StatisticServlet() {
        super();
        this.bookingDao = new BookingDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("statistic.jsp");
        String dateFilter = request.getParameter("date");

        try {
            if (dateFilter != null && !dateFilter.trim().isEmpty()) {
                request.setAttribute("bookings", bookingDao.getByDate(dateFilter));
            } else {
                request.setAttribute("bookings", bookingDao.getAll());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        dispatcher.forward(request, response);
    }
}
