package com.fefsi.models;

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
public class LoanItem extends UserAudit {

    private static final long serialVersionUID = 1L;

    private Long loanId;

    private String loanNo;
    
    private Double metalWeight;
    
    private Double netWeight;
    
    private Integer piece;
    
    private Double purityPercentage;
    
    private Double purityWeight;
    
    private String seal;
    
    private String itemNo;
    
    private String itemName;
    
    private String remarks;

}
