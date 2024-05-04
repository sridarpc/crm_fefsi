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
public class Address extends UserAudit {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String commonId;

    private String doorNo;

    private String streetName;

    private String area;

    private String taluk;

    private String postal;

    private String district;

    private String state;

    private Integer pinCode;

}
