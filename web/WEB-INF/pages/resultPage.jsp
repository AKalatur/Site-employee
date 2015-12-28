<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link href="<c:url value="/resources/css/Style.css"/>" rel="stylesheet"/>
  </head>
  <body>

  <form>
    <table>
      <c:forEach items="${stringList}" var ="list">
        <c:set var="arr" value='${list.split(" ")}'/>
        <tr>
          <c:forEach var="i" begin="0" end="${fn:length(arr) - 1}">
          <td>
        ${arr[i]}
          </td>
          </c:forEach>
          </tr>
      </c:forEach>
    </table>
  </form>
  <br>
  <a href="<c:url value="/userPage" />">Go back</a>
  </br>
  </body>
</html>
