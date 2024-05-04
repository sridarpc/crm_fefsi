package com.fefsi.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.fefsi.exception.ProductBusinessException;
import com.fefsi.models.CustomDTO;
import com.fefsi.models.Loan;
import com.fefsi.models.LoanItem;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.LoanRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LoanService {

    @Autowired
    private LoanRepository loanRepository;

    public int saveOrUpdate(Loan loan) {
        int status = 0;
        try {
            log.info("Inside save");
            status = loanRepository.saveOrUpdateLoan(loan);
        } catch (DataIntegrityViolationException e) {
            throw new ProductBusinessException("Loan code already exist " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ProductBusinessException("Exception occurred while save Or Update the Loan");
        }
        return status;
    }

    public Loan findById(int id) {
        Loan loan = loanRepository.findLoanById(id);
        return loan;
    }

    public int deleteById(int id) {
        return loanRepository.deleteLoan(id);
    }

    public CustomDTO<Loan> findAll(PageRequest pageable) {
        try {
            List<Loan> loan = loanRepository.findAll(pageable);
            CustomDTO<Loan> customDTO = new CustomDTO<>();
            customDTO.setData(loan);
            customDTO.setRecordsFiltered(loanRepository.count());
            customDTO.setRecordsTotal(loan.size());
            customDTO.setDraw(pageable.getDraw());
            return customDTO;
        } catch (Exception e) {
            throw new ProductBusinessException("FindAll Getting Exception" + e.getMessage());
        }
    }

    public List<Loan> findByList() {
        try {
            return loanRepository.findByList();
        } catch (Exception e) {
            throw new ProductBusinessException("findByList Getting Exception" + e.getMessage());
        }
    }

    public String getId() {
        try {
            return loanRepository.getId();
        } catch (Exception e) {
            throw new ProductBusinessException("getId Getting Exception" + e.getMessage());
        }
    }

    public int saveOrUpdateItem(@Valid LoanItem loanItem) {
        int status = 0;
        try {
            log.info("Inside loanItem save");
            status = loanRepository.saveOrUpdateItem(loanItem);
        } catch (DataIntegrityViolationException e) {
            throw new ProductBusinessException("Loan code already exist " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ProductBusinessException("Exception occurred while save Or Update the Loan");
        }
        return status;
    }

    public CustomDTO<LoanItem> findAllItem(PageRequest pageable) {
        try {
            List<LoanItem> loanItem = loanRepository.findAllItem(pageable);
            CustomDTO<LoanItem> customDTO = new CustomDTO<>();
            customDTO.setData(loanItem);
            customDTO.setRecordsFiltered(loanRepository.countItem());
            customDTO.setRecordsTotal(loanItem.size());
            customDTO.setDraw(pageable.getDraw());
            return customDTO;
        } catch (Exception e) {
            throw new ProductBusinessException("FindAll Getting Exception" + e.getMessage());
        }
    }

}