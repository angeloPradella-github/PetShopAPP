package it.betacom.dao.impl;

import java.sql.Connection;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.Calendar;

import it.betacom.dao.UserDAO;
import it.betacom.model.User;

public class UserImpl implements UserDAO {
	private static final Logger logger = LogManager.getLogger(UserImpl.class);

	private Connection con;

	/**
	 * @param con
	 */
	public UserImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public String login(String Username, String Passowrd) {
		try {

			String q = "select * from users where username = ? and password = ?";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setString(1, Username);
			ps.setString(2, Passowrd);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				String status = rs.getString("status");

				if (status.equals("A")) {
					logger.info("Login effettuato per l’utente " + Username);
					return "success";
				} else {
					logger.info("Utente " + Username + " non abilitato");
					return "User not abilitated";
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		logger.debug("Credenziali errate per l’utente " + Username);

		return "Wrong Credentilas";
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
			logger.debug("Elenco utenti recuperato");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public String save(User user) {
		if (!isPwValid(user.getPassword())) {
			logger.debug("Password invalida per l'utente " + user.getUsername());
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
				logger.info("Registrazione effettuata per l’utente " + user.getName() + " " + user.getSurname());
				return "Registration completed successfully. Your username is: " + newUsername;
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
					strTotal = strTotal + "_" + (tot + 1);
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

	@Override
	public User getUserByUsername(String username) {
		User user = null;
		String sql = "SELECT * FROM users WHERE username = ?";

		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				user.setName(rs.getString("name"));
				user.setSurname(rs.getString("surname"));
				user.setEmail(rs.getString("email"));
				user.setTel(rs.getString("tel"));
				user.setBirthdate(rs.getDate("birthdate"));
				user.setStatus(rs.getString("status"));
			}

			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	@Override
	public String switchRole(int id) {
	    String sql = "UPDATE users SET role = CASE WHEN role = 'G' THEN 'A' ELSE 'G' END WHERE id = ?";
	    String sql2 = "SELECT * from users where id = ?";
	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, id);
	        int rowsAffected = ps.executeUpdate();

	        PreparedStatement ps2 = con.prepareStatement(sql2);
	        ps2.setInt(1, id);
	        ResultSet rows = ps2.executeQuery();

	        if (rowsAffected > 0 && rows.next()) {
	            return "Role of "+rows.getString("username")+" switched successfully";
	        } else {
	            return "No user found with given id";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return "Error while switching role";
	    }
	}

}
