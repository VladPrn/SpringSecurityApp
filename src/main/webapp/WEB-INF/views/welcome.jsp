<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <h2>
            Привет ${pageContext.request.userPrincipal.name} |
            <a href="${contextPath}/personal">Личный кабинет</a> |
            <c:if test="${pageContext.request.userPrincipal.name == 'proselyte'}">
                <a href="${contextPath}/admin">Администрирование</a> |
            </c:if>
            <a onclick="document.forms['logoutForm'].submit()">Выйти</a>
        </h2>
    </c:if>

    <c:if test="${pageContext.request.userPrincipal.name == null}">
        <div class="container">
            <h2>
                Привет Гость |
                <a href="${contextPath}/login">Войти</a>
            </h2>
        </div>
    </c:if>


    <div class="container-fluid">
        <div class="col-md-3 pull-left">
            <h2>Книги</h2>
        </div>
        <div class="col-md-3 input-group h2 pull-right">
            <%--форма поиска окно+кнопка--%>
            <form action="" class="form-inline" method="GET" onsubmit="this.booksSearch.value = encodeURI(this.tempField.value)">
                <%--окно ввода поиска--%>
                <div class="col-md-10 form-group">
                    <input name="booksSearch" type="hidden">
                    <input name="tempField" class="form-control" id="search" type="text"
                           placeholder="Введите название книги" value="${param.booksSearch}">
                </div>
                <%--кнопка поиска--%>
                <button class="col-md-2 btn btn-primary" type="submit">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </form>
        </div>
    </div>

    <div class="container-fluid" style="margin-top: 10px">
        <div class="row">
            <c:forEach var="book" items="${books}" varStatus="loop">
                <a class="col-xs-4 col-sm-4 col-md-2 col-lg-2" href="/bookpage?bookId=${book.id}">
                    <c:if test="${book.owner == null}">
                        <h4 align="center">${book.name}</h4>
                        <img src="https://ozon-st.cdn.ngenix.net/multimedia/1007119597.jpg" class="img-responsive"
                             style="margin-bottom: 15px">
                    </c:if>
                    <c:if test="${book.owner != null}">
                        <h4 align="center">${book.name}</h4>
                        <img src="https://ozon-st.cdn.ngenix.net/multimedia/1007119597.jpg" class="img-responsive"
                             style="margin-bottom: 15px; opacity: 0.5">
                    </c:if>
                </a>
            </c:forEach>
        </div>
    </div>

    <div class="container-fluid" style="text-align: center">
        <ul class="pagination" style="display: inline-block">
            <li><a href="">&lt; Назад</a></li>
            <li><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href="">3</a></li>
            <li><a href="">4</a></li>
            <li><a href="">5</a></li>
            <li><a href="">6</a></li>
            <li><a href="">7</a></li>
            <li><a href="">Вперед &gt;</a></li>
        </ul>
    </div>


</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>