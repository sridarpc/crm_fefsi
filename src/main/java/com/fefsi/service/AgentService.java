package com.fefsi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.fefsi.exception.ProductBusinessException;
import com.fefsi.models.CommonRequest;
import com.fefsi.models.CustomDTO;
import com.fefsi.models.Agent;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.AgentRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AgentService {

    @Autowired
    private AgentRepository agentRepository;

    public int saveOrUpdate(Agent agent) {
        int status = 0;
        try {
            log.info("Inside save");
            status = agentRepository.saveOrUpdateAgent(agent);
        } catch (DataIntegrityViolationException e) {
            throw new ProductBusinessException("Agent code already exist " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ProductBusinessException("Exception occurred while save Or Update the Agent");
        }
        return status;
    }

    public Agent findById(int id) {
        Agent customer = agentRepository.findAgentById(id);
        return customer;
    }

    public int deleteById(int id) {
        return agentRepository.deleteAgent(id);
    }

    public CustomDTO<Agent> findAll(PageRequest pageable) {
        try {
            List<Agent> Agent = agentRepository.findAll(pageable);
            CustomDTO<Agent> customDTO = new CustomDTO<>();
            customDTO.setData(Agent);
            customDTO.setRecordsFiltered(agentRepository.count());
            customDTO.setRecordsTotal(Agent.size());
            customDTO.setDraw(pageable.getDraw());
            return customDTO;
        } catch (Exception e) {
            throw new ProductBusinessException("FindAll Getting Exception" + e.getMessage());
        }
    }

    public List<Agent> findByList() {
        try {
            return agentRepository.findByList();
        } catch (Exception e) {
            throw new ProductBusinessException("findByList Getting Exception" + e.getMessage());
        }
    }

    public String getId() {
        try {
            return agentRepository.getId();
        } catch (Exception e) {
            throw new ProductBusinessException("getId Getting Exception" + e.getMessage());
        }
    }

    public List<Agent> findBySurNameList(CommonRequest commonRequest) {
        try {
            return agentRepository.findBySurNameList(commonRequest);
        } catch (Exception e) {
            throw new ProductBusinessException("getId Getting Exception" + e.getMessage());
        }
    }

}