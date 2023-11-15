package com.sofiyan.employeedatabase.controller;

import com.sofiyan.employeedatabase.exception.BaseException;
import com.sofiyan.employeedatabase.exception.EmployeeRequestValidation;
import com.sofiyan.employeedatabase.model.Employee;
import com.sofiyan.employeedatabase.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/v1/employees")
    public List<Employee> listEmployees() {
        return employeeService.listAllEmployees();
    }

    @GetMapping("/v1/employees/{employeeId}")
    public Employee employee(@PathVariable("employeeId") int employeeId) {
        return employeeService.getEmployeeById(employeeId);
    }

    @PostMapping("/v1/employee")
    public Employee addEmployee(@RequestBody Employee employee) {
        return employeeService.addEmployee(employee);
    }

    @PutMapping("/v1/employees/{employeeId}")
    public Employee updateEmployee(@PathVariable("employeeId") int employeeId, @RequestBody Employee employee) {
        return employeeService.updateEmployee(employeeId, employee);
    }

    @DeleteMapping("/v1/employees/{employeeId}")
    public String deleteEmployee(@PathVariable("employeeId") int employeeId) {
        return employeeService.deleteEmployee(employeeId);
    }

    @ExceptionHandler({
            EmployeeRequestValidation.class
    })
    public ResponseEntity<BaseException> handleException(Exception ex) {
        HttpStatus httpStatus;
        String message = ex.getMessage();

        if (ex instanceof EmployeeRequestValidation) {
            httpStatus = HttpStatus.PARTIAL_CONTENT;
        } else {
            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
        }

        BaseException baseException = BaseException.builder()
                .message(message).build();
        return ResponseEntity.status(httpStatus).body(baseException);

    }

}
