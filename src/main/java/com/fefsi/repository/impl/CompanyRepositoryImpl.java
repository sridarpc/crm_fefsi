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

import com.fefsi.models.Company;
import com.fefsi.models.CommonRequest;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.CompanyRepository;
import com.fefsi.util.ProductUtil;

@Repository
public class CompanyRepositoryImpl implements CompanyRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int saveOrUpdateCompany(Company company) throws DataAccessException {
        if (saveOrUpdate(company.getId())) {
            return jdbcTemplate.update("UPDATE company_master SET name =?, address =? WHERE id=?", new Object[] { company.getName(), company.getAddress(), company.getStatus(), company.getId() });
        } else {
            return jdbcTemplate.update("INSERT INTO company_master (name, address, status) VALUES ( ?, ?, ?);", new Object[] { company.getName(), company.getAddress(), company.getStatus() });
        }
    }

    @Override
    public int deleteCompany(int companyId) {
        return jdbcTemplate.update("DELETE FROM company_master WHERE cust_id=?", new Object[] { companyId });
    }

    @Override
    public Company findCompanyById(int id) {
        String sql = "SELECT id, name, address, status FROM company_master WHERE id='" + id + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Company>() {
            @Override
            public Company extractData(ResultSet rs) throws SQLException, DataAccessException {
                Company company = new Company();
                int i = 1;
                while (rs.next()) {
                    company.setSerialNumber(i++);
                    company.setId(rs.getInt("id"));
                    company.setName(rs.getString("name"));
                    company.setAddress(rs.getString("address"));
                    company.setStatus(rs.getString("status"));
                }
                return company;
            }
        });
    }

    @Override
    public int count() {
        return jdbcTemplate.queryForObject("SELECT count(*) FROM company_master", Integer.class);
    }

    @Override
    public List<Company> findAll(PageRequest page) {
        String sql = "SELECT * FROM company_master where (UPPER(id) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(status) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(name) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(address) like '%" + page.getSearch().toUpperCase() + "%') ORDER BY id " + page.getSort() + " LIMIT " + page.getSize() + " OFFSET " + page.getPage();
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Company>>() {
            @Override
            public List<Company> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Company> companyList = new ArrayList<>();
                int i = (page.getPage() / page.getSize()) * page.getSize() + 1;
                while (rs.next()) {
                    Company company = new Company();
                    company.setSerialNumber(i++);
                    company.setId(rs.getInt("id"));
                    company.setName(rs.getString("name"));
                    company.setAddress(rs.getString("address"));
                    company.setStatus(rs.getString("status"));                  
                    companyList.add(company);
                }
                return companyList;
            }
        });
    }

    @Override
    public List<Company> findByList() {
        String sql = "SELECT id, name FROM company_master where status='1'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Company>>() {
            @Override
            public List<Company> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Company> companyList = new ArrayList<>();
                while (rs.next()) {
                    Company company = new Company();
                    company.setId(rs.getInt("id"));
                    company.setName(rs.getString("name"));
                    companyList.add(company);
                }
                return companyList;
            }
        });
    }

    

    public boolean saveOrUpdate(int id) {
        String sql = "SELECT cust_id FROM company_master where cust_id ='" + id + "'";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        return count > 0;
    }

}
	
