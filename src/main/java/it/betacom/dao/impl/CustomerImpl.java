package it.betacom.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import it.betacom.dao.CustomerDAO;
import it.betacom.model.Animal;
import it.betacom.model.Customer;

public class CustomerImpl implements CustomerDAO {

	private Connection con;

	public CustomerImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public String save(Customer t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(Customer t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Customer> getAll() {
		List<Customer> customerList = new ArrayList<>();
		String sql = "SELECT * FROM Customers";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Customer c = new Customer();
				c.setCustomerId(rs.getInt("customerId"));
				c.setFirstName(rs.getString("firstName"));
				c.setLastName(rs.getString("lastName"));
				c.setAddress(rs.getString("address"));
				c.setCity(rs.getString("city"));
				c.setPhoneNumber(rs.getString("phoneNumber"));
				customerList.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customerList;
	}

	@Override
	public List<Animal> getAnimals(int customerId) {

		String sql = "select * from customers c join animals a on c.customerId = a.customerId where c.customerId = ?";

		List<Animal> animals = new ArrayList<>();

		try {

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, customerId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Animal currentAnimal = new Animal();

				currentAnimal.setRegistrationNumber(rs.getInt("registrationNumber"));
				currentAnimal.setAnimalName(rs.getString("animalName"));
				currentAnimal.setPurchaseDate(rs.getDate("purchaseDate"));
				currentAnimal.setPrice(rs.getDouble("price"));
				currentAnimal.setAnimalType(rs.getString("animalType"));
				currentAnimal.setCustomerId(rs.getInt("customerId"));

				animals.add(currentAnimal);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return animals;

	}
	
	@Override
	public Customer getCustomerById(int customerId) {
	    String sql = "SELECT * FROM Customers WHERE customerId = ?";
	    Customer customer = null;

	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, customerId);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            customer = new Customer();
	            customer.setCustomerId(rs.getInt("customerId"));
	            customer.setFirstName(rs.getString("firstName"));
	            customer.setLastName(rs.getString("lastName"));
	            customer.setAddress(rs.getString("address"));
	            customer.setCity(rs.getString("city"));
	            customer.setPhoneNumber(rs.getString("phoneNumber"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return customer;
	}

	@Override
	public String delete(int id) {
		// TODO Auto-generated method stub
		return null;
	}


}
