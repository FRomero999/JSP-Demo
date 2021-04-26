<%-- 
    Document   : test
    Created on : 26 abr. 2021, 12:12:24
    Author     : Profesor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head><title>First JSP</title></head>
<body>

    <h1>Listado de usuarios</h1>
    
  <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/usuario?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "pacoromero");
      Statement stmt = conn.createStatement();
 
      String sqlStr = "SELECT * FROM user";

      ResultSet rset = stmt.executeQuery(sqlStr);
  %>
      <hr>
        <table border=1 cellpadding=5>
          <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>Apellidos</th>
          </tr>
  <%
      while (rset.next()) {
        int id = rset.getInt("id");
  %>
          <tr>
            <td><%= id %></td>
            <td><%= rset.getString("nombre") %></td>
            <td><%= rset.getString("apellidos") %></td>
          </tr>
  <%
      }
  %>
        </table>

        <hr><!-- comment -->
        <form method="get" action="add.jsp">
            <fieldset title="Nuevo">
            <input type="text" name="nombre" /><!-- comment -->
            <input type="text" name="apellidos" />
            <input type="submit" />
            </fieldset>
        </form>

  
  <%
      rset.close();
      stmt.close();
      conn.close();
  %>  
</body>
</html>