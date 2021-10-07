<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<body style="background-color: fuchsia">
<br>
<br>
<div align="right">
    <input type="button" value="LOG OUT"
           onclick="window.location.href = '/logout'">
</div>
<br>
<br>
<h1 align="center">
    Hello user !!!
</h1>
<br>

<br>

<br>
<div align="center">
<security:authorize access="hasRole('ADMIN')">
    <input type="button" value="ADMIN PAGE"
           onclick="window.location.href = '/admin'">
    Go to ADMIN PAGE
</security:authorize>
</div>
<br>
<br>
<div>
    <input type="button" value="Show tariffs name"
           onclick="window.location.href = '/user/tariffs/5'">
    Tariff name   : ${tariffName}

</div>
<br>
</body>
</html>