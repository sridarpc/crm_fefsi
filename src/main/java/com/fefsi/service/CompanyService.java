package com.fefsi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.fefsi.exception.ProductBusinessException;
import com.fefsi.models.Company;
import com.fefsi.models.CustomDTO;
import com.fefsi.models.PageRequest;
import com.fefsi.repository.CompanyRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CompanyService {

    @Autowired
    private CompanyRepository companyRepository;

    public int saveOrUpdate(Company company) {
        int status = 0;
        try {
            log.info("Inside save");
            status = companyRepository.saveOrUpdateCompany(company);
        } catch (DataIntegrityViolationException e) {
            throw new ProductBusinessException("Company code already exist " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new ProductBusinessException("Exception occurred while save Or Update the Company");
        }
        return status;
    }

    public Company findById(int id) {
        Company customer = companyRepository.findCompanyById(id);
        return customer;
    }

    public int deleteById(int id) {
        return companyRepository.deleteCompany(id);
    }

    public CustomDTO<Company> findAll(PageRequest pageable) {
        try {
            List<Company> Company = companyRepository.findAll(pageable);
            CustomDTO<Company> customDTO = new CustomDTO<>();
            customDTO.setData(Company);
            customDTO.setRecordsFiltered(companyRepository.count());
            customDTO.setRecordsTotal(Company.size());
            customDTO.setDraw(pageable.getDraw());
            return customDTO;
        } catch (Exception e) {
            throw new ProductBusinessException("FindAll Getting Exception" + e.getMessage());
        }
    }

    public List<Company> findByList() {
        try {
            return companyRepository.findByList();
        } catch (Exception e) {
            throw new ProductBusinessException("findByList Getting Exception" + e.getMessage());
        }
    }

}