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
<div id="main" class="container">
    <div id="top" class="row">
        <div class="col-md-3">
            <h2>Книги</h2>
        </div>
        <div class="col-md-6">
            <div class="input-group h2">
                <form action="/admin" class="form-inline" method="GET" onsubmit="this.booksSearch.value = encodeURI(this.tempField.value)">
                    <div class="form-group">
                        <input name="booksSearch" type="hidden">
                        <input name="tempField" class="form-control" id="search" type="text" placeholder="Введите название книги" value="${param.booksSearch}">
                    </div>
                    <button class="btn btn-primary" type="submit">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </form>
            </span>
            </div>
        </div>
        <div class="col-md-3">
            <a href="${contextPath}/addbook" class="btn btn-primary pull-right h2">Добавить книгу</a>
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
                        <td>${(param.booksPage - 1) * 5 + loop.index + 1}</td>
                        <td>${book.name}</td>
                        <td>${book.description}</td>
                        <td>${book.date}</td>
                        <td class="actions">
                            <a class="btn btn-success btn-xs" href="${contextPath}/addbook?bookId=${book.id}">Изменить</a>
                            <form action="?deleteBookId=${book.id}" class="form-inline" method="POST">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button class="btn btn-danger btn-xs" type="submit">Удалить</button>
                            </form>
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
                <c:if test="${param.booksPage != 1}">
                    <li><a href="?booksPage=${param.booksPage - 1}&usersPage=${param.usersPage}&booksSearch=${param.booksSearch}">&lt; Назад</a></li>
                </c:if>
                <c:if test="${param.booksPage == 1}">
                    <li li class="disabled"><a>&lt; Назад</a></li>
                </c:if>
                <c:forEach var="curr" items="${booksPageContr.pages}">
                    <c:if test="${param.booksPage != curr}">
                        <li><a href="?booksPage=${curr}&usersPage=${param.usersPage}&booksSearch=${param.booksSearch}">${curr}</a></li>
                    </c:if>
                    <c:if test="${param.booksPage == curr}">
                        <li li class="disabled"><a>${curr}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${param.booksPage != booksPageContr.countPages}">
                    <li><a href="?booksPage=${param.booksPage + 1}&usersPage=${param.usersPage}&booksSearch=${param.booksSearch}">Вперед &gt;</a></li>
                </c:if>
                <c:if test="${param.booksPage == booksPageContr.countPages}">
                    <li li class="disabled"><a>Вперед &gt;</a></li>
                </c:if>
            </ul><!-- /.pagination -->

        </div>
    </div> <!-- /#bottom -->
    <div class="col-md-3">
        <h2 name="users">Пользователи</h2>
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
                        <td>${(param.usersPage - 1) * 5 + loop.index + 1}</td>
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
                <c:if test="${param.usersPage != 1}">
                    <li><a href="?booksPage=${param.booksPage}&usersPage=${param.usersPage - 1}&booksSearch=${param.booksSearch}#users">&lt; Назад</a></li>
                </c:if>
                <c:if test="${param.usersPage == 1}">
                    <li li class="disabled"><a>&lt; Назад</a></li>
                </c:if>
                <c:forEach var="curr" items="${usersPageContr.pages}">
                    <c:if test="${param.usersPage != curr}">
                        <li><a href="?booksPage=${param.booksPage}&usersPage=${curr}&booksSearch=${param.booksSearch}#users">${curr}</a></li>
                    </c:if>
                    <c:if test="${param.usersPage == curr}">
                        <li li class="disabled"><a>${curr}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${param.usersPage != usersPageContr.countPages}">
                    <li><a href="?booksPage=${param.booksPage}&usersPage=${param.usersPage + 1}&booksSearch=${param.booksSearch}#users">Вперед &gt;</a></li>
                </c:if>
                <c:if test="${param.usersPage == usersPageContr.countPages}">
                    <li li class="disabled"><a>Вперед &gt;</a></li>
                </c:if>
            </ul><!-- /.pagination -->

        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>