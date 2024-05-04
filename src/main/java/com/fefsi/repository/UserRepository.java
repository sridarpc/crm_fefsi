package com.fefsi.repository;

import java.util.Optional;

import com.fefsi.models.LoginRequest;
import com.fefsi.models.User;

public interface UserRepository {

    Optional<User> findById(Long userId);

    boolean findByLoginId(LoginRequest loginRequest);

}
