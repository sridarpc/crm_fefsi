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
public class Movie extends UserAudit {

    private static final long serialVersionUID = 1L;

    private Long movieId;

    private String companyName;

    private String movieName;
    
    private String agentName;
    
    private String agentContactNo;
    
    private String managerName;
    
    private String managerContactNo;
    
    private String juniorArtist;
    
    private String gymBoys;
    
    private String richModel;
    
    private String location;
    
    private String conveyance;
    
    private String tiffin;
    
    private String meals;
    
    private String untimeConveyance;
    
    private String midnightSnacks;
    
    private String journeyConveyance;
    
    private String modelsrichConveyance;
    
    private String agentsassistantBatta;
    
    private String subagentName;
    
    private String others;
    
    private String totalAmount;
    
    private String amountStatus;
    
    private String imageMovie;  
  
}
