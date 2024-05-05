package com.fefsi.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fefsi.handler.Response;
import com.fefsi.models.CommonRequest;
import com.fefsi.models.CustomDTO;
import com.fefsi.models.Agent;
import com.fefsi.models.PageRequest;
import com.fefsi.service.AgentService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/agent")
@Slf4j
public class AgentController {

    @Autowired
    AgentService agentService;

    @Autowired(required = true)
    PageRequest pageRequest;

    @PostMapping("/saveOrUpdate")
    public ResponseEntity<Response> saveOrUpdate(@Valid @RequestBody Agent agent) {
        log.info("Inside saveOrUpdate");
        int status = agentService.saveOrUpdate(agent);
        log.info("Outside saveOrUpdate", status);
        return ResponseEntity.ok(new Response(HttpStatus.CREATED.value(), agent, String.valueOf(status)));
    }

    @GetMapping("/findAll")
    public CustomDTO<Agent> findAll(@RequestParam("start") int start, @RequestParam("length") int length, @RequestParam("order[0][dir]") String order, @RequestParam("draw") int draw, @RequestParam("order[0][column]") int sortColIndex, @RequestParam("columns[0][data]") String colDataAttrName, @RequestParam("search[value]") String search) {
        log.info("Inside findAll");
        log.info("Param start:" + start + " length :" + length + " draw:" + draw + " sortColIndex:" + sortColIndex + " order:" + order + " colDataAttrName:" + colDataAttrName);
        pageRequest.setPage(start);
        pageRequest.setSize(length);
        pageRequest.setSort(order);
        pageRequest.setDraw(draw);
        pageRequest.setSortColIndex(sortColIndex);
        pageRequest.setColName(colDataAttrName);
        pageRequest.setSearch(search);
        CustomDTO<Agent> customDTO = agentService.findAll(pageRequest);
        log.info("Outside findAll");
        return customDTO;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Response> findById(@PathVariable int id) {
        log.info("Inside findById");
        Agent Agent = agentService.findById(id);
        log.info("Outside findById");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), Agent, ""));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Response> deleteById(@PathVariable int id) {
        log.info("Inside deleteById");
        int status = agentService.deleteById(id);
        log.info("Outside deleteById");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), "", String.valueOf(status)));
    }

    @GetMapping("/getCustomerList")
    public ResponseEntity<?> agentList() {
        log.info("Inside agentList");
        List<Agent> agentList = agentService.findByList();
        log.info("Outside agentList");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), agentList, ""));
    }
    
    @PostMapping("/getSurNameList")
    public ResponseEntity<?> surNameList(@RequestBody CommonRequest commonRequest) {
        log.info("Inside getSurNameList");
        List<Agent> agentList = agentService.findBySurNameList(commonRequest);
        log.info("Outside getSurNameList");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), agentList, ""));
    }

    @GetMapping("/getCustomerId")
    public ResponseEntity<?> getId() {
        log.info("Inside getId");
        String id = agentService.getId();
        log.info("Outside getId");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), id, ""));
    }

}
