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
        <form action="save" method="post">
            <td>
                <input type="text" id="fname" name="firstName"><br>
            </td>
            <td>
                <input type="text" id="lname" name="lastName"><br>
            </td>
            <td>
                <input type="text" id="faname" name="fatherName"><br>
            </td>
            <td>
                <input type="text" id="nationalCode" name="nationalCode"><br>
            </td>
            <td>
                <input type="submit" value="Save"></input>
            </td>

        </form>
    </tr>
</table>
</body>
</html>