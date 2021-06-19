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
<div class="container">
  <form action="save" method="post">
<label for="fname">FirstName</label>
      <input type="text" id="fname" name="firstName"><br>
    <label for="lname">LastName</label>
      <input type="text" id="lname" name="lastName" ><br>
    <label for="faname">FatherName</label>
      <input type="text" id="faname" name="fatherName" ><br>
    <label for="nationalCode">NationalCode</label>
      <input type="text"  id="nationalCode" name="nationalCode" ><br>
      <input type="submit" value="Save"></input>

  </form>

</div>

</body>
</html>
