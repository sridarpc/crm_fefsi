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

import com.fefsi.models.Agent;
import com.fefsi.models.CommonRequest;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.AgentRepository;
import com.fefsi.util.ProductUtil;

@Repository
public class AgentRepositoryImpl implements AgentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int saveOrUpdateAgent(Agent agent) throws DataAccessException {
        if (saveOrUpdate(agent.getAgentId())) {
            return jdbcTemplate.update("UPDATE agent_master SET cust_name =?, surdetails =?, surname =?, cust_type =?, party =?, religion =?, community =?, door_no =?, street_name =?, area =?, taluk =?, postal =?, district =?, state =?, pin_code =?, mobile_no =?, email_id =?, website =?, std_code =?, landline_no =?, birthday =?, anniversary =?, proof_name =?, proof_details =?, proof_attached =?, relation =?, relationship_cust_id =?, photo1 =?, photo2 =?, photo3 =?, right_thumb =?, right_index_finger =?, right_middle_finger =?, right_ring_finger =?, right_little_finger =?, left_thumb =?, left_index_finger =?, left_middle_finger =?, left_ring_finger =?, left_little_finger =?, feedback =?, status =?, mod_by =?, mod_date = NOW() WHERE cust_id =?", new Object[] { agent.getAgentName(), agent.getSurDetails(), agent.getSurName(), agent.getAgentType(), agent.getParty(), agent.getReligion(), agent.getCommunity(), agent.getDoorNo(), agent.getStreetName(), agent.getArea(), agent.getTaluk(), agent.getPostal(), agent.getDistrict(), agent.getState(), agent.getPincode(), agent.getMobileNo(), agent.getEmailId(), agent.getWebsite(), agent.getStdcode(), agent.getLandlineNo(), agent.getBirthday(), agent.getAnniversary(), agent.getProofName(), agent.getProofDetails(), agent.getProofAttached(), agent.getRelation(), agent.getRelationshipAgentId(), agent.getPhoto1(), agent.getPhoto2(), agent.getPhoto3(), agent.getRightThumb(), agent.getRightIndexFinger(), agent.getRightMiddleFinger(), agent.getRightRingFinger(), agent.getRightLittleFinger(), agent.getLeftThumb(), agent.getLeftIndexFinger(), agent.getLeftMiddleFinger(), agent.getLeftRingFinger(), agent.getLeftLittleFinger(), agent.getFeedback(), agent.getStatus(), ProductUtil.getInstance().getUserId(), agent.getAgentId() });
        } else {
            return jdbcTemplate.update("INSERT INTO agent_master ( agent_name, contact_no, age, dateofbirth, blood_group, address, member_type, agent_image, status, ent_by, ent_date ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW() );", new Object[] {  agent.getAgentName(), agent.getContactNo(), agent.getAge(), agent.getDateofBirth(), agent.getBloodGroup(), agent.Address(), agent.getMemberType(), agent.getAgentImage(), agent.getStatus(), ProductUtil.getInstance().getUserId() });
        }
    }

    @Override
    public int deleteAgent(int agentId) {
        return jdbcTemplate.update("DELETE FROM agent_master WHERE cust_id=?", new Object[] { agentId });
    }

    @Override
    public Agent findAgentById(int id) {
        String sql = "SELECT cust_id, cust_name, surdetails, surname, cust_type, party, religion, community, door_no, street_name, area, taluk, postal, district, state, pin_code, mobile_no, email_id, website, std_code, landline_no, birthday, anniversary, proof_name, proof_details, proof_attached, relation, relationship_cust_id, photo1, photo2, photo3, right_thumb, right_index_finger, right_middle_finger, right_ring_finger, right_little_finger, left_thumb, left_index_finger, left_middle_finger, left_ring_finger, left_little_finger, feedback, status, ent_by, ent_date, mod_by, mod_date FROM agent_master WHERE cust_id='" + id + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Agent>() {
            @Override
            public Agent extractData(ResultSet rs) throws SQLException, DataAccessException {
                Agent agent = new Agent();
                int i = 1;
                while (rs.next()) {
                    agent.setSerialNumber(i++);
                    agent.setAgentId(rs.getLong("cust_id"));
                    agent.setAgentName(rs.getString("cust_name"));
                    agent.setSurDetails(rs.getString("surdetails"));
                    agent.setSurName(rs.getString("surname"));
                    agent.setAgentType(rs.getString("cust_type"));
                    agent.setParty(rs.getString("party"));
                    agent.setReligion(rs.getString("religion"));
                    agent.setCommunity(rs.getString("community"));
                    agent.setDoorNo(rs.getString("door_no"));
                    agent.setStreetName(rs.getString("street_name"));
                    agent.setArea(rs.getString("area"));
                    agent.setTaluk(rs.getString("taluk"));
                    agent.setPostal(rs.getString("postal"));
                    agent.setDistrict(rs.getString("district"));
                    agent.setState(rs.getString("state"));
                    agent.setPincode(rs.getString("pin_code"));
                    agent.setMobileNo(rs.getString("mobile_no"));
                    agent.setEmailId(rs.getString("email_id"));
                    agent.setWebsite(rs.getString("website"));
                    agent.setStdcode(rs.getString("std_code"));
                    agent.setLandlineNo(rs.getString("landline_no"));
                    agent.setBirthday(rs.getString("birthday"));
                    agent.setAnniversary(rs.getString("anniversary"));
                    agent.setProofName(rs.getString("proof_name"));
                    agent.setProofDetails(rs.getString("proof_details"));
                    agent.setProofAttached(rs.getString("proof_attached"));
                    agent.setRelation(rs.getString("relation"));
                    agent.setRelationshipAgentId(rs.getString("relationship_cust_id"));
                    agent.setPhoto1(rs.getString("photo1"));
                    agent.setPhoto2(rs.getString("photo2"));
                    agent.setPhoto3(rs.getString("photo3"));
                    agent.setRightThumb(rs.getString("right_thumb"));
                    agent.setRightIndexFinger(rs.getString("right_index_finger"));
                    agent.setRightMiddleFinger(rs.getString("right_middle_finger"));
                    agent.setRightRingFinger(rs.getString("right_ring_finger"));
                    agent.setRightLittleFinger(rs.getString("right_little_finger"));
                    agent.setLeftThumb(rs.getString("left_thumb"));
                    agent.setLeftIndexFinger(rs.getString("left_index_finger"));
                    agent.setLeftMiddleFinger(rs.getString("left_middle_finger"));
                    agent.setLeftRingFinger(rs.getString("left_ring_finger"));
                    agent.setLeftLittleFinger(rs.getString("left_little_finger"));
                    agent.setFeedback(rs.getString("feedback"));
                    agent.setStatus(rs.getInt("status"));
                }
                return agent;
            }
        });
    }

    @Override
    public int count() {
        return jdbcTemplate.queryForObject("SELECT count(*) FROM agent_master", Integer.class);
    }

    @Override
    public List<Agent> findAll(PageRequest page) {
        String sql = "SELECT * FROM agent_master where (UPPER(cust_id) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(status) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(cust_name) like '%" + page.getSearch().toUpperCase() + "%' or UPPER(cust_type) like '%" + page.getSearch().toUpperCase() + "%') ORDER BY cust_id " + page.getSort() + " LIMIT " + page.getSize() + " OFFSET " + page.getPage();
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Agent>>() {
            @Override
            public List<Agent> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Agent> agentList = new ArrayList<>();
                int i = (page.getPage() / page.getSize()) * page.getSize() + 1;
                while (rs.next()) {
                    Agent agent = new Agent();
                    agent.setSerialNumber(i++);
                    agent.setAgentId(rs.getLong("cust_id"));
                    agent.setAgentName(rs.getString("cust_name"));
                    agent.setSurDetails(rs.getString("surdetails"));
                    agent.setSurName(rs.getString("surname"));
                    agent.setAgentType(rs.getString("cust_type"));
                    agent.setParty(rs.getString("party"));
                    agent.setReligion(rs.getString("religion"));
                    agent.setCommunity(rs.getString("community"));
                    agent.setDoorNo(rs.getString("door_no"));
                    agent.setStreetName(rs.getString("street_name"));
                    agent.setArea(rs.getString("area"));
                    agent.setTaluk(rs.getString("taluk"));
                    agent.setPostal(rs.getString("postal"));
                    agent.setDistrict(rs.getString("district"));
                    agent.setState(rs.getString("state"));
                    agent.setPincode(rs.getString("pin_code"));
                    agent.setMobileNo(rs.getString("mobile_no"));
                    agent.setEmailId(rs.getString("email_id"));
                    agent.setWebsite(rs.getString("website"));
                    agent.setStdcode(rs.getString("std_code"));
                    agent.setLandlineNo(rs.getString("landline_no"));
                    agent.setBirthday(rs.getString("birthday"));
                    agent.setAnniversary(rs.getString("anniversary"));
                    agent.setProofName(rs.getString("proof_name"));
                    agent.setProofDetails(rs.getString("proof_details"));
                    agent.setProofAttached(rs.getString("proof_attached"));
                    agent.setRelation(rs.getString("relation"));
                    agent.setRelationshipAgentId(rs.getString("relationship_cust_id"));
                    agent.setPhoto1(rs.getString("photo1"));
                    agent.setPhoto2(rs.getString("photo2"));
                    agent.setPhoto3(rs.getString("photo3"));
                    agent.setRightThumb(rs.getString("right_thumb"));
                    agent.setRightIndexFinger(rs.getString("right_index_finger"));
                    agent.setRightMiddleFinger(rs.getString("right_middle_finger"));
                    agent.setRightRingFinger(rs.getString("right_ring_finger"));
                    agent.setRightLittleFinger(rs.getString("right_little_finger"));
                    agent.setLeftThumb(rs.getString("left_thumb"));
                    agent.setLeftIndexFinger(rs.getString("left_index_finger"));
                    agent.setLeftMiddleFinger(rs.getString("left_middle_finger"));
                    agent.setLeftRingFinger(rs.getString("left_ring_finger"));
                    agent.setLeftLittleFinger(rs.getString("left_little_finger"));
                    agent.setFeedback(rs.getString("feedback"));
                    agent.setStatus(rs.getInt("status"));
                    agentList.add(agent);
                }
                return agentList;
            }
        });
    }

    @Override
    public List<Agent> findByList() {
        String sql = "SELECT cust_id,cust_name FROM agent_master where status='1'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Agent>>() {
            @Override
            public List<Agent> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Agent> agentList = new ArrayList<>();
                while (rs.next()) {
                    Agent agent = new Agent();
                    agent.setAgentId(rs.getLong("cust_id"));
                    agent.setAgentName(rs.getString("cust_name"));
                    agentList.add(agent);
                }
                return agentList;
            }
        });
    }

    @Override
    public String getId() {
        String sql = "SELECT cust_id FROM agent_master ORDER BY cust_id DESC LIMIT 1;";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        return String.valueOf(count + 1);
    }

    public boolean saveOrUpdate(Long id) {
        String sql = "SELECT cust_id FROM agent_master where cust_id ='" + id + "'";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        return count > 0;
    }

    @Override
    public List<Agent> findBySurNameList(CommonRequest commonRequest) {
        String sql = "SELECT cust_id,surdetails,surname FROM agent_master where cust_name like '%" + commonRequest.getName() + "%' and status='1'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Agent>>() {
            @Override
            public List<Agent> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Agent> agentList = new ArrayList<>();
                while (rs.next()) {
                    Agent agent = new Agent();
                    agent.setSurDetails(rs.getString("surdetails") + " of " + rs.getString("surname"));
                    agent.setSurName(rs.getString("surname"));
                    agent.setAgentId(rs.getLong("cust_id"));
                    agentList.add(agent);
                }
                return agentList;
            }
        });
    }

	

}
