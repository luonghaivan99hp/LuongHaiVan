package Assignment1;

public class Answer {
	int id;
	String content;
    Question question;
    Boolean isCorrect;
	public Answer(int id, String content, Question question, Boolean isCorrect) {
		super();
		this.id = id;
		this.content = content;
		this.question = question;
		this.isCorrect = isCorrect;
	}
	public Answer() {
	}
    
}
