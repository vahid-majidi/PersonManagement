package com.example.personmanagement.controller;


import com.example.personmanagement.Repository.AddressRepository;
import com.example.personmanagement.Repository.ContactReposotory;
import com.example.personmanagement.Repository.PersonsRepository;
import com.example.personmanagement.model.Address;
import com.example.personmanagement.model.Contact;
import com.example.personmanagement.model.Persons;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import java.util.List;
import java.util.Optional;

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
//            List<Address> addressList=addressRepository.findAll();
            model.addAttribute("personList", personsList);
        model.addAttribute("distinct",distinctByProvince);
        return "person";
    }

    @GetMapping(value = "/addPerson")
    public String showAddPersonForm() {
        return "addPerson";
    }


    @PostMapping(value = "/save")
    @Transactional
    public String addPerson(@Validated Persons persons, BindingResult bindingResult) {
            if (bindingResult.hasErrors())
                return "error";
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
        List<Contact> contactByContactId = contactReposotory.findContactByContactId(nationalCode);
        model.addAttribute("contactCount",contactByContactId);
        model.addAttribute("nationalCode_c", nationalCode);
        return "addContact";
    }

    @PostMapping(value = "/address/{nationalCode}")
    public String addressForm(@PathVariable int nationalCode, Model model) {
        model.addAttribute("nationalCode_a", nationalCode);
        return "addAddress";
    }

    @PostMapping(value = "/Contact/addContact")
    @Transactional
    public String addContact(Contact contact) {

        entityManager.persist(contact);
        return "redirect:/person";
    }

    @PostMapping(value = "/address/addAddress")
    @Transactional
    public String addAddress(Address address)
        {
        entityManager.persist(address);
            return "person";
    }
    @PostMapping(value = "/showCityList")
    public String showCityList(@RequestParam String province,Model model){

        List<Address>selectCity= addressRepository.getAddressesByProvince(province);
        model.addAttribute("cityList",selectCity);
        return "showCity";
    }
}
