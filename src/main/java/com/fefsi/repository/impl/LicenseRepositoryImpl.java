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

import com.fefsi.models.License;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.LicenseRepository;
import com.fefsi.util.ProductUtil;

@Repository
public class LicenseRepositoryImpl implements LicenseRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int saveOrUpdateLicense(License license) throws DataAccessException {
        if (license.getLicenseId() != null) {
            return jdbcTemplate.update("UPDATE pawn.license_master SET license_no =?, license_name =?, license_type =?, balance =?, address =?, start_with =?, status = ?, mod_by=?, mod_date = NOW() WHERE license_id=?", new Object[] { license.getLicenseNo(), license.getLicenseName(), license.getLicenseType(), license.getBalance(), license.getAddress(), license.getStartWith(), license.getStatus(), ProductUtil.getInstance().getUserId(), license.getLicenseId() });
        } else {
            return jdbcTemplate.update("INSERT INTO license_master ( license_no, license_name, license_type, balance, address, start_with, status, ent_by, ent_date ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, NOW());", new Object[] { license.getLicenseNo(), license.getLicenseName(), license.getLicenseType(), license.getBalance(), license.getAddress(), license.getStartWith(), license.getStatus(), ProductUtil.getInstance().getUserId() });
        }
    }

    @Override
    public int deleteLicense(int licenseId) {
        return jdbcTemplate.update("DELETE FROM license_master WHERE id=?", new Object[] { licenseId });
    }

    @Override
    public License findLicenseById(int id) {
        String sql = "SELECT license_id,license_no,license_name,license_type,balance,address,start_with,status,ent_by,ent_date FROM license_master WHERE license_id='" + id + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<License>() {
            @Override
            public License extractData(ResultSet rs) throws SQLException, DataAccessException {
                License license = new License();
                int i = 1;
                while (rs.next()) {
                    license.setSerialNumber(i++);
                    license.setLicenseId(rs.getLong("license_id"));
                    license.setLicenseNo(rs.getInt("license_no"));
                    license.setLicenseName(rs.getString("license_name"));
                    license.setLicenseType(rs.getString("license_type"));
                    license.setBalance(rs.getDouble("balance"));
                    license.setAddress(rs.getString("address"));
                    license.setStartWith(rs.getString("start_with"));
                    license.setStatus(rs.getInt("status"));
                }
                return license;
            }
        });
    }

    @Override
    public int count() {
        return jdbcTemplate.queryForObject("SELECT count(*) FROM license_master", Integer.class);
    }

    @Override
    public List<License> findAll(PageRequest page) {
        String sql = "SELECT * FROM license_master where (UPPER(license_type) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(status) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(license_no) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(license_name) like '%" + page.getSearch().toUpperCase() + "%') ORDER BY license_id " + page.getSort() + " LIMIT " + page.getSize() + " OFFSET " + page.getPage();
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<License>>() {
            @Override
            public List<License> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<License> licenseList = new ArrayList<>();
                int i = (page.getPage() / page.getSize()) * page.getSize() + 1;
                while (rs.next()) {
                    License license = new License();
                    license.setSerialNumber(i++);
                    license.setLicenseId(rs.getLong("license_id"));
                    license.setLicenseNo(rs.getInt("license_no"));
                    license.setLicenseName(rs.getString("license_name"));
                    license.setLicenseType(rs.getString("license_type"));
                    license.setBalance(rs.getDouble("balance"));
                    license.setAddress(rs.getString("address"));
                    license.setStartWith(rs.getString("start_with"));
                    license.setStatus(rs.getInt("status"));
                    licenseList.add(license);
                }
                return licenseList;
            }
        });
    }

    @Override
    public List<License> findByList() {
        String sql = "SELECT license_name,license_id,license_no FROM license_master where status='1'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<License>>() {
            @Override
            public List<License> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<License> licenseList = new ArrayList<>();
                while (rs.next()) {
                    License license = new License();
                    license.setLicenseId(rs.getLong("license_id"));
                    license.setLicenseNo(rs.getInt("license_no"));
                    license.setLicenseName(rs.getString("license_name"));
                    licenseList.add(license);
                }
                return licenseList;
            }
        });
    }

}
