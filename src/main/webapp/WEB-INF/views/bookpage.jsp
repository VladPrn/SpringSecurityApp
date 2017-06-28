<%@ page import="net.proselyte.springsecurityapp.model.Book" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Simbir Library</title>

    <jsp:include page="/WEB-INF/views/header.jsp"/>
</head>
<body>

<div class="container">
    <div class="plate">
        <h1>${book.name}</h1>

        <div class="row">
            <div class="col-md-4">
                <img class="book-picture" src="${contextPath}/resources/images/${book.picture}" alt="">
            </div>
            <div class="col-md-8">
                <p><b>Описание: </b>${book.description}</p>
                <p><b>Автор(ы): </b>${book.author}</p>
                <c:if test="${book.owner != null}">
                    <c:if test="${pageContext.request.userPrincipal.name != book.owner.username}">
                        <p>
                            <b>Сейчас находится у пользователя:</b>
                            <a href="/userpage?userId=${book.owner.id}">${book.owner.username}</a>
                        </p>
                    </c:if>
                    <c:if test="${pageContext.request.userPrincipal.name == book.owner.username}">
                        <p>
                            <b>Сейчас данная книга находится у вас:</b>
                        </p>
                        <form action="/personal?removeBookId=${book.id}" class="form-inline" method="POST">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button class="btn btn-info" type="submit">Вернуть книгу</button>
                        </form>
                    </c:if>
                </c:if>
                <c:if test="${book.owner == null}">
                    <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
                        <form action="?addBookId=${book.id}" class="form-inline" method="POST">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <button class="btn btn-info" type="submit">Взять книгу</button>
                        </form>
                    </sec:authorize>
                    <sec:authorize access="hasRole('BLOCKED')">
                        <p><b>Вы заблокированы!</b></p>
                        <p><b>Вы не можете брать книги!</b></p>
                        <p><b>Обратитесь в офис для снятия блокировки!</b></p>
                    </sec:authorize>
                    <c:if test="${pageContext.request.userPrincipal.name == null}">
                        <p><b>Для получения книги необходимо выполнить:</b></p>
                        <a class="btn btn-info" href="login">Вход</a>
                    </c:if>
                </c:if>
            </div>
        </div>

    </div>
    <div class="plate">
        <ul class="media-list">
            <c:forEach var="comment" items="${comments}">
                <li>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="author">${comment.user.username}</div>
                            <div class="metadata">
                                <span class="date">${comment.time.toGMTString()}</span>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="media-text text-justify">${comment.text}</div>
                        </div>
                    </div>
                </li>
            </c:forEach>
            <li>
                <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
                    <div class="panel panel-primary">
                        <form:form method="POST" modelAttribute="newComment">
                            <spring:bind path="text">
                                <div class="panel-body">
                                    <form:textarea type="text" path="text" class="form-control no-resizey" rows="3"></form:textarea>
                                </div>
                            </spring:bind>
                            <div class="panel-footer">
                                <button class="btn btn-primary" type="submit">Ответить</button>
                            </div>
                        </form:form>
                </sec:authorize>
                <sec:authorize access="hasRole('BLOCKED')">
                    <div class="panel-footer">
                        <p><b>Вы заблокированы!</b></p>
                        <p><b>Вы не можете оставлять комментарии!</b></p>
                        <p><b>Обратитесь в офис для снятия блокировки!</b></p>
                    </div>
                </sec:authorize>
            </li>
        </ul>
    </div>
</div>

</body>
</html>