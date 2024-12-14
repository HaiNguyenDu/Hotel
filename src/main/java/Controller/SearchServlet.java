//package Controller;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import BO.BussinessObject;
//
//@WebServlet("/TimKiemNV")
//public class SearchServlet extends HttpServlet {
//	 private static final long serialVersionUID = 1L;
//
//	    // doGet method
//	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	        doPost(request, response);  // Redirect to doPost method
//	    }
//
//	    // doPost method
//	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    	 String mod = request.getParameter("mod");
//	    	 if(mod.equals("1")) {
//	    		 getServletContext().getRequestDispatcher("/search.jsp").forward(request, response);
//	    	 }
//	    	 else if(mod.equals("2")) {
//	    		 String search = request.getParameter("search_input");
//	    		 String type = request.getParameter("search");
//	    		 try {
//					request.setAttribute("lists", BussinessObject.Find(type, search));
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				 getServletContext().getRequestDispatcher("/search.jsp").forward(request, response);
//	    	 }
//	    }
//}
