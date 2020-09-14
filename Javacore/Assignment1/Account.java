package Assignment1;

import java.time.LocalDate;

public class Account {
	int id;
	String email;
	String username;
	String fullname;
	Department department;
	Position position;
	LocalDate createdate;
	Group[] group;
	public Account(int id, String email, String username, String fullname, Department department, Position position,
			LocalDate createdate, Group[] group) {
		this.id = id;
		this.email = email;
		this.username = username;
		this.fullname = fullname;
		this.department = department;
		this.position = position;
		this.createdate = createdate;
		this.group = group;
	}
	public Account() {
	}
	
}
