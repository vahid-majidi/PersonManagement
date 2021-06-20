package com.example.personmanagement.controller;


import com.example.personmanagement.Repository.AddressRepository;
import com.example.personmanagement.Repository.ContactReposotory;
import com.example.personmanagement.Repository.PersonsRepository;
import com.example.personmanagement.model.Address;
import com.example.personmanagement.model.Contact;
import com.example.personmanagement.model.Persons;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import java.util.List;

@Controller
@RequestMapping(method = RequestMethod.GET, value = "/person")
public class PersonController {
    final
    ContactReposotory contactReposotory;
    final
    PersonsRepository personsRepository;
    public PersonController(PersonsRepository personsRepository, AddressRepository addressRepository, ContactReposotory contactReposotory) {
        this.personsRepository = personsRepository;
        this.addressRepository = addressRepository;
        this.contactReposotory = contactReposotory;
    }
final
AddressRepository addressRepository;
    @PersistenceContext
    EntityManager entityManager;
        @GetMapping
    public String showPersonInfo(Model model) {
        List<Persons> personsList = personsRepository.findAll();
            List<String> distinctByProvince = addressRepository.getProvince();
            model.addAttribute("personList", personsList);
        model.addAttribute("distinct",distinctByProvince);
        return "person";
    }

    @GetMapping(value = "/addPerson")
    public String showAddPersonForm(Model model) {
            model.addAttribute(new Persons());
            return "addPerson";
    }


    @PostMapping(value = "/save")
    @Transactional
    public String addPerson(@Validated Persons persons, BindingResult bindingResult) {
            if (bindingResult.hasErrors())
                return "/addPerson";
        entityManager.persist(persons);
        return "redirect:/person";
    }

    @PostMapping(value = "/editForm/{nationalCode}")
    public String updatePerson(@PathVariable int nationalCode, Model model) {
        model.addAttribute("nationalCode", nationalCode);
        return "editPerson";

    }

    @PostMapping(value = "/edit")
    public String editPerson(Persons persons) {
        personsRepository.updatePerson(persons.getFirstName(), persons.getLastName(), persons.getFatherName(), persons.getNationalCode());
        return "redirect:/person";
    }

    @PostMapping(value = "/delete/{nationalCode}")
    @Transactional
    public String deletePerson(@PathVariable int nationalCode) {
        personsRepository.deleteById(nationalCode);
        return "redirect:/person";
    }

    @PostMapping(value = "/Contact/{nationalCode}")
    public String contactForm(@PathVariable int nationalCode, Model model) {
        List<Contact> allByPersons_contact = contactReposotory.getAllByPersons_Contact(nationalCode);
        model.addAttribute("contactnumber",allByPersons_contact);
        model.addAttribute("nationalCode_c", nationalCode);
        model.addAttribute(new Contact());
        return "addContact";
    }

    @PostMapping(value = "/address/{nationalCode}")
    public String addressForm(@PathVariable int nationalCode, Model model) {
        List<Address> allByAddressId = addressRepository.getAllByAddressId(nationalCode);
        model.addAttribute("nationalCode_a", nationalCode);
        model.addAttribute("AddressList",allByAddressId);
        return "addAddress";
    }

    @PostMapping(value = "/Contact/addContact")
    @Transactional
    public String addContact(@RequestParam int nationalCode,@RequestParam String kindOfContact,@RequestParam String phoneNumber) {
        Persons persons = personsRepository.getById(nationalCode);
Contact contact=new Contact();
contact.setKindOfContact(kindOfContact);
contact.setPhoneNumber(phoneNumber);
persons.getContactList().add(contact);
contact.setPersons_Contact(persons);
        entityManager.persist(contact);
        return "redirect:/person";
    }

    @PostMapping(value = "/address/addAddress")
    @Transactional
    public String addAddress(@RequestParam int nationalCode,@RequestParam String province,@RequestParam String city,@RequestParam int postcode)
        {
            Address address=new Address();
            address.setCity(city);
            address.setPostcode(postcode);
            address.setProvince(province);
            Persons persons = personsRepository.getById(nationalCode);
            address.setPersons_address(persons);
            persons.getAddressList().add(address);
        entityManager.persist(address);
            return "redirect:/person";
    }
    @PostMapping(value = "/showCityList")
    public String showCityList(@RequestParam String province,Model model){

        List<Address>selectCity= addressRepository.getAddressesByProvince(province);
        model.addAttribute("cityList",selectCity);
        return "showCity";
    }
}
