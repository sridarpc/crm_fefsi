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
import com.fefsi.models.Company;
import com.fefsi.models.CustomDTO;
import com.fefsi.models.PageRequest;
import com.fefsi.service.CompanyService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/movie")
@Slf4j
public class MovieController {

    @Autowired
    CompanyService companyService;

    @Autowired(required = true)
    PageRequest pageRequest;

    @PostMapping("/saveOrUpdate")
    public ResponseEntity<Response> saveOrUpdate(@Valid @RequestBody Company company) {
        log.info("Inside saveOrUpdate");
        int status = companyService.saveOrUpdate(company);
        log.info("Outside saveOrUpdate", status);
        return ResponseEntity.ok(new Response(HttpStatus.CREATED.value(), company, String.valueOf(status)));
    }

    @GetMapping("/findAll")
    public CustomDTO<Company> findAll(@RequestParam("start") int start, @RequestParam("length") int length, @RequestParam("order[0][dir]") String order, @RequestParam("draw") int draw, @RequestParam("order[0][column]") int sortColIndex, @RequestParam("columns[0][data]") String colDataAttrName, @RequestParam("search[value]") String search) {
        log.info("Inside findAll");
        log.info("Param start:" + start + " length :" + length + " draw:" + draw + " sortColIndex:" + sortColIndex + " order:" + order + " colDataAttrName:" + colDataAttrName);
        pageRequest.setPage(start);
        pageRequest.setSize(length);
        pageRequest.setSort(order);
        pageRequest.setDraw(draw);
        pageRequest.setSortColIndex(sortColIndex);
        pageRequest.setColName(colDataAttrName);
        pageRequest.setSearch(search);
        CustomDTO<Company> customDTO = companyService.findAll(pageRequest);
        log.info("Outside findAll");
        return customDTO;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Response> findById(@PathVariable int id) {
        log.info("Inside findById");
        Company Company = companyService.findById(id);
        log.info("Outside findById");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), Company, ""));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Response> deleteById(@PathVariable int id) {
        log.info("Inside deleteById");
        int status = companyService.deleteById(id);
        log.info("Outside deleteById");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), "", String.valueOf(status)));
    }

    @GetMapping("/getCompanyList")
    public ResponseEntity<?> companyList() {
        log.info("Inside companyList");
        List<Company> companyList = companyService.findByList();
        log.info("Outside companyList");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), companyList, ""));
    }
       
}
