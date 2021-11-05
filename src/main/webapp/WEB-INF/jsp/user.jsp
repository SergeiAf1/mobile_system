<%@ page import="com.javaschool.mobile.dto.UserDto" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"--%>
    >
</head>
<body style="background-color: violet">
<br>
<br>
<div align="right">
    <input class="btn-danger" type="button" value="LOG OUT"
           onclick="window.location.href = '/logout'">
</div>
<h1 align="center">
    Hello ${user.name} !!!
</h1>
<div>
    <security:authorize access="hasRole('ADMIN')">
        Go to <input type="button" value="admin page"
                     onclick="window.location.href = '/admin'">
    </security:authorize>
</div>
<h1>${user.name} ${user.surname}</h1>
<c:if test="${user.contracts.size()>0}">
    <h3>My contracts</h3>
    <table class="table table-hover" id="myTable" border="2">
        <thead>
        <tr class="header" align="center">
            <th width="150">Phone number</th>
            <th width="100">Tariff</th>
            <th width="170">Connected options</th>
            <th>Actions</th>
            <th>Actions</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="contract" items="${user.contracts}">
            <c:url var="updateTariff" value="/user/update/tariffs">
                <c:param name="contract_id" value="${contract.id}"></c:param>
            </c:url>
            <c:url var="updateOptions" value="/user/update/options">
                <c:param name="contract_id" value="${contract.id}"></c:param>
            </c:url>
            <tr>
                <td align="center">${contract.phoneNumber}</td>
                <td align="center">${contract.tariffName}</td>

                <td>
                    <c:forEach var="option" items="${contract.options}">
                        <li>${option}</li>
                    </c:forEach>
                </td>
                    <%--            <td align="center">--%>
                    <%--                <c:choose>--%>
                    <%--                    <c:when test="${contract.enabled}">No</c:when>--%>
                    <%--                    <c:otherwise>Yes</c:otherwise>--%>
                    <%--                </c:choose>--%>
                    <%--            </td>--%>
                    <%--            <td align="center">--%>
                    <%--                <c:choose>--%>
                    <%--                    <c:when test="${contract.blockedByUser}">Yes</c:when>--%>
                    <%--                    <c:otherwise>No</c:otherwise>--%>
                    <%--                </c:choose>--%>
                    <%--            </td>--%>
                <c:choose>
                    <c:when test="${contract.enabled == true && contract.blockedByUser == false}">
                        <td align="center">
                            <input id="updtar" class="btn-outline-success" type="button" value="Change tariff"
                                   onclick="window
                                           .location.href = '${updateTariff}'"/>
                        </td>
                        <td align="center">
                            <input type="button" class="btn-outline-success" value="Change options" onclick="window
                                    .location.href = '${updateOptions}'"/>
                        </td>
                    </c:when>
                    <c:otherwise>
                        <td align="center">
                            <input type="button" class="btn" disabled="disabled" value="Change tariff" onclick="window
                                    .location.href = '${updateTariff}'"/>
                        </td>
                        <td align="center">
                            <input type="button" class="btn" disabled="disabled" value="Change options" onclick="window
                                    .location.href = '${updateOptions}'"/>
                        </td>
                    </c:otherwise>
                </c:choose>
                <form:form>
                    <td>
                        <c:if test="${contract.blockedByUser == false}">
                            <button class="btn btn-outline-danger"
                                    onclick="return confirm('Are you sure you want to block the contract?')"
                                    formaction="/user/blockContracts/${contract.id}"
                                    type="submit">Block contract
                            </button>
                        </c:if>
                        <c:if test="${contract.blockedByUser == true}">
                            <button class="btn btn-outline-primary"
                                    formaction="/user/unblockContracts/${contract.id}"
                                    type="submit">Unblock contract
                            </button>
                        </c:if>
                    </td>
                    <c:if test="${contract.enabled == false}">
                        <td style="color: red">
                            <h5>Contract is blocked by Operator</h5>
                        </td>
                    </c:if>
                    <c:forEach var="tar" items="${deprecated_tariffs}">
                        <c:if test="${contract.tariffName == tar}">
                            <td style="color:  darkgreen">
                                <h6>This Tariff is deprecated.</h6>
                                <h6>You can use it as long as you want, but if you change it, you will not be able to
                                    connect it again.</h6>
                            </td>
                        </c:if>
                    </c:forEach>
                </form:form>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<c:if test="${user.contracts.size() == 0}">
    <h4>You don't have any contracts</h4>
    <h5>Please contact us</h5>
</c:if>
<br>
<input type="button" class="btn-link" style="background-color: orchid" value="All Tariffs and Options"
       onclick="window.location.href = '/user/tariffs'">
<br><br>
</body>
</html>

