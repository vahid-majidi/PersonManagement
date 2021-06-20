<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hooman
  Date: 6/18/2021
  Time: 3:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>
<table border="2">
  <tr>
    <th>
      Province
    </th>
    <th>
      City
    </th>
  </tr>
  <c:forEach items="${cityList}" var="cityList">
    <tr>
      <td>
        ${cityList.province}
      </td>
      <td>
        ${cityList.city}
      </td>
    </tr>
  </c:forEach>
  <tr>
    <td>
      <form method="get" action="/person">
        <input type="submit" value="Back">
      </form>
    </td>
  </tr>

</table>

</body>
</html>
