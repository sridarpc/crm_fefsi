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
public class License extends UserAudit {

    private static final long serialVersionUID = 1L;

    private Long licenseId;

    private Integer licenseNo;

    private String licenseName;

    private String licenseType;

    private Double balance;

    private String address;

    private String startWith;

}
