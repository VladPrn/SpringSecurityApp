<%@ page import="net.proselyte.springsecurityapp.model.Book" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=utf-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Simbir Library</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>


        <header>
            <div class="page-header">
                <h1>Типо шапка</h1>
            </div>
        </header>


        <h1>Личный кабинет пользователя ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Выйти</a></h1>



        <div class="row">
            <div class="col-xs-6">
                <div class="plate">
                    <h3>Личная информация</h3>
                    <form action="">
                        <div class="form-group">
                            <label for="login">Логин</label>
                            <input type="text" class="form-control" name="login" id="login" value="${pageContext.request.userPrincipal.name}">
                        </div>
                        <div class="form-group">
                            <label for="mail">E-mail</label>
                            <input type="text" class="form-control" name="login" id="mail" value="">
                        </div>
                        <div class="form-group">
                            <button class="btn btn-info">Редактировать</button>
                        </div>
                    </form>
                </div>
                <div class="plate">
                    <h3>Смена пароля</h3>
                    <form:form method="POST" modelAttribute="userForm">
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
            <div class="col-xs-6">
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
                                        <button class="btn btn-info btn-xs" type="submit">
                                            Вернуть
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

    </c:if>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>