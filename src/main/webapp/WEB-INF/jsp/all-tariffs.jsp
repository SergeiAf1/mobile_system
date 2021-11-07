<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"--%>
<%--          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--%>
<%--</head>--%>
<%--<body style="background-color: violet">--%>
<%--<br>--%>
<%--<h2>--%>
<%--    All Tariffs and Options--%>
<%--</h2>--%>
<%--<div align="right">--%>
<%--    Go back to <input type="button" value="main page"--%>
<%--                      onclick="window.location.href = '/user'">--%>
<%--</div>--%>
<%--<br>--%>
<%--<div style="float:left;">--%>
<%--    <table width="450" border="1" style="float: left;">--%>
<%--        <thead>--%>
<%--        <tr align="center">--%>
<%--            <th width="100">Tariff</th>--%>
<%--            <th width="100">Price</th>--%>
<%--            <th width="200">Available options</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach var="tariff" items="${tariffs}">--%>
<%--            <tr>--%>
<%--                <td align="center">${tariff.tariffName}</td>--%>
<%--                <td align="center">${tariff.price}</td>--%>
<%--                <td><p align="center"><a href="javascript:flipflop('${tariff.tariffName}');">Options</a></p>--%>
<%--                    <ul id="${tariff.tariffName}" style="display: none;">--%>
<%--                        <c:forEach var="option" items="${tariff.options}">--%>
<%--                            <li>${option.name}</li>--%>
<%--                        </c:forEach>--%>
<%--                    </ul>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--    <table width="200" style="float: left">--%>
<%--        <tr>--%>
<%--            <th></th>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--    <table width="450" border="1" style="float: right">--%>
<%--        <thead>--%>
<%--        <tr align="center">--%>
<%--            <th>Option name</th>--%>
<%--            <th>Price</th>--%>
<%--            <th>Connection price</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach var="option" items="${options}">--%>
<%--            <tr>--%>
<%--                <td>${option.name}</td>--%>
<%--                <td align="center">${option.price}</td>--%>
<%--                <td align="center">${option.connectionPrice}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        <tr></tr>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</div>--%>
<%--<br/>--%>
<%--<br/><br/>--%>
<%--<br/><pre></pre>--%>

<%--    &lt;%&ndash;<p style="font-size: x-large"> <a href="javascript:flipflop('oldtariffs');">Old tariffs</a></p>&ndash;%&gt;--%>
<%--    &lt;%&ndash;    <a href="javascript:flipflop('oldtariffs');">Old tariffs</a>&ndash;%&gt;--%>
<%--    &lt;%&ndash;<table  id="oldtariffs" width="300" border="2" style="display: none;">&ndash;%&gt;--%>
<%--    <h3>Old tariffs</h3>--%>
<%--    <table id="oldtariffs" width="300" border="2">--%>
<%--        <thead>--%>
<%--        <tr align="center">--%>
<%--            <th>Name</th>--%>
<%--            <th>Price</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach var="tariff" items="${oldtariffs}">--%>
<%--            <tr align="center">--%>
<%--                <td>${tariff.tariffName}</td>--%>
<%--                <td>${tariff.price}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        </tbody>--%>
<%--    </table>--%>

<%--<script language="JavaScript">--%>
<%--    function flipflop(id) {--%>
<%--        element = document.getElementById(id);--%>
<%--        if (element)--%>
<%--            element.style.display = element.style.display == "none" ? "" : "none";--%>
<%--    }--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-color: violet" class="modal-body">
<br>
<h2 align="center">
      All Tariffs and Options
</h2>
<div align="right">
    Go back to <input type="button" class="btn-info" value="main page"
                      onclick="window.location.href = '/user'">
</div>
<br>
<table>
    <tr>
        <td>
            <table width="450" border="1">
                <thead>
                <tr align="center">
                    <th width="100">Tariff</th>
                    <th width="100">Price</th>
                    <th width="200">Available options</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="tariff" items="${tariffs}">
                    <tr>
                        <td align="center">${tariff.tariffName}</td>
                        <td align="center">${tariff.price}</td>
                        <td><p align="center"><a href="javascript:flipflop('${tariff.tariffName}');">Options</a></p>
                            <ul id="${tariff.tariffName}" style="display: none;">
                                <c:forEach var="option" items="${tariff.options}">
                                    <li>${option}</li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </td>
        <td>
            <table width="200">
            </table>
        </td>
        <td>
            <table width="450" border="1">
                <thead>
                <tr align="center">
                    <th>Option name</th>
                    <th>Price</th>
                    <th>Connection price</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="opt" items="${options}">
                    <tr>
                        <td>${opt.name}</td>
                        <td align="center">${opt.price}</td>
                        <td align="center">${opt.connectionPrice}</td>
                    </tr>
                </c:forEach>
                <tr></tr>
                </tbody>
            </table>
        </td>
    </tr>
</table>
<br/>
<p style="font-size: x-large"><a href="javascript:flipflop('oldtariffs');">Deprecated tariffs</a></p>
<table id="oldtariffs" width="300" border="2" style="display: none;">
    <thead>
    <tr align="center">
        <th>Name</th>
        <th>Price</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="tariff" items="${oldtariffs}">
        <tr align="center">
            <td>${tariff.tariffName}</td>
            <td>${tariff.price}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script language="JavaScript">
    function flipflop(id) {
        element = document.getElementById(id);
        if (element)
            element.style.display = element.style.display == "none" ? "" : "none";
    }
</script>
</body>
</html>