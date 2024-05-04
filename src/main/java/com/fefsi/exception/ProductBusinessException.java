package com.fefsi.exception;

public class ProductBusinessException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public ProductBusinessException(String message) {
        super(message);
    }
}
