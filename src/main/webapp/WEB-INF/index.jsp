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


        <h1 style="color:purple">Book Club</h1>
        <h4>A place for friends to share thoughts on books.</h4>
        <h3>Registration</h3>

        <div class="card shadow">
            <div class="card-body">
                <form:form action="/register" method="post" modelAttribute="newUser">
                    <div class="mb-3">
                        <form:label class="form-label" path="userName">user name</form:label>
                        <form:input class="form-control" path="userName"></form:input>
                        <form:errors class="form-text text-warning" path="userName"></form:errors>
                    </div>
                    <div class="mb-3">
                        <form:label class="form-label" path="email">email</form:label>
                        <form:input class="form-control" path="email"></form:input>
                        <form:errors class="form-text text-warning" path="email"></form:errors>
                    </div>
                    <div class="mb-3">
                        <form:label class="form-label" path="password">password</form:label>
                        <form:input class="form-control" path="password"></form:input>
                        <form:errors class="form-text text-warning" path="password"></form:errors>
                    </div>
                    <div class="mb-3">
                        <form:label class="form-label" path="confirm">confirm password</form:label>
                        <form:input class="form-control" path="confirm"></form:input>
                        <form:errors class="form-text text-warning" path="confirm"></form:errors>
                    </div>
                    <input class="btn btn-primary" type="submit" value="register">
                </form:form>
            </div>
        </div>

        <h3>Login</h3>
        <div class="card shadow">
            <div class="card-body">
                <form:form action="/login" method="post" modelAttribute="newLogin">
                    <div class="mb-3">
                        <form:label class="form-label" path="email">email</form:label>
                        <form:input class="form-control" path="email"></form:input>
                        <form:errors class="form-text text-warning" path="email"></form:errors>
                    </div>
                    <div class="mb-3">
                        <form:label class="form-label" path="password">password</form:label>
                        <form:input class="form-control" path="password"></form:input>
                        <form:errors class="form-text text-warning" path="password"></form:errors>
                    </div>
                    <input class="btn btn-primary" type="submit" value="login">
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>