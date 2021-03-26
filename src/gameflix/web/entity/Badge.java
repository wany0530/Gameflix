package gameflix.web.entity;

public class Badge {
	private int b_grade;
	private String g_name;
	private int b_score;
	private String b_Path;
	
	public Badge() {
		// TODO Auto-generated constructor stub
	}

	public Badge(String b_Path) {
		super();
		this.b_Path = b_Path;
	}

	public Badge(int b_grade, String g_name, int b_score, String b_Path) {
		super();
		this.b_grade = b_grade;
		this.g_name = g_name;
		this.b_score = b_score;
		this.b_Path = b_Path;
	}

	public int getB_grade() {
		return b_grade;
	}

	public void setB_grade(int b_grade) {
		this.b_grade = b_grade;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public int getB_score() {
		return b_score;
	}

	public void setB_score(int b_score) {
		this.b_score = b_score;
	}

	public String getB_Path() {
		return b_Path;
	}

	public void setB_Path(String b_Path) {
		this.b_Path = b_Path;
	}
	
	
	
	
}
