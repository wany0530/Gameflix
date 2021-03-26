package gameflix.web.qna;

import java.util.Date;

public class Board {
private int no;
private String cate;
private String title;
private String content;
private Date credte;
public Board() {
	super();
	// TODO Auto-generated constructor stub
}
public Board(int no, String cate, String title, String content, Date credte) {
	super();
	this.no = no;
	this.cate = cate;
	this.title=title;
	this.content = content;
	this.credte = credte;
}
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}

public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getCate() {
	return cate;
}
public void setCate(String cate) {
	this.cate = cate;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getCredte() {
	return credte;
}
public void setCredte(Date credte) {
	this.credte = credte;
}
}
