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
   <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>

<table border="2">

    <tr>
        <td>
            NickName
        </td>
        <td>
            FatherName
        </td>
        <td>
            NationalCode
        </td>
           <td>
            Modify\Delete
        </td>
        <td>
            Contact
        </td>
        <td>
            Address
        </td>
       </tr>
    <c:forEach items="${personList}" var="personList">

        <tr>
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
                <a href="${pageContext.request.contextPath}/person/Address/${personList.nationalCode}">Address</a>
            </td>
        </tr>
    </c:forEach>

</table>
<hr>
<table bgcolor="#fff8dc" border="2">
    <form method="get" action="${pageContext.request.contextPath}/person/addPerson">
        <input type="submit" value="AddNewPerson" >
    </form>
</table>

</body>
</html>
