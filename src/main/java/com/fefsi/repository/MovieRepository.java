package com.fefsi.repository;

import java.util.List;

import com.fefsi.models.Agent;
import com.fefsi.models.PageRequest;

public interface MovieRepository {

    int saveOrUpdateAgent(Agent agent);

    int deleteAgent(int id);

    Agent findAgentById(int id);

    List<Agent> findAll(PageRequest pageable);

    int count();

    List<Agent> findByList();


}
