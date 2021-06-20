<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
      <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>
<table>
  <tr>
    <th>
      Kind OF Contact
    </th>
    <th>
      Number/Email
    </th>
    <th>
      NationalCode
    </th>
    <th>
      Action
    </th>
  </tr>
  <tr>
    <form action="addContact" method="post">
      <td>
        <select name="kindOfContact">
          <option value="HomeNumber">homeNumber</option>
          <option value="WorkNumber">WorkNumber</option>
          <option value="CellPhoneNumber"> CellPhoneNumber</option>
          <option value="Email">Email</option>
        </select>
      </td>
  <td>
    <input type="text" name="phoneNumber">

  </td>
      <td>
        <input type="text" name="nationalCode" value="${nationalCode_c}" readonly="readonly">
      </td>
      <td>
        <input type="submit" value="Save">
      </td>

    </form>
  </tr>
  <tr>
    <td>
      <form method="get" action="/person">
        <input type="submit" value="Back">
      </form>
    </td>
  </tr>
</table>

<form action="/person" method="get">
  <table border="2">
    <tr>
      <th>
        KindOFContact
      </th>
      <th>
        Info
      </th>
    </tr>
<c:forEach items="${contactnumber}" var="num">
    <tr>
    <td>
  ${num.kindOfContact}
</td>
  <td>
      ${num.phoneNumber}
  </td>
    </tr>
</c:forEach>
  </table>
</form>
</body>
</html>
