package com.example.personmanagement.Repository;

import com.example.personmanagement.model.Persons;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

public interface PersonsRepository extends JpaRepository<Persons, Integer> {
    @Query("update Persons SET firstName=?1,lastName=?2,fatherName=?3 where nationalCode=?4")
    @Modifying
    @Transactional
    void updatePerson(String firstName,String lastName,String fatherName,int nationalCode);
}