<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <link href="<c:url value="/resources/css/Style.css"/>" rel="stylesheet"/>
</head>
<body>
<h3>HI</h3>
  <form name="loginForm" action="/login" method='POST'>
    <c:if test="${param.error != null}">
      <p>Invalid username and password.</p>
    </c:if>

    <table>
      <tr>
        <td>Login</td>
        <td><input type="text" width="100" name="login" placeholder="Enter Username" required/></td>
      </tr>
      <tr>
        <td>Password</td>
        <td><input type="password" width="100" name="password" placeholder="Enter Password" required/></td>
      </tr>
      <tr>
        <td colspan="2" align="center"> <button type="submit">Log in</button> </td>
      </tr>
    </table>
    <input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
  </form>

</body>
</html>
