package com.fefsi.models;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@EqualsAndHashCode(callSuper = true)
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Loan extends UserAudit {

    private static final long serialVersionUID = 1L;

    private String loanNo;

    private String loanDate;

    private String customerNo;

    private String licenseName;

    private String metalType;

    private Double metalPrice;

    private String renewalMonth;

    private String toPrint;

    private String paymode;

    private Double dayToRelease;

    private Double interestPercentage;

    private Double stoneAmount;

    private Double grossWeight;

    private Double lessWeight;

    private Double jewelValue;

    private Double loanAmount;

    private Double interestAmount;

    private Double payableAmount;

    private Integer noOfPiece;

    private Double netWeight;

    private Double purityWeight;

    private String reference;

    private List<LoanItem> loanItem;;
    
    private Customer customer;

}
