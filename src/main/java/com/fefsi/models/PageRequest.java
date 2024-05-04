package com.fefsi.models;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class PageRequest {

    int page;

    int size;

    String sort;

    int sortColIndex;

    int draw;

    String col0DataAttrName;

    String colName;

    String search;

}
