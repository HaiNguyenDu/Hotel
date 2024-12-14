package Controller;



import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ReceptionistDao;

import java.io.IOException;

@WebServlet("/list-receptionist")
public class ListReceptionistServlet extends HttpServlet {
    private final ReceptionistDao receptionistDao;

    public ListReceptionistServlet() {
        super();
        this.receptionistDao = new ReceptionistDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("list-receptionist.jsp");
        request.setAttribute("users", receptionistDao.findAll());
        dispatcher.forward(request, response);
    }
}
