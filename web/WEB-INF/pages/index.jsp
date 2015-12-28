<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<head>
  <link href="<c:url value="/resources/css/Style.css"/>" rel="stylesheet"/>
</head>
<br>
<h3>Welcome to my site</h3>

<c:if test="${param.logout != null}">
  <p>You have been logged out successfully.</p>
</c:if>
<br>
<a href="/userPage">USER PAGE</a>
</br>
<br>
<a href="/adminPage">ADMIN PAGE</a>
</br>
<br>
<a href="<c:url value="/logout" />">Logout</a>
</br>

</body>
</html>
