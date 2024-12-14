package Controller;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ReceptionistDao;

@WebServlet("/delete-receptionist")
public class DeleteReceptionistServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set request and response encoding to UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String id = request.getParameter("id");
        ReceptionistDao receptionistDao = new ReceptionistDao();

        try {
            boolean success = receptionistDao.delete(id);
            if (success) {
                response.sendRedirect("list-receptionist");
            } else {
                response.getWriter().println("Failed to delete receptionist with ID: " + id);
            }
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
            e.printStackTrace(response.getWriter());
        }
    }
}
