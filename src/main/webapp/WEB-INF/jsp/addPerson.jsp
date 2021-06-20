<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Hooman
  Date: 6/13/2021
  Time: 11:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>
<table>
    <tr>
        <th>
            FirstName
        </th>
        <th>
            LastName
        </th>
        <th>
            FatherName
        </th>
        <th>
            NationalCode
        </th>
        <th>
            Action
        </th>
    </tr>
    <tr>
        <form:form  action="save" method="post" modelAttribute="persons">
            <td>
                <form:input path="firstName"/><br>
                <form:errors path="firstName"/><br>
            </td>
            <td>
                <form:input path="lastName"/><br>
                <form:errors path="lastName"/><br>
            </td>
            <td>
                <form:input path="fatherName"/><br>
                <form:errors path="fatherName"/><br>
            </td>
            <td>
                <form:input path="nationalCode"/><br>
                <form:errors path="nationalCode"/><br>
            </td>
            <td>
                <input type="submit" value="Save">
            </td>
        </form:form>
    </tr>
</table>
</body>
</html>