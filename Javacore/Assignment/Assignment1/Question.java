package Assignment1;

import java.time.LocalDate;

public class Question {
	int id;
	String Content;
	Categoryquestion categoryquestion;
	TypeQuestion typequestion;
	Account account;
	LocalDate createdate;
	public Question(int id, String content, Categoryquestion categoryquestion, TypeQuestion typequestion,
			Account account, LocalDate createdate) {
		this.id = id;
		Content = content;
		this.categoryquestion = categoryquestion;
		this.typequestion = typequestion;
		this.account = account;
		this.createdate = createdate;
	}
	public Question() {
	}
	
}
