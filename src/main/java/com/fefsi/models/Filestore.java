package com.fefsi.models;

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
public class Filestore extends UserAudit {
    private static final long serialVersionUID = 1L;

    private Long id;

    @NotNull
    private String commonId;

    @NotNull
    private String fileName;

    @NotNull
    private String file;

    @NotNull
    private String fileType;

}
