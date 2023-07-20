package it.betacom.model;

import java.util.Date;

public class User {
    private int id;
    private String name;
    private String surname;
    private String email;
    private String tel;
    private Date birthdate;
    private String password;
    private String role;
    private String status;
    private String username;

    public User() {}
    
    public User(int id, String name, String surname, String email, String tel, Date birthdate, String password, String role, String status, String username) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.tel = tel;
        this.birthdate = birthdate;
        this.password = password;
        this.role = role;
        this.status = status;
        this.username = username;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
    
  

}
