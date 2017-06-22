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


    <title>Админка</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="сontainer">
    <div class="col-md-12">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logoutForm" method="post" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    <h2>Страница Админа - ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Выйти</a>
    </h2>
    </c:if>
        </div>
</div>

<div id="main" class="container">
    <div id="top" class="row">
        <div class="col-md-3">
            <h2>Книги</h2>
        </div>
        <div class="col-md-6">
            <div class="input-group h2">
                <input name="data[search]" class="form-control" id="search" type="text" placeholder="Введите название книги">
                <span class="input-group-btn">
                <button class="btn btn-primary" type="submit">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </span>
            </div>
        </div>
        <div class="col-md-3">
            <a href="add.html" class="btn btn-primary pull-right h2">Добавить книгу</a>
        </div>
    </div> <!-- /#top -->

    <div id="books" class="row">
        <div class="table-responsive col-md-12">
            <table class="table table-striped" cellspacing="0" cellpadding="0">
                <tr>
                    <th>Порядковый номер</th>
                    <th>Название</th>
                    <th>Описание</th>
                    <th>Дата добавления</th>
                    <th class="actions">Опции</th>
                </tr>
                <tbody>

                <c:forEach var="book" items="${books}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${book.name}</td>
                        <td>${book.description}</td>
                        <td>${book.date}</td>
                        <td class="actions">
                            <a class="btn btn-success btn-xs" href="#">Изменить</a>
                            <a class="btn btn-danger btn-xs"  href="#" data-toggle="modal" data-target="#delete-modal">Удалить</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        </div>
    <div id="bottom1" class="row">
        <div class="col-md-12">

            <ul class="pagination">
                <li class="disabled"><a>&lt; Назад</a></li>
                <li class="disabled"><a>1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li class="next"><a href="#" rel="next">Вперед &gt;</a></li>
            </ul><!-- /.pagination -->

        </div>
    </div> <!-- /#bottom -->
    <div class="col-md-3">
        <h2>Пользователи</h2>
    </div>
    <div id="users" class="row">
        <div class="table-responsive col-md-12">
            <table class="table table-striped" cellspacing="0" cellpadding="0">
                <tr>
                    <th>Порядковый номер</th>
                    <th>Имя</th>
                    <th class="actions">Опции</th>
                </tr>
                <tbody>
                <c:forEach var="user" items="${users}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${user.username}</td>
                        <td class="actions"><a class="btn btn-danger btn-xs"  href="#" data-toggle="modal" data-target="#delete-modal">Блокировать</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div id="bottom2" class="row">
        <div class="col-md-12">

            <ul class="pagination">
                <li class="disabled"><a>&lt; Назад</a></li>
                <li class="disabled"><a>1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li class="next"><a href="#" rel="next">Вперед &gt;</a></li>
            </ul><!-- /.pagination -->

        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>