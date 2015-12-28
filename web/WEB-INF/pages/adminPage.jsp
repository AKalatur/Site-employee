<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
  </head>
  <body>
  <br>Hello ${user}</br>

  <%
    String mes = request.getParameter("message");
    if( mes != null) {
    out.print(mes);
    }
  %>

  <form action="adminPage/addUser" method="get">
    <table>
      <tr>
        <td>LOGIN</td>
        <td><input name="login" type="text" width="100"/></td>
      <tr>
        <td>PASSWORD</td>
        <td><input name="password" type="text" width="100"/></td>
      </tr>
      <tr>
        <td>ROLE</td>
        <td>
          <select name="role">
            <option>ROLE_USER</option>
            <option>ROLE_ADMIN</option>
          </select>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <button type="submit">ADD NEW USER</button>
        </td>
      </tr>
    </table>
  </form>
  <br></br>
  <a href="<c:url value="/logout"/>">Logout</a>
  </body>
</html>