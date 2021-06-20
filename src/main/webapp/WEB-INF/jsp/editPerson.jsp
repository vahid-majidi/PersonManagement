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
    <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>
<table>
    <form action="/person/edit" method="post">

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
<td>
    <input type="text" id="fname" name="firstName">

</td>
        <td>
            <input type="text" id="lname" name="lastName" >

        </td>
        <td>
            <input type="text" id="faname" name="fatherName" >

        </td>
        <td>
            <input type="text"  id="nationalCode" name="nationalCode" value="${nationalCode}" readonly="readonly" >

        </td>
        <td>
            <input type="submit" value="Edit"></input>

        </td>

    </tr>
  </form>
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
