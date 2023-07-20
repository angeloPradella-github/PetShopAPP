package it.betacom.dao;

import it.betacom.model.User;

public interface UserDAO extends DAO<User>{
	int login(String Username, String Passowrd);

}
