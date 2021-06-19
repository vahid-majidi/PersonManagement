<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
      <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>
<table>
    <tr>


    <th>
        NationalCode
    </th>
    <th>
        Province
    </th>
    <th>
        City
    </th>
    <th>
        PostCode
    </th>
        <th>
            Action
        </th>
    </tr>
    <tr>
        <form action="addAddress" method="post">
            <td>
                <input type="text" id="nationalCode" name="nationalCode" VALUE="${nationalCode_a}" readonly="readonly"><br>

            </td>
            <td>
                <input type="text" id="Province" name="province" ><br>

            </td>
            <td>
                <input type="text" id="City" name="city" style="color: aquamarine" ><br>

            </td>
            <td>
                <input type="text"  id="PostCode" name="postcode" ><br>

            </td>
            <td>
                <input type="submit" value="Save">

            </td>

        </form>
    </tr>
</table>

<table border="2">
    <tr>
        <th>
            Province
        </th>
        <th>
            City
        </th>
    </tr>
    <c:forEach items="${AddressList}" var="add">
        <tr>
            <td>
                    ${add.province}
            </td>
            <td>
                    ${add.city}
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
