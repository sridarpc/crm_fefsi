package com.fefsi.util;

public enum EnumConstants {

    USERID("userId"), COMPANYID("companyId");

    private String name;

    private EnumConstants(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}