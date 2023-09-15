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

        

        <h2 class="display-1"><c:out value="${book.title}"></c:out></h2>

        <div>
            <p><span style="color:red"><c:out value="${book.getUser().userName}"></c:out></span> read <span style="color:purple"><c:out value="${book.title}"></c:out></span> by <span style="color:green"><c:out value="${book.author}"></c:out></span>.</p>
        </div>
        <div>
            <P>Here are <c:out value="${book.getUser().userName}"></c:out>'s thoughts:</P>
        </div>
        <div>
            <p><c:out value="${book.thoughts}"></c:out></p>
        </div>

            <a href="/books">back to the shelves</a>


</body>
</html>