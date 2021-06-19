package com.example.personmanagement.Repository;

import com.example.personmanagement.model.Address;
import com.example.personmanagement.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface AddressRepository extends JpaRepository<Address,Integer> {
    List<Address> getAddressesByProvince(String province) ;
    @Query("select distinct province from Address ")
    List<String> getProvince();
    @Query("from Address where persons_address.nationalCode= ?1")
    List<Address> getAllByAddressId(int nationalCode);
}
