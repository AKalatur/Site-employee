<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
  </head>
  <body>
  <br>Hello ${user} </br>

  <form action="resultPage" method="get">
  <button type="submit" name="rep" value="rep1">Report(Employee list)</button>
  </form>
<%--  <form action="resultPage" method="get">
    <button type="submit" name="rep" value="rep2">Report №2</button>
  </form>--%>
  <br>
  <a href="<c:url value="/logout" />">Logout</a>
    </br>
  </body>
</html>
