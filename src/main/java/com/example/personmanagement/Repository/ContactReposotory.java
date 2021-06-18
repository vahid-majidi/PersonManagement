package com.example.personmanagement.Repository;

import com.example.personmanagement.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ContactReposotory extends JpaRepository<Contact,Integer> {
    List<Contact> findContactByContactId(Integer nationalCode);
}
