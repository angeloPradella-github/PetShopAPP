package it.betacom.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import it.betacom.dao.UserDAO;

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

}
