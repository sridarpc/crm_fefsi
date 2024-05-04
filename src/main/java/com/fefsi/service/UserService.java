package com.fefsi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fefsi.models.LoginRequest;
import com.fefsi.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public boolean authenticateUser(LoginRequest loginRequest) {
        return userRepository.findByLoginId(loginRequest);
    }

}
