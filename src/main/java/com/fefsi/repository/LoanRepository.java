package com.fefsi.repository;

import java.util.List;

import com.fefsi.models.Loan;
import com.fefsi.models.LoanItem;
import com.fefsi.models.PageRequest;

public interface LoanRepository {

    int saveOrUpdateLoan(Loan loan);

    int deleteLoan(int id);

    Loan findLoanById(int id);

    List<Loan> findAll(PageRequest pageable);

    int count();

    List<Loan> findByList();

    String getId();

    int saveOrUpdateItem(LoanItem loanItem);

    List<LoanItem> findAllItem(PageRequest pageable);

    int countItem();

}
