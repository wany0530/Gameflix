package gameflix.web.entity;

import java.util.Date;

public class Game {
	private int g_num;
	private String g_name;
	private Date g_date;
	private String g_date_s;
	private int g_cnt;
	private String g_imgPath;
	private String g_link;
	
	public Game() {

	}
	
	public Game(String g_name, String g_imgPath, String g_link) {
		this.g_name = g_name;
		this.g_imgPath = g_imgPath;
		this.g_link = g_link;
	}
	
	public Game(String g_name, int g_cnt, String g_imgPath, String g_link) {
		super();
		this.g_name = g_name;
		this.g_cnt = g_cnt;
		this.g_imgPath = g_imgPath;
		this.g_link = g_link;
	}

	public Game(int g_num, String g_name, Date g_date, int g_cnt, String g_imgPath, String g_link) {
		super();
		this.g_num = g_num;
		this.g_name = g_name;
		this.g_date = g_date;
		this.g_cnt = g_cnt;
		this.g_imgPath = g_imgPath;
		this.g_link = g_link;
	}

	public Game(String g_name, String g_date_s, int g_cnt, String g_imgPath, String g_link) {
		this.g_name = g_name;
		this.g_date_s = g_date_s;
		this.g_cnt = g_cnt;
		this.g_imgPath = g_imgPath;
		this.g_link = g_link;
	}

	public Game(String g_name, Date g_date, int g_cnt, String g_imgPath, String g_link) {
		this.g_name = g_name;
		this.g_date = g_date;
		this.g_cnt = g_cnt;
		this.g_imgPath = g_imgPath;
		this.g_link = g_link;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public Date getG_date() {
		return g_date;
	}

	public void setG_date(Date g_date) {
		this.g_date = g_date;
	}

	public String getG_date_s() {
		return g_date_s;
	}

	public void setG_date_s(String g_date_s) {
		this.g_date_s = g_date_s;
	}

	public int getG_cnt() {
		return g_cnt;
	}

	public void setG_cnt(int g_cnt) {
		this.g_cnt = g_cnt;
	}

	public String getG_imgPath() {
		return g_imgPath;
	}

	public void setG_imgPath(String g_imgPath) {
		this.g_imgPath = g_imgPath;
	}

	public String getG_link() {
		return g_link;
	}

	public void setG_link(String g_link) {
		this.g_link = g_link;
	}

	public int getG_num() {
		return g_num;
	}

	public void setG_num(int g_num) {
		this.g_num = g_num;
	}
}
