package com.sofiyan.employeedatabase.repository;

import com.sofiyan.employeedatabase.entity.EmployeeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeRepository extends JpaRepository<EmployeeEntity, Integer> {
    public boolean existsEmployeeEntitiesByFirstNameAndLastName(String firstName, String lastName);

    public boolean existsById(int id);
}
