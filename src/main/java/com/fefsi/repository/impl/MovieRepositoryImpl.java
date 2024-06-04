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
import com.fefsi.models.PageRequest;
import com.fefsi.repository.AgentRepository;
import com.fefsi.util.ProductUtil;

@Repository
public class MovieRepositoryImpl implements AgentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int saveOrUpdateAgent(Agent agent) throws DataAccessException {
        if (saveOrUpdate(agent.getAgentId())) {
            return jdbcTemplate.update("UPDATE agent_master SET agent_name =?, contact_no =?, age =?, dateofbirth =?, blood_group =?, address =?, member_type =?, agent_image =?, status =?, mod_by =?, mod_date = NOW() WHERE agent_id =?", new Object[] { agent.getAgentName(), agent.getContactNo(), agent.getAge(), agent.getDateofBirth(), agent.getBloodGroup(), agent.getAddress(), agent.getMemberType(), agent.getAgentImage(), agent.getStatus(), agent.getModBy() });
        } else {
            return jdbcTemplate.update("INSERT INTO agent_master (agent_id, agent_name, contact_no, age, dateofbirth, blood_group, address, member_type, agent_image, status, ent_by, ent_date ) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW() );", new Object[] { agent.getAgentId(), agent.getAgentName(), agent.getContactNo(), agent.getAge(), agent.getDateofBirth(), agent.getBloodGroup(), agent.getAddress(), agent.getMemberType(), agent.getAgentImage(), agent.getStatus(), ProductUtil.getInstance().getUserId() });
        }
    }

    @Override
    public int deleteAgent(int agentId) {
        return jdbcTemplate.update("DELETE FROM agent_master WHERE agent_id=?", new Object[] { agentId });
    }

    @Override
    public Agent findAgentById(int id) {
        String sql = "SELECT agent_id, agent_name, contact_no, age, dateofbirth, blood_group, address, member_type, agent_image, status, ent_by, ent_date FROM agent_master WHERE agent_id='" + id + "'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Agent>() {
            @Override
            public Agent extractData(ResultSet rs) throws SQLException, DataAccessException {
                Agent agent = new Agent();
                int i = 1;
                while (rs.next()) {
                    agent.setSerialNumber(i++);
                    agent.setAgentId(rs.getLong("cust_id"));
                    agent.setAgentName(rs.getString("agentname"));
                    agent.setContactNo(rs.getString("contactno"));
                    agent.setAge(rs.getInt("age"));
                    agent.setDateofBirth(rs.getString("dateofbirth"));
                    agent.setBloodGroup(rs.getString("bloodgroup"));
                    agent.setAddress(rs.getString("address"));
                    agent.setMemberType(rs.getString("membertype"));
                    agent.setAgentImage(rs.getString("agentimage"));
                    agent.setStatus(rs.getString("status"));
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
                    agent.setAgentName(rs.getString("agentname"));
                    agent.setContactNo(rs.getString("contactno"));
                    agent.setAge(rs.getInt("age"));
                    agent.setDateofBirth(rs.getString("dateofbirth"));
                    agent.setBloodGroup(rs.getString("bloodgroup"));
                    agent.setAddress(rs.getString("address"));
                    agent.setMemberType(rs.getString("membertype"));
                    agent.setAgentImage(rs.getString("agentimage"));
                    agent.setStatus(rs.getString("status"));
                    agentList.add(agent);
                }
                return agentList;
            }
        });
    }

    @Override
    public List<Agent> findByList() {
        String sql = "SELECT agent_id, agent_name, contact_no, age, dateofbirth, blood_group, address, member_type, agent_image, status, ent_by, ent_date, mod_date, mod_by FROM agent_master where status='1'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<List<Agent>>() {
            @Override
            public List<Agent> extractData(ResultSet rs) throws SQLException, DataAccessException {
                List<Agent> agentList = new ArrayList<>();
                while (rs.next()) {
                    Agent agent = new Agent();
                    agent.setAgentId(rs.getLong("cust_id"));
                    agent.setAgentName(rs.getString("agentname"));
                    agent.setContactNo(rs.getString("contactno"));
                    agent.setAge(rs.getInt("age"));
                    agent.setDateofBirth(rs.getString("dateofbirth"));
                    agent.setBloodGroup(rs.getString("bloodgroup"));
                    agent.setAddress(rs.getString("address"));
                    agent.setMemberType(rs.getString("membertype"));
                    agent.setAgentImage(rs.getString("agentimage"));
                    agent.setStatus(rs.getString("status"));
                    agentList.add(agent);
                }
                return agentList;
            }
        });
    }

    public boolean saveOrUpdate(Long id) {
        String sql = "SELECT cust_id FROM agent_master where cust_id ='" + id + "'";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        return count > 0;
    }

}
