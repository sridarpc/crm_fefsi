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
public class Customer extends UserAudit {

    private static final long serialVersionUID = 1L;

    private Long customerId;

    private String customerName;

    private String surDetails;

    private String surName;

    private String customerType;

    private String party;

    private String religion;

    private String community;

    private String doorNo;

    private String streetName;

    private String area;

    private String taluk;

    private String postal;

    private String district;

    private String state;

    private String pincode;

    private String mobileNo;

    private String emailId;

    private String website;

    private String stdcode;

    private String landlineNo;

    private String birthday;

    private String anniversary;

    private String bankDetails;

    private String pan;

    private String proofName;

    private String proofDetails;

    private String proofAttached;

    private String relation;

    private String relationshipCustomerId;

    private String photo1;

    private String photo2;

    private String photo3;

    private String rightThumb;

    private String rightIndexFinger;

    private String rightMiddleFinger;

    private String rightRingFinger;

    private String rightLittleFinger;

    private String leftThumb;

    private String leftIndexFinger;

    private String leftMiddleFinger;

    private String leftRingFinger;

    private String leftLittleFinger;

    private String feedback;

}
