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
</head>
<body>
<div class="container">
  <form action="/person/edit" method="post">
<label for="fname"></label><br>
      <input type="text" id="fname" name="firstName">
    <label for="lname"></label><br>
      <input type="text" id="lname" name="lastName" >
    <label for="faname"></label><br>
      <input type="text" id="faname" name="fatherName" >
    <label for="nationalCode"></label><br>
      <input type="text"  id="nationalCode" name="nationalCode" value="${nationalCode}" readonly="readonly" >

      <input type="submit" value="Edit"></input>

  </form>
</div>

</body>
</html>
