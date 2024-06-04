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

    private Long agentId;

    private String agentName;

    private String contactNo;

    private int age;

    private String dateofBirth;

    private String bloodGroup;

    private String address;

    private String memberType;

    private String agentImage;
   
}
