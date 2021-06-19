<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
      <link  rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>
<form action="addAddress" method="post">
    <label for="nationalCode">NationalCode</label>
    <input type="text" id="nationalCode" name="NATIONAL_CODE_ADDRESS" VALUE="${nationalCode_a}" readonly="readonly"><br>
    <label for="Province">Province</label>
    <input type="text" id="Province" name="province" ><br>
    <label for="City">City</label>
    <input type="text" id="City" name="city" style="color: aquamarine" ><br>
    <label for="PostCode">PostCode</label>
    <input type="text"  id="PostCode" name="postcode" ><br>
    <input type="submit" value="Save"></input>

</form>
</body>
</html>
