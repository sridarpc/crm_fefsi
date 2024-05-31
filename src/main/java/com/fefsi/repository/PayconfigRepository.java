package com.fefsi.repository;

import java.util.List;

import com.fefsi.models.CommonRequest;
import com.fefsi.models.Payconfig;
import com.fefsi.models.PageRequest;

public interface PayconfigRepository {

    int saveOrUpdatePayconfig(Payconfig payconfig);

    int deletePayconfig(int id);

    Payconfig findPayconfigById(int id);

    List<Payconfig> findAll(PageRequest pageable);

    int count();

    List<Payconfig> findByList();
  
}
