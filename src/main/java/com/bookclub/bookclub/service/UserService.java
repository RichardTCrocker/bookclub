package com.bookclub.bookclub.service;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.bookclub.bookclub.models.LoginUser;
import com.bookclub.bookclub.models.User;
import com.bookclub.bookclub.repositories.UserRepository;

@Service
public class UserService {

    @Autowired UserRepository userRepository;

    public User register(User newUser, BindingResult result) {
        if(userRepository.findByEmail(newUser.getEmail()).isPresent()){
            result.rejectValue("email", "Unique", "Email is taken");
        }
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }
        if(result.hasErrors()){
            return null;
        }
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);
        return userRepository.save(newUser);
    }
    public User login(LoginUser newLoginObject, BindingResult result) {
        Optional<User> user = userRepository.findByEmail(newLoginObject.getEmail());
        if(!user.isPresent()){
            result.rejectValue("email", "loginEmail", "email not found!");
        }else if(!BCrypt.checkpw(newLoginObject.getPassword(), user.get().getPassword())){
            result.rejectValue("password", "logpassword", "invalid credentials");
        }
        if(result.hasErrors()){
            return null;
        }
        return user.get();
    }
    
}