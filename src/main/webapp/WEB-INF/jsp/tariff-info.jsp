<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<body style="background-color: greenyellow">
<h2>Tariff Info</h2>
<br />
<form:form action="saveTariff" modelAttribute="tariff">

    <form:hidden path="id"/>

    Name <form:input path="tariffName"/>
    <br /> <br />
    Price <form:input path="price"/>
    <br /> <br />

    <input type="submit" value="CONFIRM">
    <br /> <br />

</form:form>

</body>
</html>