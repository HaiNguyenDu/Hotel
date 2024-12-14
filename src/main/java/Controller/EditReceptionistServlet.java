package Controller;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Receptionist;
import DAO.ReceptionistDao;

@WebServlet("/edit-receptionist")
public class EditReceptionistServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set request and response encoding to UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String id = request.getParameter("id");
        ReceptionistDao receptionistDao = new ReceptionistDao();
        Receptionist receptionist = receptionistDao.findById(id);

        if (receptionist != null) {
            request.setAttribute("receptionist", receptionist);
            request.getRequestDispatcher("edit-receptionist.jsp").forward(request, response);
        } else {
            response.getWriter().println("Receptionist not found.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set request and response encoding to UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        Float salary = Float.parseFloat(request.getParameter("salary"));
        String gender = request.getParameter("gender");
        String phone_number = request.getParameter("phone_number");
        String CCCD = request.getParameter("CCCD");
        String address = request.getParameter("address");
        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Receptionist receptionist = new Receptionist(id, name, salary, gender, phone_number, CCCD, address, role, email, password);
        ReceptionistDao receptionistDao = new ReceptionistDao();
        boolean success = receptionistDao.edit(receptionist);

        if (success) {
            response.sendRedirect("list-receptionist");
        } else {
            response.getWriter().println("Failed to update receptionist.");
        }
    }
}
