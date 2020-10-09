package Assignment1;

import java.time.LocalDate;

public class Exam {
	int id;
	String code;
	String title;
	Categoryquestion[]  categoryquestion;
	int duration;
	Account account;
	LocalDate createdate;
	Question[] question;
	public Exam(int id, String code, String title, Categoryquestion[] categoryquestion, int duration, Account account,
			LocalDate createdate, Question[] question) {
		super();
		this.id = id;
		this.code = code;
		this.title = title;
		this.categoryquestion = categoryquestion;
		this.duration = duration;
		this.account = account;
		this.createdate = createdate;
		this.question = question;
	}
	public Exam() {
	}
	
}
