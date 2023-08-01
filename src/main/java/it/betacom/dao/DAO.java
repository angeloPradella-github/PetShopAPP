package it.betacom.dao;

import java.util.List;

import it.betacom.model.Animal;

public interface DAO<T>{
	String save(T t);
	List<T> getAll();
	String update(T t);
}