<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <div class="container">

        <h2 class="display-1">Change your Entry</h2>

        <div class="card shadow">
            <div class="card-body">
                <form:form action="/books/${book.id}" method="PUT" modelAttribute="book">
                    <input type="hidden" name="user" value="${userId}">
                    <div class="mb-3">
                        <form:label class="form-label" path="title">Title</form:label>
                        <form:input class="form-control" path="title"></form:input>
                        <form:errors class="form-text text-warning" path="title"></form:errors>
                    </div>
                    <div class="mb-3">
                        <form:label class="form-label" path="author">Author</form:label>
                        <form:input class="form-control" path="author"></form:input>
                        <form:errors class="form-text text-warning" path="author"></form:errors>
                    </div>
                    <div class="mb-3">
                        <form:label class="form-label" path="thoughts">My Thoughts</form:label>
                        <form:input class="form-control" path="thoughts"></form:input>
                        <form:errors class="form-text text-warning" path="thoughts"></form:errors>
                    </div>
                    <input class="btn btn-primary" type="submit" value="Submit">
                </form:form>
            </div>
        </div>
        <a href="/books">back to the shelves</a>
    </div>
</body>
</html>