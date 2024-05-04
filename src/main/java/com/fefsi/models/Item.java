package com.fefsi.models;

import java.util.List;

import javax.validation.constraints.NotNull;

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
public class Item extends UserAudit {
    
    private static final long serialVersionUID = 1L;

    @NotNull
    private String id;

    @NotNull
    private String name;

    @NotNull
    private String code;

    @NotNull
    private Integer metalId;

    private String metalName;

    @NotNull
    private Integer purityId;

    private String purityName;

    @NotNull
    private Integer categoryId;

    private String categoryName;

    @NotNull
    private Integer counterId;

    private String counterName;

    private String stockType;

    private String hsnCode;

    private String calcType;

    private Integer calcValue;

    private String makingChargesOn;

    private Double makingGram;

    private Double flatMakingCharges;

    private String wastageChargesOn;

    private Double wastagePercentage;

    private Double flatWastage;

    private String length;

    private String subitem;

    private String size;

    private String stockName;

    private String rangeStock;

    private String studdedStone;

    private String zeroWeight;

    private String allowZeroPieces;

    private String weightLess;

    private String stoneUnits;

    private String beads;

    private Double tagWeight;

    private Double coverWeight;

    private Double otherWeight;

    private String reduceWeight;

    private List<Filestore> filestore;

}
