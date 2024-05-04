package com.fefsi.models;

import java.io.Serializable;
import java.time.Instant;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@Data
@JsonIgnoreProperties(value = { "entDate", "modDate" }, allowGetters = true)
public abstract class DateAudit implements Serializable {

    private static final long serialVersionUID = 1L;

    private Instant entDate;

    private Instant modDate;

}
