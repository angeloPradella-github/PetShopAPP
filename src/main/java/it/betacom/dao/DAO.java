package it.betacom.dao;

import java.util.List;

public interface DAO<T>{
	void save();
	List<T> getAll();
}