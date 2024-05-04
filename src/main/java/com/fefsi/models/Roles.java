package com.fefsi.models;

import javax.validation.constraints.Size;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class Roles extends UserAudit {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private String roleMid;

    private String rootMenu;

    private String menuName;

    private String subMenu;

    private String tabPanel;

    @Size(max = 1)
    private int add;

    @Size(max = 1)
    private int edit;

    @Size(max = 1)
    private int view;

    @Size(max = 1)
    private int delete;

    @Size(max = 1)
    private int export;

}