package com.bookclub.bookclub.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.bookclub.bookclub.models.User;

public interface UserRepository extends CrudRepository<User, Long>  {
    Optional<User> findByEmail(String email);
}