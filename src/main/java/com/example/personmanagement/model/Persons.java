package com.example.personmanagement.model;

import org.hibernate.validator.constraints.UniqueElements;
import org.hibernate.validator.internal.constraintvalidators.hv.UniqueElementsValidator;
import org.springframework.validation.annotation.Validated;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.websocket.OnError;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Persons {
    private Integer nationalCode;
    private String firstName;
    private String lastName;
    private String fatherName;
    private Set<Address> addressList = new HashSet<>();
    private Set<Contact> contactList = new HashSet<>();

    @OneToMany(mappedBy = "persons_Contact", cascade = CascadeType.ALL)
    public Set<Contact> getContactList() {
        return contactList;
    }

    public void setContactList(Set<Contact> contactList) {
        this.contactList = contactList;
    }

    @OneToMany(mappedBy = "persons_address", cascade = CascadeType.ALL)
    public Set<Address> getAddressList() {
        return addressList;
    }

    public void setAddressList(Set<Address> addressList) {
        this.addressList = addressList;
    }

    @Id
    @Column(name = "NATIONAL_CODE",unique = true)
    public Integer getNationalCode() {
        return nationalCode;
    }

    public void setNationalCode(Integer nationalCode) {
        this.nationalCode = nationalCode;
    }

    @Basic
    @Column(name = "FIRST_NAME")
    @Size(min = 3, max = 15, message = "FirstName must be between 3 to 15 character")
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Basic
    @Column(name = "LAST_NAME")
    @Size(min = 5, max = 30, message = "LastName must be between 5 to 30 character")
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    @Basic
    @Column(name = "FATHER_NAME")
    @Size(min = 3, max = 15, message = "FatherName must be between 3 to 15 character")
    public String getFatherName() {
        return fatherName;
    }
    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Persons persons = (Persons) o;

        if (nationalCode != persons.nationalCode) return false;
        if (firstName != null ? !firstName.equals(persons.firstName) : persons.firstName != null) return false;
        if (lastName != null ? !lastName.equals(persons.lastName) : persons.lastName != null) return false;
        if (fatherName != null ? !fatherName.equals(persons.fatherName) : persons.fatherName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = nationalCode;
        result = 31 * result + (firstName != null ? firstName.hashCode() : 0);
        result = 31 * result + (lastName != null ? lastName.hashCode() : 0);
        result = 31 * result + (fatherName != null ? fatherName.hashCode() : 0);
        return result;
    }
}
