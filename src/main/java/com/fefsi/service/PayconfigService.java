package com.fefsi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.fefsi.exception.ProductBusinessException;
import com.fefsi.models.CustomDTO;
import com.fefsi.models.PageRequest;
import com.fefsi.models.Payconfig;
import com.fefsi.repository.PayconfigRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PayconfigService {

    @Autowired
    private PayconfigRepository payconfigRepository;

    public int saveOrUpdate(Payconfig payconfig) {
        int status = 0;
        try {
            log.info("Inside save");
            status = payconfigRepository.saveOrUpdatePayconfig(payconfig);
        } catch (DataIntegrityViolationException e) {
            throw new ProductBusinessException("Payconfig code already exist " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ProductBusinessException("Exception occurred while save Or Update the Payconfig");
        }
        return status;
    }

    public Payconfig findById(int id) {
        Payconfig customer = payconfigRepository.findPayconfigById(id);
        return customer;
    }

    public int deleteById(int id) {
        return payconfigRepository.deletePayconfig(id);
    }

    public CustomDTO<Payconfig> findAll(PageRequest pageable) {
        try {
            List<Payconfig> Payconfig = payconfigRepository.findAll(pageable);
            CustomDTO<Payconfig> customDTO = new CustomDTO<>();
            customDTO.setData(Payconfig);
            customDTO.setRecordsFiltered(payconfigRepository.count());
            customDTO.setRecordsTotal(Payconfig.size());
            customDTO.setDraw(pageable.getDraw());
            return customDTO;
        } catch (Exception e) {
            throw new ProductBusinessException("FindAll Getting Exception" + e.getMessage());
        }
    }

    public List<Payconfig> findByList() {
        try {
            return payconfigRepository.findByList();
        } catch (Exception e) {
            throw new ProductBusinessException("findByList Getting Exception" + e.getMessage());
        }
    }

}