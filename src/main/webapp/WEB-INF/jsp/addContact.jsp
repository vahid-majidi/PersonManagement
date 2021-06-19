<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
      <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>
<form action="addContact" method="post">
  <select name="kindOfContact">
    <option value="HomeNumber">homeNumber</option>
    <option value="WorkNumber">WorkNumber</option>
    <option value="CellPhoneNumber"> CellPhoneNumber</option>
    <option value="Email">Email</option>
  </select>
  <input type="text" name="phoneNumber">
  <input type="text" name="NATIONAL_CODE_CONTACT" value="${nationalCode_c}" readonly="readonly">
  <input type="submit" value="Save">

</form>
<form action="/person" method="get">
  <table border="2">
    <tr>
      <td>
        KindOFContact
      </td>
      <td>
        Info
      </td>
    </tr>
    <tr>
      <c:forEach items="${contactCount}" var="contactC">
<td>
  ${contactC.kindOfContact}
</td>
        <td>
  ${contactC.phoneNumber}
</td>
    </tr>

    </c:forEach>
  </table>
</form>
</body>
</html>
