package gameflix.web.entity;
/*
 CREATE TABLE G_MEMBER (
	m_no NUMBER CONSTRAINT g_member_pk PRIMARY KEY,
	m_id VARCHAR2(30) CONSTRAINT g_member_id_nn NOT NULL,
	m_pw VARCHAR2(30) CONSTRAINT g_member_pw_nn NOT NULL,
	m_name VARCHAR2(30) CONSTRAINT g_member_name_nn NOT NULL,
	m_email VARCHAR2(50) CONSTRAINT g_member_email_nn NOT NULL,
	m_nickname VARCHAR2(30) CONSTRAINT g_member_nickname NOT NULL
);
 */
public class Member {
	private int m_no;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_email;
	private String m_nickname;
	private int score;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(int m_no, String m_id, String m_pw, String m_name, String m_email, String m_nickname) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_nickname = m_nickname;
	}
	public Member(String m_name, int score) {
		super();
		this.m_name = m_name;
		this.score = score;
	}
	public Member(String m_id) {
		super();
		this.m_id = m_id;
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
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
