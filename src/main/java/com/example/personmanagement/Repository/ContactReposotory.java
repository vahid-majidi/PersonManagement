package com.example.personmanagement.Repository;

import com.example.personmanagement.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ContactReposotory extends JpaRepository<Contact,Integer> {
 @Query("from Contact where persons_Contact.nationalCode= ?1")
    List<Contact> getAllByPersons_Contact(int nationalCode);

}
