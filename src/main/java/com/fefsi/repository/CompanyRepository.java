package com.fefsi.repository;

import java.util.List;

import com.fefsi.models.CommonRequest;
import com.fefsi.models.Company;
import com.fefsi.models.PageRequest;

public interface CompanyRepository {

    int saveOrUpdateCompany(Company company);

    int deleteCompany(int id);

    Company findCompanyById(int id);

    List<Company> findAll(PageRequest pageable);

    int count();

    List<Company> findByList();
  
}
