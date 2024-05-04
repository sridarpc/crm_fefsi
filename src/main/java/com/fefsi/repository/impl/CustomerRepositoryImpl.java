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

import com.fefsi.models.CommonRequest;
import com.fefsi.models.Customer;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.CustomerRepository;
import com.fefsi.util.ProductUtil;

@Repository
public class CustomerRepositoryImpl implements CustomerRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int saveOrUpdateCustomer(Customer customer) throws DataAccessException {
        if (saveOrUpdate(customer.getCustomerId())) {
            return jdbcTemplate.update("UPDATE customer_master SET cust_name =?, surdetails =?, surname =?, cust_type =?, party =?, religion =?, community =?, door_no =?, street_name =?, area =?, taluk =?, postal =?, district =?, state =?, pin_code =?, mobile_no =?, email_id =?, website =?, std_code =?, landline_no =?, birthday =?, anniversary =?, proof_name =?, proof_details =?, proof_attached =?, relation =?, relationship_cust_id =?, photo1 =?, photo2 =?, photo3 =?, right_thumb =?, right_index_finger =?, right_middle_finger =?, right_ring_finger =?, right_little_finger =?, left_thumb =?, left_index_finger =?, left_middle_finger =?, left_ring_finger =?, left_little_finger =?, feedback =?, status =?, mod_by =?, mod_date = NOW() WHERE cust_id =?", new Object[] { customer.getCustomerName(), customer.getSurDetails(), customer.getSurName(), customer.getCustomerType(), customer.getParty(), customer.getReligion(), customer.getCommunity(), customer.getDoorNo(), customer.getStreetName(), customer.getArea(), customer.getTaluk(), customer.getPostal(), customer.getDistrict(), customer.getState(), customer.getPincode(), customer.getMobileNo(), customer.getEmailId(), customer.getWebsite(), customer.getStdcode(), customer.getLandlineNo(), customer.getBirthday(), customer.getAnniversary(), customer.getProofName(), customer.getProofDetails(), customer.getProofAttached(), customer.getRelation(), customer.getRelationshipCustomerId(), customer.getPhoto1(), customer.getPhoto2(), customer.getPhoto3(), customer.getRightThumb(), customer.getRightIndexFinger(), customer.getRightMiddleFinger(), customer.getRightRingFinger(), customer.getRightLittleFinger(), customer.getLeftThumb(), customer.getLeftIndexFinger(), customer.getLeftMiddleFinger(), customer.getLeftRingFinger(), customer.getLeftLittleFinger(), customer.getFeedback(), customer.getStatus(), ProductUtil.getInstance().getUserId(), customer.getCustomerId() });
        } else {
            return jdbcTemplate.update("INSERT INTO customer_master ( cust_id, cust_name, surdetails, surname, cust_type, party, religion, community, door_no, street_name, area, taluk, postal, district, state, pin_code, mobile_no, email_id, website, std_code, landline_no, birthday, anniversary, proof_name, proof_details, proof_attached, relation, relationship_cust_id, photo1, photo2, photo3, right_thumb, right_index_finger, right_middle_finger, right_ring_finger, right_little_finger, left_thumb, left_index_finger, left_middle_finger, left_ring_finger, left_little_finger, feedback, status, ent_by, ent_date ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW());", new Object[] { customer.getCustomerId(), customer.getCustomerName(), customer.getSurDetails(), customer.getSurName(), customer.getCustomerType(), customer.getParty(), customer.getReligion(), customer.getCommunity(), customer.getDoorNo(), customer.getStreetName(), customer.getArea(), customer.getTaluk(), customer.getPostal(), customer.getDistrict(), customer.getState(), customer.getPincode(), customer.getMobileNo(), customer.getEmailId(), customer.getWebsite(), customer.getStdcode(), customer.getLandlineNo(), customer.getBirthday(), customer.getAnniversary(), customer.getProofName(), customer.getProofDetails(), customer.getProofAttached(), customer.getRelation(), customer.getRelationshipCustomerId(), customer.getPhoto1(), customer.getPhoto2(), customer.getPhoto3(), customer.getRightThumb(), customer.getRightIndexFinger(), customer.getRightMiddleFinger(), customer.getRightRingFinger(), customer.getRightLittleFinger(), customer.getLeftThumb(), customer.getLeftIndexFinger(), customer.getLeftMiddleFinger(), customer.getLeftRingFinger(), customer.getLeftLittleFinger(), customer.getFeedback(), customer.getStatus(), ProductUtil.getInstance().getUserId() });
        }
    }

    @Override
    public int deleteCustomer(int customerId) {
        return jdbcTemplate.update("DELETE FROM customer_master WHERE cust_id=?", new Object[] { customerId });
    }

    @Override
    public Customer findCustomerById(int id) {
        String sql = "SELECT cust_id, cust_name, surdetails, surname, cust_type, party, religion, community, door_no, street_name, area, taluk, postal, district, state, pin_code, mobile_no, email_id, website, std_code, landline_no, birthday, anniversary, proof_name, proof_details, proof_attached, relation, relationship_cust_id, photo1, photo2, photo3, right_thumb, right_index_finger, right_middle_finger, right_ring_finger, right_little_finger, left_thumb, left_index_finger, left_middle_finger, left_ring_finger, left_little_finger, feedback, status, ent_by, ent_date, mod_by, mod_date FROM customer_master WHERE cust_id='" + id + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Customer>() {
            @Override
            public Customer extractData(ResultSet rs) throws SQLException, DataAccessException {
                Customer customer = new Customer();
                int i = 1;
                while (rs.next()) {
                    customer.setSerialNumber(i++);
                    customer.setCustomerId(rs.getLong("cust_id"));
                    customer.setCustomerName(rs.getString("cust_name"));
                    customer.setSurDetails(rs.getString("surdetails"));
                    customer.setSurName(rs.getString("surname"));
                    customer.setCustomerType(rs.getString("cust_type"));
                    customer.setParty(rs.getString("party"));
                    customer.setReligion(rs.getString("religion"));
                    customer.setCommunity(rs.getString("community"));
                    customer.setDoorNo(rs.getString("door_no"));
                    customer.setStreetName(rs.getString("street_name"));
                    customer.setArea(rs.getString("area"));
                    customer.setTaluk(rs.getString("taluk"));
                    customer.setPostal(rs.getString("postal"));
                    customer.setDistrict(rs.getString("district"));
                    customer.setState(rs.getString("state"));
                    customer.setPincode(rs.getString("pin_code"));
                    customer.setMobileNo(rs.getString("mobile_no"));
                    customer.setEmailId(rs.getString("email_id"));
                    customer.setWebsite(rs.getString("website"));
                    customer.setStdcode(rs.getString("std_code"));
                    customer.setLandlineNo(rs.getString("landline_no"));
                    customer.setBirthday(rs.getString("birthday"));
                    customer.setAnniversary(rs.getString("anniversary"));
                    customer.setProofName(rs.getString("proof_name"));
                    customer.setProofDetails(rs.getString("proof_details"));
                    customer.setProofAttached(rs.getString("proof_attached"));
                    customer.setRelation(rs.getString("relation"));
                    customer.setRelationshipCustomerId(rs.getString("relationship_cust_id"));
                    customer.setPhoto1(rs.getString("photo1"));
                    customer.setPhoto2(rs.getString("photo2"));
                    customer.setPhoto3(rs.getString("photo3"));
                    customer.setRightThumb(rs.getString("right_thumb"));
                    customer.setRightIndexFinger(rs.getString("right_index_finger"));
                    customer.setRightMiddleFinger(rs.getString("right_middle_finger"));
                    customer.setRightRingFinger(rs.getString("right_ring_finger"));
                    customer.setRightLittleFinger(rs.getString("right_little_finger"));
                    customer.setLeftThumb(rs.getString("left_thumb"));
                    customer.setLeftIndexFinger(rs.getString("left_index_finger"));
                    customer.setLeftMiddleFinger(rs.getString("left_middle_finger"));
                    customer.setLeftRingFinger(rs.getString("left_ring_finger"));
                    customer.setLeftLittleFinger(rs.getString("left_little_finger"));
                    customer.setFeedback(rs.getString("feedback"));
                    customer.setStatus(rs.getInt("status"));
                }
                return customer;
            }
        });
    }

    @Override
    public int count() {
        return jdbcTemplate.queryForObject("SELECT count(*) FROM customer_master", Integer.class);
    }

    @Override
    public List<Customer> findAll(PageRequest page) {
        String sql = "SELECT * FROM customer_master where (UPPER(cust_id) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(status) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(cust_name) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(cust_type) like '%" + page.getSearch().toUpperCase() + "%') ORDER BY cust_id " + page.getSort() + " LIMIT " + page.getSize() + " OFFSET " + page.getPage();
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Customer>>() {
            @Override
            public List<Customer> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Customer> customerList = new ArrayList<>();
                int i = (page.getPage() / page.getSize()) * page.getSize() + 1;
                while (rs.next()) {
                    Customer customer = new Customer();
                    customer.setSerialNumber(i++);
                    customer.setCustomerId(rs.getLong("cust_id"));
                    customer.setCustomerName(rs.getString("cust_name"));
                    customer.setSurDetails(rs.getString("surdetails"));
                    customer.setSurName(rs.getString("surname"));
                    customer.setCustomerType(rs.getString("cust_type"));
                    customer.setParty(rs.getString("party"));
                    customer.setReligion(rs.getString("religion"));
                    customer.setCommunity(rs.getString("community"));
                    customer.setDoorNo(rs.getString("door_no"));
                    customer.setStreetName(rs.getString("street_name"));
                    customer.setArea(rs.getString("area"));
                    customer.setTaluk(rs.getString("taluk"));
                    customer.setPostal(rs.getString("postal"));
                    customer.setDistrict(rs.getString("district"));
                    customer.setState(rs.getString("state"));
                    customer.setPincode(rs.getString("pin_code"));
                    customer.setMobileNo(rs.getString("mobile_no"));
                    customer.setEmailId(rs.getString("email_id"));
                    customer.setWebsite(rs.getString("website"));
                    customer.setStdcode(rs.getString("std_code"));
                    customer.setLandlineNo(rs.getString("landline_no"));
                    customer.setBirthday(rs.getString("birthday"));
                    customer.setAnniversary(rs.getString("anniversary"));
                    customer.setProofName(rs.getString("proof_name"));
                    customer.setProofDetails(rs.getString("proof_details"));
                    customer.setProofAttached(rs.getString("proof_attached"));
                    customer.setRelation(rs.getString("relation"));
                    customer.setRelationshipCustomerId(rs.getString("relationship_cust_id"));
                    customer.setPhoto1(rs.getString("photo1"));
                    customer.setPhoto2(rs.getString("photo2"));
                    customer.setPhoto3(rs.getString("photo3"));
                    customer.setRightThumb(rs.getString("right_thumb"));
                    customer.setRightIndexFinger(rs.getString("right_index_finger"));
                    customer.setRightMiddleFinger(rs.getString("right_middle_finger"));
                    customer.setRightRingFinger(rs.getString("right_ring_finger"));
                    customer.setRightLittleFinger(rs.getString("right_little_finger"));
                    customer.setLeftThumb(rs.getString("left_thumb"));
                    customer.setLeftIndexFinger(rs.getString("left_index_finger"));
                    customer.setLeftMiddleFinger(rs.getString("left_middle_finger"));
                    customer.setLeftRingFinger(rs.getString("left_ring_finger"));
                    customer.setLeftLittleFinger(rs.getString("left_little_finger"));
                    customer.setFeedback(rs.getString("feedback"));
                    customer.setStatus(rs.getInt("status"));
                    customerList.add(customer);
                }
                return customerList;
            }
        });
    }

    @Override
    public List<Customer> findByList() {
        String sql = "SELECT cust_id,cust_name FROM customer_master where status='1'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Customer>>() {
            @Override
            public List<Customer> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Customer> customerList = new ArrayList<>();
                while (rs.next()) {
                    Customer customer = new Customer();
                    customer.setCustomerId(rs.getLong("cust_id"));
                    customer.setCustomerName(rs.getString("cust_name"));
                    customerList.add(customer);
                }
                return customerList;
            }
        });
    }

    @Override
    public String getId() {
        String sql = "SELECT cust_id FROM customer_master ORDER BY cust_id DESC LIMIT 1;";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        return String.valueOf(count + 1);
    }

    public boolean saveOrUpdate(Long id) {
        String sql = "SELECT cust_id FROM customer_master where cust_id ='" + id + "'";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        return count > 0;
    }

    @Override
    public List<Customer> findBySurNameList(CommonRequest commonRequest) {
        String sql = "SELECT cust_id,surdetails,surname FROM customer_master where cust_name like '%" + commonRequest.getName() + "%' and status='1'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Customer>>() {
            @Override
            public List<Customer> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Customer> customerList = new ArrayList<>();
                while (rs.next()) {
                    Customer customer = new Customer();
                    customer.setSurDetails(rs.getString("surdetails") + " of " + rs.getString("surname"));
                    customer.setSurName(rs.getString("surname"));
                    customer.setCustomerId(rs.getLong("cust_id"));
                    customerList.add(customer);
                }
                return customerList;
            }
        });
    }

}
