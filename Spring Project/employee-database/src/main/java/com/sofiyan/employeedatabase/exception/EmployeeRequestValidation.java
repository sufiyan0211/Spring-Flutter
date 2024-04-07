package com.sofiyan.employeedatabase.exception;

public class EmployeeRequestValidation extends IllegalArgumentException{
    public EmployeeRequestValidation(String message) {
        super(message);
    }
}
