package com.fefsi.models;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public abstract class UserAudit extends DateAudit {
    private static final long serialVersionUID = 1L;

    private Integer serialNumber;

    private Integer comId;

    private int status;

    private String entBy;

    private String modBy;
}
