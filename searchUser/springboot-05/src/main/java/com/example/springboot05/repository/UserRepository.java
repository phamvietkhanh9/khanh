package com.example.springboot05.repository;

import com.example.springboot05.entity.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends CrudRepository <User,Long>{
   List<User> findUserByName(@Param("name") String name);
//    Iterable<User> findByname(String name);
}
