package com.fefsi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.fefsi.exception.ProductBusinessException;
import com.fefsi.models.CommonRequest;
import com.fefsi.models.CustomDTO;
import com.fefsi.models.Customer;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.CustomerRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    public int saveOrUpdate(Customer Customer) {
        int status = 0;
        try {
            log.info("Inside save");
            status = customerRepository.saveOrUpdateCustomer(Customer);
        } catch (DataIntegrityViolationException e) {
            throw new ProductBusinessException("Customer code already exist " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ProductBusinessException("Exception occurred while save Or Update the Customer");
        }
        return status;
    }

    public Customer findById(int id) {
        Customer customer = customerRepository.findCustomerById(id);
        return customer;
    }

    public int deleteById(int id) {
        return customerRepository.deleteCustomer(id);
    }

    public CustomDTO<Customer> findAll(PageRequest pageable) {
        try {
            List<Customer> Customer = customerRepository.findAll(pageable);
            CustomDTO<Customer> customDTO = new CustomDTO<>();
            customDTO.setData(Customer);
            customDTO.setRecordsFiltered(customerRepository.count());
            customDTO.setRecordsTotal(Customer.size());
            customDTO.setDraw(pageable.getDraw());
            return customDTO;
        } catch (Exception e) {
            throw new ProductBusinessException("FindAll Getting Exception" + e.getMessage());
        }
    }

    public List<Customer> findByList() {
        try {
            return customerRepository.findByList();
        } catch (Exception e) {
            throw new ProductBusinessException("findByList Getting Exception" + e.getMessage());
        }
    }

    public String getId() {
        try {
            return customerRepository.getId();
        } catch (Exception e) {
            throw new ProductBusinessException("getId Getting Exception" + e.getMessage());
        }
    }

    public List<Customer> findBySurNameList(CommonRequest commonRequest) {
        try {
            return customerRepository.findBySurNameList(commonRequest);
        } catch (Exception e) {
            throw new ProductBusinessException("getId Getting Exception" + e.getMessage());
        }
    }

}