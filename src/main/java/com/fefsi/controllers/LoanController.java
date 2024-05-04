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
import com.fefsi.models.CustomDTO;
import com.fefsi.models.Loan;
import com.fefsi.models.LoanItem;
import com.fefsi.models.PageRequest;
import com.fefsi.service.LoanService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/loan")
@Slf4j
public class LoanController {

    @Autowired
    LoanService loanService;

    @Autowired(required = true)
    PageRequest pageRequest;

    @PostMapping("/saveOrUpdate")
    public ResponseEntity<Response> saveOrUpdate(@Valid @RequestBody Loan loan) {
        log.info("Inside saveOrUpdate");
        int status = loanService.saveOrUpdate(loan);
        log.info("Outside saveOrUpdate", status);
        return ResponseEntity.ok(new Response(HttpStatus.CREATED.value(), loan, String.valueOf(status)));
    }

    @GetMapping("/findAll")
    public CustomDTO<Loan> findAll(@RequestParam("start") int start, @RequestParam("length") int length, @RequestParam("order[0][dir]") String order, @RequestParam("draw") int draw, @RequestParam("order[0][column]") int sortColIndex, @RequestParam("columns[0][data]") String colDataAttrName, @RequestParam("search[value]") String search) {
        log.info("Inside findAll");
        log.info("Param start:" + start + " length :" + length + " draw:" + draw + " sortColIndex:" + sortColIndex + " order:" + order + " colDataAttrName:" + colDataAttrName);
        pageRequest.setPage(start);
        pageRequest.setSize(length);
        pageRequest.setSort(order);
        pageRequest.setDraw(draw);
        pageRequest.setSortColIndex(sortColIndex);
        pageRequest.setColName(colDataAttrName);
        pageRequest.setSearch(search);
        CustomDTO<Loan> customDTO = loanService.findAll(pageRequest);
        log.info("Outside findAll");
        return customDTO;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Response> findById(@PathVariable int id) {
        log.info("Inside findById");
        Loan loan = loanService.findById(id);
        log.info("Outside findById");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), loan, ""));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Response> deleteById(@PathVariable int id) {
        log.info("Inside deleteById");
        int status = loanService.deleteById(id);
        log.info("Outside deleteById");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), "", String.valueOf(status)));
    }

    @GetMapping("/loanList")
    public ResponseEntity<?> loanList() {
        log.info("Inside loanList");
        List<Loan> loanList = loanService.findByList();
        log.info("Outside loanList");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), loanList, ""));
    }

    @GetMapping("/getLoanId")
    public ResponseEntity<?> getId() {
        log.info("Inside getId");
        String id = loanService.getId();
        log.info("Outside getId");
        return ResponseEntity.ok(new Response(HttpStatus.OK.value(), id, ""));
    }

    @PostMapping("/saveOrUpdateItem")
    public ResponseEntity<Response> saveOrUpdateItem(@Valid @RequestBody LoanItem loanItem) {
        log.info("Inside saveOrUpdate");
        int status = loanService.saveOrUpdateItem(loanItem);
        log.info("Outside saveOrUpdate", status);
        return ResponseEntity.ok(new Response(HttpStatus.CREATED.value(), loanItem, String.valueOf(status)));
    }

    @GetMapping("/item/findAll")
    public CustomDTO<LoanItem> findAllItem(@RequestParam("start") int start, @RequestParam("length") int length, @RequestParam("order[0][dir]") String order, @RequestParam("draw") int draw, @RequestParam("order[0][column]") int sortColIndex, @RequestParam("columns[0][data]") String colDataAttrName, @RequestParam("search[value]") String search) {
        log.info("Inside findAll");
        log.info("Param start:" + start + " length :" + length + " draw:" + draw + " sortColIndex:" + sortColIndex + " order:" + order + " colDataAttrName:" + colDataAttrName);
        pageRequest.setPage(start);
        pageRequest.setSize(length);
        pageRequest.setSort(order);
        pageRequest.setDraw(draw);
        pageRequest.setSortColIndex(sortColIndex);
        pageRequest.setColName(colDataAttrName);
        pageRequest.setSearch(search);
        CustomDTO<LoanItem> customDTO = loanService.findAllItem(pageRequest);
        log.info("Outside findAll");
        return customDTO;
    }
}
