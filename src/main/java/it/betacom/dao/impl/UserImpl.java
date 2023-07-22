package it.betacom.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.Calendar;

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
	public int login(String Username, String Passowrd) {
		try {

			String q = "select * from users where username = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setString(1, Username);
			ps.setString(2, Passowrd);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				String status = rs.getString("status");
				
				if (status.equals("A")) {
					return 1;
				}
				else {
					return 0;
				}
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

	@Override
	public String save(User user) {
		if (!isPwValid(user.getPassword())) {
			return "Invalid Password";
		}

		String newUsername = generaUsername(user);

		try {
			String q = "INSERT INTO users (name, surname, email, tel, birthdate, password, username) VALUES (?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = con.prepareStatement(q);

			ps.setString(1, user.getName());
			ps.setString(2, user.getSurname());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getTel());
			ps.setDate(5, new java.sql.Date(user.getBirthdate().getTime()));
			ps.setString(6, user.getPassword());
			ps.setString(7, newUsername);

			int result = ps.executeUpdate();

			ps.close();

			if (result > 0) {
				return "Registration completed successfully. Your username is: "+ newUsername;
			} else {
				return "Error in completing your registration.";
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return "Database error: " + e.getMessage();
		}
	}

	String generaUsername(User u) {
		String str1 = u.getName().substring(0, 2);
		String str2 = u.getSurname().substring(0, 2);
		Calendar cal = Calendar.getInstance();
		cal.setTime(u.getBirthdate());
		String str3 = String.valueOf(cal.get(Calendar.YEAR));
		String strTotal = str1 + str2 + str3;

		String q = "select COUNT(*) as totale from users WHERE username like ?";

		PreparedStatement ps;
		try {

			ps = con.prepareStatement(q);
			ps.setString(1, strTotal + "%");

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				int tot = rs.getInt("totale");
				if (tot > 0) {
					strTotal = strTotal +"_"+ (tot + 1);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return strTotal;
	}

	public static boolean isPwValid(String input) {
		if (input == null)
			return false;

		if (input.length() > 7)
			return true;

		return false;

	}

}
