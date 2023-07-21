package it.betacom.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;


import it.betacom.dao.UserDAO;
import it.betacom.model.User;

public class UserImpl implements UserDAO {

	private Connection con;

	/**
	 * @param con
	 */
	public UserImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public void save() {
		// TODO Auto-generated method stub

	}

	@Override
	public int login(String Username, String Passowrd) {
		try {

			String q = "select * from users where username = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setString(1, Username);
			ps.setString(2, Passowrd);

			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				return 1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

	@Override
	public List<User> getAll() {
	    List<User> userList = new ArrayList<>();
	    try {
	        String q = "select * from users";
	        PreparedStatement ps = con.prepareStatement(q);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            User u = new User();
	            u.setId(rs.getInt("id"));
	            u.setName(rs.getString("name"));
	            u.setSurname(rs.getString("surname"));
	            u.setEmail(rs.getString("email"));
	            u.setTel(rs.getString("tel"));
	            u.setBirthdate(rs.getDate("birthdate"));
	            u.setPassword(rs.getString("password"));
	            u.setRole(rs.getString("role"));
	            u.setStatus(rs.getString("status"));
	            u.setUsername(rs.getString("username"));
	            userList.add(u);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return userList;
	}

}
