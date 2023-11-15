package com.sofiyan.employeedatabase.service;

import com.sofiyan.employeedatabase.entity.EmployeeEntity;
import com.sofiyan.employeedatabase.exception.EmployeeRequestValidation;
import com.sofiyan.employeedatabase.model.Employee;
import com.sofiyan.employeedatabase.repository.EmployeeRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private ModelMapper modelMapper;

    public List<Employee> listAllEmployees() {
        List<EmployeeEntity> employeeEntities = employeeRepository.findAll();
        List<Employee> employees = new ArrayList<>();
        employeeEntities.forEach(e -> {
            Employee employee = modelMapper.map(e, Employee.class);
            employees.add(employee);
        });
        return employees;
    }

    public Employee getEmployeeById(int employeeId) {
        EmployeeEntity employeeEntity = employeeRepository.findById(employeeId).orElseThrow(() -> new EmployeeRequestValidation("employee id " + employeeId + " not found in the database"));
        return modelMapper.map(employeeEntity, Employee.class);
    }

    public Employee addEmployee(Employee employee) {
        if (employeeRepository.existsEmployeeEntitiesByFirstNameAndLastName(employee.getFirstName(), employee.getLastName())) {
            throw new EmployeeRequestValidation("Employee Already exist with this name");
        }
        EmployeeEntity employeeEntity = modelMapper.map(employee, EmployeeEntity.class);
        employeeRepository.save(employeeEntity);
        return employee;
    }

    public Employee updateEmployee(int employeeId, Employee employee) {
        EmployeeEntity employeeEntity = employeeRepository.findById(employeeId).orElseThrow(() -> new EmployeeRequestValidation("employee id " + employeeId + " not found in the database"));
        employeeEntity.setFirstName(employee.getFirstName());
        employeeEntity.setLastName(employee.getLastName());
        employeeRepository.save(employeeEntity);
        return employee;
    }

    public String deleteEmployee(int employeeId) {
        EmployeeEntity employeeEntity = employeeRepository.findById(employeeId).orElseThrow(() -> new EmployeeRequestValidation("employee id " + employeeId + " not found in the database"));
        employeeRepository.delete(employeeEntity);
        return "deleted successfully";
    }


}
