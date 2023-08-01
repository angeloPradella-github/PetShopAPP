package it.betacom.dao;

import it.betacom.model.Animal;

public interface AnimalDAO extends DAO {

	String update(Animal animal);

}
