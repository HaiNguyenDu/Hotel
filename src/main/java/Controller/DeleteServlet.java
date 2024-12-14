//package Controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.ArrayList;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import BEAN.*;
//import BO.BussinessObject;
//
//@WebServlet("/DeleteNhanVien")
//public class DeleteServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request, response);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String mod = request.getParameter("mod");
//        if(mod.equals("1")) {
//        	getServletContext().getRequestDispatcher("/Delete.jsp").forward(request, response);
//        }
//        else if(mod.equals("2")) {
//        	try {
//				request.setAttribute("lists", BussinessObject.listAll());
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//        	getServletContext().getRequestDispatcher("/DeleteChoose.jsp").forward(request, response);
//        }
//        else if(mod.equals("3")) {
//        	try {
//				request.setAttribute("lists", BussinessObject.listAll());
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//        	getServletContext().getRequestDispatcher("/DeleteSelect.jsp").forward(request, response);
//        }
//        else if(mod.equals("4")) {
//        	 HttpSession session = request.getSession(false);  
//         	String username = (String) session.getAttribute("username");
//         	if(username == null) {
//       		 RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
//       	     dispatcher.forward(request, response);
//         	}
//         	else {
//        	String id = request.getParameter("id");
//        	String jsonResponse;
//        	System.out.println(id);
//        	response.setContentType("application/json");
//        	response.setCharacterEncoding("UTF-8");
//
//        	try (PrintWriter out = response.getWriter()) {
//        	    if (id != null && !id.trim().isEmpty()) {
//        	        BussinessObject.Delete(id); // Assume it returns a boolean
//        	        jsonResponse = "{\"exists\": true}";
//        	    } else {
//        	        jsonResponse = "{\"exists\": 2false}";
//        	    }
//
//        	    out.print(jsonResponse);
//        	    out.flush();
//        	} catch (Exception e) {
//        	    e.printStackTrace(); // Log the exception for debugging purposes
//        	    jsonResponse = "{\"exists\": false}";
//        	    try (PrintWriter out = response.getWriter()) {
//        	        out.print(jsonResponse);
//        	        out.flush();
//        	    }
//        	}
//         	}
//        }
//        else if(mod.equals("5")) {
//        	HttpSession session = request.getSession(false);  
//          	String username = (String) session.getAttribute("username");
//          	if(username == null) {
//        		 RequestDispatcher dispatcher = request.getRequestDispatcher("/Login.jsp");
//        	     dispatcher.forward(request, response);
//          	}
//          	else {
//        	String id = request.getParameter("id");
//        	String jsonResponse;
//
//        	response.setContentType("application/json");
//        	response.setCharacterEncoding("UTF-8");
//
//        	try (PrintWriter out = response.getWriter()) {
//        	    if (id != null && !id.trim().isEmpty()) {
//        	        BussinessObject.Delete(id); // Assume it returns a boolean
//        	        jsonResponse = "{\"exists\": true}";
//        	    } else {
//        	        jsonResponse = "{\"exists\": false}";
//        	    }
//
//        	    out.print(jsonResponse);
//        	    out.flush();
//        	} catch (Exception e) {
//        	    e.printStackTrace(); // Log the exception for debugging purposes
//        	    jsonResponse = "{\"exists\": false}";
//        	    try (PrintWriter out = response.getWriter()) {
//        	        out.print(jsonResponse);
//        	        out.flush();
//        	    }
//        	}
//          	}
//        }
//    }
//}
