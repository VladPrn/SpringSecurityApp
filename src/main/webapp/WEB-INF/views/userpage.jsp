<%@ page import="net.proselyte.springsecurityapp.model.Book" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/header.jsp"/>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="plate">
                <p>
                    <b>Логин:</b> ${user.username}<br>
                    <b>E-mail:</b>${user.email}<br>
                    <b>Описание:</b>${user.description}
                </p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="plate">
                <h3>Книги пользователя</h3>
                <table class="table table-striped">
                    <tr>
                        <th>№</th>
                        <th>Название</th>
                        <th>Описание</th>
                        <th>Дата</th>
                    </tr>
                    <c:forEach var="book" items="${books}" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>${book.name}</td>
                            <td>${book.description}</td>
                            <td>${book.date}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>

</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>