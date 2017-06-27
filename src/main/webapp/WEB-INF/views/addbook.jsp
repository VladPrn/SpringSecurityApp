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
    <h1>Добавление книги</h1>
    <div class="row">
        <div class="col-md-6">
            <div class="plate">
                <form action="/addbook" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="id" value="${book.id}"/>
                    <div class="form-group"
                        <label>Название</label>
                        <input type="text" class="form-control" name="name" value="${book.name}"/>
                    </div>
                    <div class="form-group">
                        <label>Описание</label>
                        <input type="text" class="form-control" name="description" value="${book.description}"/>
                    </div>
                    <input type="file" name="file" />
                    <input type="submit" class="btn btn-success" value="Загрузить"/>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>