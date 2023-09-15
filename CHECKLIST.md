# beltdemo

- [ ] update [application.properties](./src/main/resources/application.properties)

```
# Where are jsp files? HERE!
spring.mvc.view.prefix=/WEB-INF/
# Data Persistence
spring.datasource.url=jdbc:mysql://localhost:3306/beltdemo
spring.datasource.username=root
spring.datasource.password=root
spring.jpa.hibernate.ddl-auto=update
# For Update and Delete method hidden inputs
spring.mvc.hiddenmethod.filter.enabled=true
```

- [ ] update [pom.xml](./pom.xml)

```xml
        <!-- DEPENDENCIES FOR STARTING SPRING PROJECTS-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <scope>runtime</scope>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-tomcat</artifactId>
            <scope>provided</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
        <!-- DEPENDENCIES FOR DISPLAYING JSPS AND USING JSTL TAGS -->
        <dependency>
            <groupId>org.apache.tomcat.embed</groupId>
            <artifactId>tomcat-embed-jasper</artifactId>
        </dependency>
        <dependency>
            <groupId>jakarta.servlet.jsp.jstl</groupId>
            <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
        </dependency>
        <dependency>
            <groupId>org.glassfish.web</groupId>
            <artifactId>jakarta.servlet.jsp.jstl</artifactId>
        </dependency>
        <!-- DEPENDENCIES FOR INTEGRATING SQL DATABASE AND USING JPA -->
        <!-- Note: Project will not run until a schema has been created and the 
            proper settings in application properties are present for 
            connecting to a database. -->
        <dependency>
            <groupId>com.mysql</groupId>
            <artifactId>mysql-connector-j</artifactId>
            <scope>runtime</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <!-- DEPENDENCY FOR USING VALIDATION ANNOTATIONS -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-validation</artifactId>
        </dependency>
        <!-- DEPENDENCY FOR USING BCRYPT  -->
        <dependency>
            <groupId>org.mindrot</groupId>
            <artifactId>jbcrypt</artifactId>
            <version>0.4</version>
        </dependency>
        <!-- DEPENDENCIES FOR BOOTSTRAP -->
        <dependency>
            <groupId>org.webjars</groupId>
            <artifactId>webjars-locator</artifactId>
            <version>0.46</version>
        </dependency>
        <dependency>
            <groupId>org.webjars</groupId>
            <artifactId>bootstrap</artifactId>
            <version>5.2.3</version>
        </dependency>

```

- [ ] add [views](./src/main/webapp/WEB-INF/index.jsp)

```html
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

        <h2 class="display-1">Registration</h2>

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

        <h2 class="display-1">Login</h2>
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

```

- [ ] add [User.java](./src/main/java/com/bookclub/beltdemo/models/User.java)

```java
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
    
@Entity
@Table(name="users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="Username is required!")
    @Size(min=3, max=30, message="Username must be between 3 and 30 characters")
    private String userName;
    
    @NotEmpty(message="Email is required!")
    @Email(message="Please enter a valid email!")
    private String email;
    
    @NotEmpty(message="Password is required!")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;
    
    @Transient
    @NotEmpty(message="Confirm Password is required!")
    @Size(min=8, max=128, message="Confirm Password must be between 8 and 128 characters")
    private String confirm;

    // This will not allow the createdAt column to be updated after creation
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
  
    public User() {}

    
    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return this.confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }


    public Date getCreatedAt() {
        return this.createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return this.updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }


        // other getters and setters removed for brevity
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

}

```

- [ ] add [LoginUser.java](./src/main/java/com/bookclub/beltdemo/models/LoginUser.java)

```java
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
    
public class LoginUser {
    
    @NotEmpty(message="Email is required!")
    @Email(message="Please enter a valid email!")
    private String email;
    
    @NotEmpty(message="Password is required!")
    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;
    
    public LoginUser() {}
    
    // TODO - Don't forget to generate getters and setters


    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
}

```

- [ ] add [controllers](./src/main/java/com/bookclub/beltdemo/controllers/HomeController.java)

```java


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bookclub.loginandreg.models.LoginUser;
import com.bookclub.loginandreg.models.User;
import com.bookclub.loginandreg.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

// .. don't forget to include all your imports! ..
    
@Controller
public class HomeController {
    
    // Add once service is implemented:
    @Autowired UserService userService;
    
    // private final UserService userService;


    // public HomeController(UserService userService) {
    //     this.userService = userService;
    // }


    @GetMapping("/")
    public String index(Model model) {
    
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
        // TO-DO Later -- call a register method in the service 
        User user = userService.register(newUser, result);
        // to do some extra validations and create a new user!
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
        session.setAttribute("user", user);
    
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
        User user = userService.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
    
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        session.setAttribute("userId", user.getId());
        session.setAttribute("user", user);

    
        return "redirect:/home";
    }

    @GetMapping("/home")
    public String home(HttpSession session){
        if(session.getAttribute("userId") == null){
            return "redirect:/";
        }
        return "home.jsp";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
    
        return "redirect:/";
    }
    
}

```

- [UserRepository.java](./src/main/java/com/bookclub/beltdemo/repositories/UserRepository.java)

```java


import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.bookclub.loginandreg.models.User;

public interface UserRepository extends CrudRepository<User, Long>  {
    Optional<User> findByEmail(String email);
}

```

- [UserService.java](./src/main/java/com/bookclub/beltdemo/service/UserService.java)

```java

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.bookclub.loginandreg.models.LoginUser;
import com.bookclub.loginandreg.models.User;
import com.bookclub.loginandreg.repositories.UserRepository;

@Service
public class UserService {

    @Autowired UserRepository userRepository;

    // TO-DO: Write register and login methods!
    public User register(User newUser, BindingResult result) {
        // TO-DO: Additional validations!
        // TO-DO - Reject values or register if no errors:
        
        // Reject if email is taken (present in database)
        if(userRepository.findByEmail(newUser.getEmail()).isPresent()){
            result.rejectValue("email", "Unique", "Email is taken");
        } 

        // Reject if password doesn't match confirmation

        if(!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }
        
        // Return null if result has errors

        if(result.hasErrors()){
            return null;
        }
    
        // Hash password, 
        
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        System.out.println(hashed);
        
        // set password

        newUser.setPassword(hashed);
        //save user to database

        return userRepository.save(newUser);
    }
    public User login(LoginUser newLoginObject, BindingResult result) {
        // TO-DO: Additional validations!
                // TO-DO - Reject values:      
    	// Find user in the DB by email
        Optional<User> user = userRepository.findByEmail(newLoginObject.getEmail());

        // Reject if NOT present
        if(!user.isPresent()){
            result.rejectValue("email", "loginEmail", "email not found!");
        }else if(!BCrypt.checkpw(newLoginObject.getPassword(), user.get().getPassword())){
            result.rejectValue("password", "logpassword", "invalid credentials");
        }
    
        // Return null if result has errors
        if(result.hasErrors()){
            return null;
        }
        // Otherwise, return the user object
        return user.get();
    }
    
}

```