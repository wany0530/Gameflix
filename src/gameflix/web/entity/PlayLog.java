package gameflix.web.entity;

public class PlayLog {
	private int play_no;
	private int m_no;
	private String g_name;
	private int p_score;
	
	public PlayLog() {
		super();
	}

	public PlayLog(int play_no, int m_no, String g_name, int p_score) {
		super();
		this.play_no = play_no;
		this.m_no = m_no;
		this.g_name = g_name;
		this.p_score = p_score;
	}
	public PlayLog(int m_no, String g_name, int score) {
		super();
		this.m_no = m_no;
		this.g_name = g_name;
		this.p_score = score;
	}
	public PlayLog(String g_name, int p_score) {
		super();
		this.g_name = g_name;
		this.p_score = p_score;
	}
	public PlayLog(int m_no, int p_score) {
		super();
		this.m_no = m_no;
		this.p_score = p_score;
	}
	public PlayLog(int p_score) {
		super();
		this.p_score = p_score;
	}

	public int getPlay_no() {
		return play_no;
	}

	public void setPlay_no(int play_no) {
		this.play_no = play_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public int getP_score() {
		return p_score;
	}

	public void setP_score(int p_score) {
		this.p_score = p_score;
	}

	
	
	
	
}
