<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet" >
<br/>
<div  >
    <h2 align="center">Option dependencies</h2>
    <div align="right">
        Go back to <input class="btn-outline-primary" type="button" value="admin page"
                          onclick="window.location.href = '/admin'">
    </div>
    <div>
        <h3>Option name : "${option.name}"</h3>
    </div>
    <%--@elvariable id="option" type="com.javaschool.mobile.dto.OptionDto"--%>
    <form:form action="/admin/save/options" method="post" modelAttribute="option">
        <form:hidden path="id"/>
        <form:hidden path="name"/>
        <form:hidden path="price"/>
        <form:hidden path="connectionPrice"/>
        <table >
            <thead >
            <tr >
                <th width="300">Dependent options</th>
                <th width="5"></th>
                <th width="300">Incompatible options</th>
            </tr>
            </thead>
            <tbody>
            <td>
                <table border="2">
                    <thead >
                    <tr>
                        <th align="center" >
                            Dependent option
                        </th>
                        <th align="center">
                            Yes/No
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${optionList}" var="options">
                        <tr align="center">
                            <td>${options}</td>
                            <td><form:checkbox path="dependentOptions" value="${options}"></form:checkbox></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </td>
            <td></td>
            <td>
                <table border="2">
                    <thead>
                    <tr>
                        <th align="center">
                            Incompatible option
                        </th>
                        <th align="center">
                            Yes/No
                        </th>
                    </tr>
                    </thead>
                    <tbody >
                    <c:forEach items="${optionList}" var="options">
                        <tr align="center">
                            <td>${options}</td>
                            <td><form:checkbox path="incompatibleOptions" value="${options}"></form:checkbox></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </td>
            </tbody>
        </table>
        <input type="submit" class="btn-success" value="CONFIRM">
    </form:form>
</div>
</body>
</html>