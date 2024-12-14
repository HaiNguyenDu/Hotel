package util;
import java.sql.*;
import java.util.ArrayList;

public class DatabaseConnection {
    private Connection connection;
    
    public Connection getConnection() {
    	return this.connection;
    }
    
    public DatabaseConnection() {
        try {
        	try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            // Sử dụng URL kết nối với các tham số cần thiết
            connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/dulieu?useSSL=false&allowPublicKeyRetrieval=true", "root", "Thanhan@2004");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi kết nối cơ sở dữ liệu: " + e.getMessage());
        }
    }
    
    public DatabaseConnection(String path) {
        try {
            connection = DriverManager.getConnection(path,"root","Thanhan@2004");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Phương thức thực thi lệnh truy vấn SELECT
    public ResultSet executeQuery(String query) throws Exception {
            Statement statement = connection.createStatement();
            return statement.executeQuery(query);
    }
    private String Tach_chuoi(String originalString,String x) {
		int indexOfX = originalString.indexOf(x);
		if (indexOfX != -1) {
		    String extractedString = originalString.substring(originalString.indexOf("set"), indexOfX);
		    System.out.println(extractedString);
		    return extractedString;
		} else {
		    return "";
		}
	}
	private Boolean kiem_tra(String originalString,String x) {
		int indexOfX = originalString.indexOf(x);
		if (indexOfX != -1) {
		    return false;
		} else {
		    return true;
		}
	}
    public ArrayList<String> Lay_du_lieu(String query) throws Exception {
        java.sql.ResultSet rs = executeQuery(query);
        ResultSetMetaData rsmd = rs.getMetaData();
        int colCount = rsmd.getColumnCount();
        ArrayList<String> objmang = new ArrayList<String>();
        while (rs.next()) {
            String obj = "";
            for (int i = 1; i <= colCount; i++) {
                obj += rs.getObject(i).toString() + "|";
            }
            objmang.add(obj);
        }   
        return objmang;
	}
    public String HTMLoutput(String query, String type){
        String htmlcontent = "";
        if(type.equals("select") ) {
            try {
                 Statement stmt = connection.createStatement();
                 String sql23 = query;
                 ResultSet rs = stmt.executeQuery(sql23);
                 ResultSetMetaData rsmd = rs.getMetaData();
                 int colCount = rsmd.getColumnCount();
                 htmlcontent="<html>" +
                         "<table border=\"1\"  width=\"600\" height=\"600\">"+"<tr>";
                 for (int i = 1; i <= colCount; i++) {
                     
                     htmlcontent+="<th>"+rsmd.getColumnName(i)+ "</th>"; 
                 }
                 htmlcontent+="</tr>";
                 while (rs.next()) {
                     htmlcontent+="<tr>";
                     for (int i = 1; i <= colCount; i++) {
                         htmlcontent+="<td>"+rs.getObject(i) + "</td>";
                     }
                     htmlcontent+="</tr>";
                 }
                 htmlcontent+="</table>" +
            "</html>";
                 rs.close();
                 stmt.close();
        }
             catch (Exception ex) {
                 return ex.getMessage();
                }
    }
        else {
            try {
                Statement stmt = connection.createStatement();
                String sql23 = query;
                boolean SubstringPresent = sql23.toLowerCase().contains("update");
                boolean isIdupdate=true;
                if(SubstringPresent) {
                    String substring=Tach_chuoi(sql23.toLowerCase(),"where");
                    isIdupdate=kiem_tra(substring,"maso=");
                    if(isIdupdate)isIdupdate=kiem_tra(substring,"maso =");
                }
                if(isIdupdate) {
                stmt.executeUpdate(sql23);
                String sql = "select * from table1"; // Replace "table1" with your actual table name
                ResultSet rs = stmt.executeQuery(sql);
                ResultSetMetaData rsmd = rs.getMetaData();
                int colCount = rsmd.getColumnCount();
                htmlcontent="<html>" +
                         "<table border=\"1\"  width=\"600\" height=\"600\">"+"<tr>";
                 for (int i = 1; i <= colCount; i++) {
                     
                     htmlcontent+="<th>"+rsmd.getColumnName(i)+ "</th>"; 
                 }
                 htmlcontent+="</tr>";
                 while (rs.next()) {
                     htmlcontent+="<tr>";
                     for (int i = 1; i <= colCount; i++) {
                         htmlcontent+="<td>"+rs.getObject(i) + "</td>";
                     }
                     htmlcontent+="</tr>";
                 }
                 htmlcontent+="</table>" +
            "</html>";
                 rs.close();
                 stmt.close();
        }else {stmt.close();}}
             catch (Exception ex) {
                    return ex.getMessage();
                }
        }
        return htmlcontent;
    }
    // Phương thức thực thi lệnh truy vấn UPDATE, INSERT, DELETE
    public int executeUpdate(String query)throws Exception {
            Statement statement = connection.createStatement();
            return statement.executeUpdate(query);
    }

    // Đóng kết nối CSDL
    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
