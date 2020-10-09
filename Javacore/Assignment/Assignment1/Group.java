package Assignment1;

import java.time.LocalDate;

public class Group {
	int id;
	String name;
	Account[] account;
	LocalDate createdate;
	public Group(int id, String name, Account[] account, LocalDate createdate) {
		this.id = id;
		this.name = name;
		this.account = account;
		this.createdate = createdate;
	}
	public Group() {
	}
	
}
