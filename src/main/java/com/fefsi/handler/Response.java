package com.fefsi.handler;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Response {

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
    private LocalDateTime timestamp;
    private int statusCode;
    private Object response;
    private String message;

    public Response(int statusCode, Object response, String message) {
        this.statusCode = statusCode;
        this.response = response;
        this.message = message;
        this.timestamp = LocalDateTime.now();
    }

}
