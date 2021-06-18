package com.example.personmanagement.Repository;

import com.example.personmanagement.model.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface AddressRepository extends JpaRepository<Address,Integer> {
    List<Address> getAddressesByProvince(String province) ;
    @Query("select distinct province from Address ")
    List<String> getProvince();
}
