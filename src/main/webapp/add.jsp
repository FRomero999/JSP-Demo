<%-- 
    Document   : add
    Created on : 26 abr. 2021, 13:00:16
    Author     : Profesor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>

<html>
    <body>
        <%
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");  
        %>
    
        <h3>Insertando <%= nombre %> <%= apellidos %> </h3>
    
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/usuario?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "pacoromero");
      Statement stmt = conn.createStatement();
 
      String sql = "INSERT INTO user (nombre, apellidos) VALUES ('"+nombre+"','"+apellidos+"')";
      stmt.executeUpdate(sql);
    %>
    
    <a href="<%=request.getContextPath() %>">Continuar</a>

    </body>
</html>