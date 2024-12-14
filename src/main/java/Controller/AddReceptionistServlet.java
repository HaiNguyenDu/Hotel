package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Database;

@WebServlet("/add-receptionist")
public class AddReceptionistServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");  // Ensure request encoding is set to UTF-8
        response.setContentType("text/html; charset=UTF-8");  // Ensure response content type is set to UTF-8
        RequestDispatcher dispatcher = request.getRequestDispatcher("add-receptionist.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");  // Ensure request encoding is set to UTF-8
        response.setContentType("text/html; charset=UTF-8");  // Ensure response content type is set to UTF-8

        String name = request.getParameter("name");
        String salaryStr = request.getParameter("salary");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String cccd = request.getParameter("cccd");
        String address = request.getParameter("address");
        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String id = request.getParameter("id");

        StringBuilder errorMessage = new StringBuilder();

        // Validate inputs
        if (name == null || name.isEmpty() || salaryStr == null || salaryStr.isEmpty() ||
                gender == null || gender.isEmpty() || phone == null || phone.isEmpty() ||
                cccd == null || cccd.isEmpty() || address == null || address.isEmpty() ||
                role == null || role.isEmpty() || email == null || email.isEmpty() ||
                password == null || password.isEmpty() || id == null || id.isEmpty()) {
            errorMessage.append("All fields are required.<br>");
        }

        Float salary = null;
        try {
            salary = Float.parseFloat(salaryStr);
        } catch (NumberFormatException e) {
            errorMessage.append("Invalid salary format.<br>");
        }

        if (!phone.matches("^0\\d{9}$")) {
            errorMessage.append("Phone number must be 10 digits and start with 0.<br>");
        }

        if (!cccd.matches("^0\\d{11}$")) {
            errorMessage.append("CCCD must be 12 digits and start with 0.<br>");
        }

        if (!email.endsWith("@gmail.com")) {
            errorMessage.append("Email must end with @gmail.com.<br>");
        }

        if (password.length() <= 6) {
            errorMessage.append("Password must be longer than 6 characters.<br>");
        }

        if (!id.matches("^\\d{10}$")) {
            errorMessage.append("ID must be 10 digits long.<br>");
        }

        if (!phone.matches("^[0-9]+$") || !cccd.matches("^[0-9]+$") || !id.matches("^[0-9]+$")) {
            errorMessage.append("Phone number, CCCD, and ID must only contain digits.<br>");
        }

        if (errorMessage.length() > 0) {
            request.setAttribute("errorMessage", errorMessage.toString());
            RequestDispatcher dispatcher = request.getRequestDispatcher("add-receptionist.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            Database.loadDriver();
            Connection con = Database.getConnection();

            // Check for unique phone number, CCCD, and email
            String checkUniqueSql = "SELECT COUNT(*) FROM receptionist WHERE phone_number = ? OR cccd = ? OR email = ?";
            PreparedStatement checkUniqueStmt = con.prepareStatement(checkUniqueSql);
            checkUniqueStmt.setString(1, phone);
            checkUniqueStmt.setString(2, cccd);
            checkUniqueStmt.setString(3, email);
            ResultSet rsUnique = checkUniqueStmt.executeQuery();
            if (rsUnique.next() && rsUnique.getInt(1) > 0) {
                request.setAttribute("errorMessage", "Phone number, CCCD, or email already exists.<br>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("add-receptionist.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Check if ID already exists
            String checkIdSql = "SELECT COUNT(*) FROM receptionist WHERE id = ?";
            PreparedStatement checkIdStmt = con.prepareStatement(checkIdSql);
            checkIdStmt.setString(1, id);
            ResultSet rs = checkIdStmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                request.setAttribute("errorMessage", "ID already exists.<br>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("add-receptionist.jsp");
                dispatcher.forward(request, response);
                return;
            }

            String sql = "INSERT INTO receptionist (name, salary, gender, phone_number, cccd, address, role, email, password, id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setFloat(2, salary);
            ps.setString(3, gender);
            ps.setString(4, phone);
            ps.setString(5, cccd);
            ps.setString(6, address);
            ps.setString(7, role);
            ps.setString(8, email);
            ps.setString(9, password);
            ps.setString(10, id);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("list-receptionist");
            } else {
                request.setAttribute("errorMessage", "Failed to add receptionist.<br>");
                RequestDispatcher dispatcher = request.getRequestDispatcher("add-receptionist.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to add receptionist.<br>");
            RequestDispatcher dispatcher = request.getRequestDispatcher("add-receptionist.jsp");
            dispatcher.forward(request, response);
        }
    }
}
