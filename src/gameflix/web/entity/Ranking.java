package gameflix.web.entity;

public class Ranking {
	private int m_no;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_email;
	private String m_nickname;
	
	private int play_no;
	private String g_name;
	private int p_score;
	public Ranking() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ranking(int m_no, String m_id, String m_pw, String m_name, String m_email, String m_nickname, int play_no,
			String g_name, int p_score) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_nickname = m_nickname;
		this.play_no = play_no;
		this.g_name = g_name;
		this.p_score = p_score;
	}
	
	
	public Ranking(String m_nickname, int p_score) {
		super();
		this.m_nickname = m_nickname;
		this.p_score = p_score;
	}
	
	
	public Ranking(int m_no, String m_nickname, String g_name, int p_score) {
		super();
		this.m_no = m_no;
		this.m_nickname = m_nickname;
		this.g_name = g_name;
		this.p_score = p_score;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public int getPlay_no() {
		return play_no;
	}
	public void setPlay_no(int play_no) {
		this.play_no = play_no;
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
