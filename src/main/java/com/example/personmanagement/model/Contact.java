package com.example.personmanagement.model;

import javax.persistence.*;

@Entity
public class Contact {
    private int contactId;
    private String phoneNumber;
    private String kindOfContact;

    private Persons persons_Contact;
    @ManyToOne
    @JoinColumn(name = "National_Code_Contact")
    public Persons getPersons_Contact() {
        return persons_Contact;
    }

    public void setPersons_Contact(Persons persons_Contact) {
        this.persons_Contact = persons_Contact;
    }

    @Id
    @Column(name = "CONTACT_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getContactId() {
        return contactId;
    }

    public void setContactId(int contactId) {
        this.contactId = contactId;
    }

    @Basic
    @Column(name = "PHONE_NUMBER")
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Basic
    @Column(name = "KIND_OF_CONTACT")
    public String getKindOfContact() {
        return kindOfContact;
    }

    public void setKindOfContact(String kindOfContact) {
        this.kindOfContact = kindOfContact;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Contact contact = (Contact) o;

        if (contactId != contact.contactId) return false;
        if (phoneNumber != null ? !phoneNumber.equals(contact.phoneNumber) : contact.phoneNumber != null) return false;
        if (kindOfContact != null ? !kindOfContact.equals(contact.kindOfContact) : contact.kindOfContact != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = contactId;
        result = 31 * result + (phoneNumber != null ? phoneNumber.hashCode() : 0);
        result = 31 * result + (kindOfContact != null ? kindOfContact.hashCode() : 0);
        return result;
    }
}
