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
public class Contact extends UserAudit {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String commonId;

    private String mobileNo;

    private String emailId;

    private String website;

    private Integer stdcode;

    private String landlineNo;

    private Long birthday;

    private Long anniversary;
}
