package com.shopion.todo.global.exception;

import org.springframework.http.HttpStatus;

public class NotFoundException extends RuntimeException {
    private HttpStatus httpStatus;

    public NotFoundException(String message, HttpStatus httpStatus) {
        super(message);
        this.httpStatus = httpStatus;
    }
}
