package com.fefsi.repository.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.fefsi.models.Payconfig;
import com.fefsi.models.CommonRequest;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.PayconfigRepository;
import com.fefsi.util.ProductUtil;

@Repository
public class PayconfigRepositoryImpl implements PayconfigRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int saveOrUpdatePayconfig(Payconfig payconfig) throws DataAccessException {
        if (saveOrUpdate(payconfig.getId())) {
            return jdbcTemplate.update("UPDATE payconfig_master SET type =?, category =?, amount =? WHERE id=?", new Object[] { payconfig.getType(), payconfig.getCategory(), payconfig.getAmount(), payconfig.getId() });
        } else {
            return jdbcTemplate.update("INSERT INTO payconfig_master (type, category, amount) VALUES ( ?, ?, ?);", new Object[] { payconfig.getType(), payconfig.getCategory(), payconfig.getAmount() });
        }
    }

    @Override
    public int deletePayconfig(int payconfigId) {
        return jdbcTemplate.update("DELETE FROM payconfig_master WHERE id=?", new Object[] { payconfigId });
    }

    @Override
    public Payconfig findPayconfigById(int id) {
        String sql = "SELECT id, type, category, amount FROM payconfig_master WHERE id='" + id + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Payconfig>() {
            @Override
            public Payconfig extractData(ResultSet rs) throws SQLException, DataAccessException {
                Payconfig payconfig = new Payconfig();
                int i = 1;
                while (rs.next()) {
                    payconfig.setSerialNumber(i++);
                    payconfig.setId(rs.getInt("id"));
                    payconfig.setType(rs.getString("type"));
                    payconfig.setCategory(rs.getString("category"));
                    payconfig.setAmount(rs.getString("amount"));
                }
                return payconfig;
            }
        });
    }

    @Override
    public int count() {
        return jdbcTemplate.queryForObject("SELECT count(*) FROM payconfig_master", Integer.class);
    }

    @Override
    public List<Payconfig> findAll(PageRequest page) {
        String sql = "SELECT * FROM payconfig_master where (UPPER(id) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(status) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(name) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(address) like '%" + page.getSearch().toUpperCase() + "%') ORDER BY id " + page.getSort() + " LIMIT " + page.getSize() + " OFFSET " + page.getPage();
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Payconfig>>() {
            @Override
            public List<Payconfig> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Payconfig> payconfigList = new ArrayList<>();
                int i = (page.getPage() / page.getSize()) * page.getSize() + 1;
                while (rs.next()) {
                    Payconfig payconfig = new Payconfig();
                    payconfig.setSerialNumber(i++);
                    payconfig.setId(rs.getInt("id"));
                    payconfig.setType(rs.getString("type"));
                    payconfig.setCategory(rs.getString("category"));
                    payconfig.setAmount(rs.getString("amount"));                 
                    payconfigList.add(payconfig);
                }
                return payconfigList;
            }
        });
    }

    @Override
    public List<Payconfig> findByList() {
        String sql = "SELECT id, name FROM payconfig_master where status='1'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Payconfig>>() {
            @Override
            public List<Payconfig> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Payconfig> payconfigList = new ArrayList<>();
                while (rs.next()) {
                    Payconfig payconfig = new Payconfig();
                    payconfig.setId(rs.getInt("id"));
                    payconfig.setName(rs.getString("name"));
                    payconfigList.add(payconfig);
                }
                return payconfigList;
            }
        });
    }

    

    public boolean saveOrUpdate(int id) {
        String sql = "SELECT cust_id FROM payconfig_master where cust_id ='" + id + "'";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        return count > 0;
    }

}
	
