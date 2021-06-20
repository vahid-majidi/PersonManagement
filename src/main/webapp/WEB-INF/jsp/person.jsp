<%--
  Created by IntelliJ IDEA.
  User: Hooman
  Date: 6/13/2021
  Time: 9:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>PersonManagement</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>

<table border="1">
    <tr>
        <th>
            Name
        </th>
        <th>
            Family
        </th>
        <th>
            NickName
        </th>
        <th>
            FatherName
        </th>
        <th>
            NationalCode
        </th>
        <th>
            Modify\Delete
        </th>
        <th>
            Contanct
        </th>
        <th>
            Address
        </th>
    </tr>
    <c:forEach items="${personList}" var="personList">
        <tr>
            <td>
                    ${personList.firstName}
            </td>
            <td>
                    ${personList.lastName}
            </td>
            <td>
                    ${personList.firstName}${personList.lastName}
            </td>
            <td>
                    ${personList.fatherName}
            </td>
            <td>
                    ${personList.nationalCode}
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/person/editForm/${personList.nationalCode}">Edit</a>
                <a href="${pageContext.request.contextPath}/person/delete/${personList.nationalCode}">Delete</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/person/Contact/${personList.nationalCode}">Contact</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/person/address/${personList.nationalCode}">Address</a>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td>
            <form method="get" action="${pageContext.request.contextPath}/person/addPerson">
                <input type="submit" value="AddNewPerson">
            </form>
        </td>
    </tr>
</table>
<table border="1">
<tr>
    <th>
        Show List Of City Order By Province
    </th>
</tr>
    <tr>
        <td>
            <form method="get" action="/person/showCityList">
         <label/>Select Province       <select name="province">
                    <c:forEach items="${distinct}" var="addressList">
                        <option value="${addressList}" label="province" name="Province">${addressList}</option>
                    </c:forEach>
                </select>
                <br><input type="submit" value="select">
            </form>
        </td>
    </tr>
</table>
</body>
</html>
