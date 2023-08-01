package it.betacom.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import it.betacom.dao.AnimalDAO;
import it.betacom.model.Animal;
import it.betacom.model.User;

public class AnimalImpl implements AnimalDAO {
	private Connection con;

	public AnimalImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public String save(Object t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Animal> getAll() {
		List<Animal> animalList = new ArrayList<>();
		try {
			String q = "select * from animals";
			PreparedStatement ps = con.prepareStatement(q);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Animal a = new Animal();
				a.setRegistrationNumber(rs.getInt("registrationNumber"));
				a.setAnimalName(rs.getString("animalName"));
				a.setPurchaseDate(rs.getDate("purchaseDate"));
				a.setPrice(rs.getDouble("price"));
				a.setAnimalType(rs.getString("animalType"));
				a.setCustomerId(rs.getInt("customerId"));
				animalList.add(a);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return animalList;
	}

	@Override
	public String update(Animal animal) {
		if (animal == null || Objects.isNull(animal.getRegistrationNumber())) {
			return "Invalid animal data";
		}

		String sql = "UPDATE animals SET registrationNumber = registrationNumber";

		if (animal.getAnimalName() != null) {
			sql += ", animalName = ?";
		}

		sql += ", purchaseDate = ?";

		if (!Objects.isNull(animal.getPrice())) {
			sql += ", price = ?";
		}
		if (animal.getAnimalType() != null) {
			sql += ", animalType = ?";
		}
		if (!Objects.isNull(animal.getCustomerId())) {
			sql += ", customerId = ?";
		}

		sql += " WHERE registrationNumber = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);

			int index = 1;
			if (animal.getAnimalName() != null) {
				ps.setString(index++, animal.getAnimalName());
			}
			if (animal.getPurchaseDate() != null) {
				ps.setDate(index++, new java.sql.Date(animal.getPurchaseDate().getTime()));
			} else {
				ps.setDate(index++, null);
			}
			if (!Objects.isNull(animal.getPrice())) {
				ps.setDouble(index++, animal.getPrice());
			}
			if (animal.getAnimalType() != null) {
				ps.setString(index++, animal.getAnimalType());
			}
			if (!Objects.isNull(animal.getCustomerId())) {
				ps.setInt(index++, animal.getCustomerId());
			}

			ps.setInt(index, animal.getRegistrationNumber());

			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				return "Animal " + animal.getRegistrationNumber() + " updated successfully";
			} else {
				return "No animal found with given registration number";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "Error while updating animal";
		}
	}

	@Override
	public String update(Object t) {
		// TODO Auto-generated method stub
		return null;
	}

}
