package com.fefsi.repository;

import java.util.List;

import com.fefsi.models.CommonRequest;
import com.fefsi.models.Customer;
import com.fefsi.models.PageRequest;

public interface CustomerRepository {

    int saveOrUpdateCustomer(Customer customer);

    int deleteCustomer(int id);

    Customer findCustomerById(int id);

    List<Customer> findAll(PageRequest pageable);

    int count();

    List<Customer> findByList();

    String getId();

    List<Customer> findBySurNameList(CommonRequest commonRequest);

}
