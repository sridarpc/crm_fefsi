package com.fefsi.repository.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.fefsi.models.LoginRequest;
import com.fefsi.models.User;
import com.fefsi.repository.UserRepository;
import com.fefsi.util.BCrypt;
import com.fefsi.util.ProductUtil;

@Repository
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public boolean findByLoginId(LoginRequest loginRequest) {
        try {
            String sql = "select * from users where login_id='" + loginRequest.getLoginId() + "'";
            return jdbcTemplate.query(sql, new ResultSetExtractor<Boolean>() {
                public Boolean extractData(ResultSet rs) throws SQLException, DataAccessException {
                    while (rs.next()) {
                        if (BCrypt.checkpw(loginRequest.getPassword(), rs.getString("password"))) {
                            ProductUtil.getInstace(Integer.parseInt(rs.getString("id").toString()), Integer.parseInt(rs.getString("license_id").toString()));
                            return true;
                        }
                    }
                    return false;
                }
            });
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public Optional<User> findById(Long userId) {
        User user = jdbcTemplate.queryForObject("select * from users where id=?", new BeanPropertyRowMapper<User>(User.class), userId);
        return Optional.ofNullable(user);
    }

}
