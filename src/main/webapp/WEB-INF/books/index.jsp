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
        <h2 class="display-1">Welcome, <c:out value="${user.userName}"></c:out></h2>
        <h3>Books from everyone's shelves:</h3>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author Name</th>
                    <th>Posted By</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td><c:out value="${book.id}"></c:out></td>
                        <td>
                            <a href="/books/${book.id}">
                                <c:out value="${book.title}"></c:out>
                            </a>
                        </td>
                        <td><c:out value="${book.author}"></c:out></td>
                        <td><c:out value="${book.getUser().userName}"></c:out></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/books/new" class="btn btn-success">+ Add a book to my shelf!</a>
        <a href="/logout" class="btn btn-danger">Logout</a>
    </div>
</body>
</html>