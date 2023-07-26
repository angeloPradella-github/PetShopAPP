package it.betacom.dao;

import java.util.List;

import it.betacom.model.Animal;
import it.betacom.model.Customer;

public interface CustomerDAO extends DAO<Customer> {
    List<Customer> getAll();
    List<Animal> getAnimals(int customerId);
	Customer getCustomerById(int customerId);
}