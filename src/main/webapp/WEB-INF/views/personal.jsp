<%@ page import="net.proselyte.springsecurityapp.model.Book" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                    <h3>Личная информация</h3>
                    <form action="">
                        <div class="form-group">
                            <label for="login">Логин</label>${System.out.println(pageContext.request.userPrincipal)}
                            <input type="text" class="form-control" name="login" id="login" value="${pageContext.request.userPrincipal.name}">
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail</label>
                            <input type="text" class="form-control" name="email" id="email" value="//TODO выввести email">
                        </div>
                        <div class="form-group">
                            <label for="description">Описание</label>
                            <textarea class="form-control no-resize" rows="7" name="description" id="description">//TODO выввести description</textarea>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-info">Редактировать</button>
                        </div>
                    </form>
                </div>
                <div class="plate">
                    <h3>Смена пароля</h3>
                    <form:form method="POST" modelAttribute="userForm" class="form-signin">
                        <spring:bind path="password">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:input type="password" path="password" class="form-control" placeholder="Пароль"></form:input>
                                <form:errors path="password"></form:errors>
                            </div>
                        </spring:bind>

                        <spring:bind path="confirmPassword">
                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                <form:input type="password" path="confirmPassword" class="form-control"
                                            placeholder="Подтвердите пароль"></form:input>
                                <form:errors path="confirmPassword"></form:errors>
                            </div>
                        </spring:bind>

                        <div class="form-group">
                            <button class="btn btn-info" type="submit">Сменить пароль</button>
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form:form>
                </div>
            </div>
            <div class="col-md-6">
                <div class="plate">
                    <h3>Мои книги</h3>
                    <table class="table table-striped">
                        <tr>
                            <th>№</th>
                            <th>Название</th>
                            <th>Описание</th>
                            <th>Дата</th>
                            <th></th>
                        </tr>
                        <c:forEach var="book" items="${books}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${book.name}</td>
                                <td>${book.description}</td>
                                <td>${book.date}</td>
                                <td class="actions">
                                    <form action="/personal?removeBookId=${book.id}" class="form-inline" method="POST">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button class="btn btn-info btn-xs" type="submit">Вернуть</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>