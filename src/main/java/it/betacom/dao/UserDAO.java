package it.betacom.dao;

import it.betacom.model.Animal;
import it.betacom.model.User;

public interface UserDAO extends DAO<User>{
	String login(String Username, String Passowrd);
	User getUserByUsername(String username);
	String switchRole(int id);
	String switchStatus(int id);
	String save(Animal animal);
}
