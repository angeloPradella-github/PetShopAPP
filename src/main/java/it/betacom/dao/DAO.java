package it.betacom.dao;

import java.util.List;

public interface DAO<T>{
	String save(T t);
	List<T> getAll();
	String update(T t);
}