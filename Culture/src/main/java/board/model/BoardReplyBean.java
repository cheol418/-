package board.model;

import java.util.Date;

public class BoardReplyBean {
	private String id;
	private String name;
	private int num;
	private String title;
	private String category;
	private int bno;
	private int rno;
	private String content;
	private String writer;
	private Date regdate;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
			  
			
	@Override
	public String toString() {
		return "BoardReplyBean [id="+ id +", name=" + name + ", num=" + num +", title=" + title +", category=" + category + ", bno=" + bno + ", rno=" + rno + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + "]";
	}
	
	
	public BoardReplyBean(String id, String name, int num, String title, String category, int bno, int rno, String content, String writer, Date regdate) {
		super();
		this.id = id;
		this.name = name;
		this.num = num;
		this.title = title;
		this.category = category;
		this.bno = bno;
		this.rno = rno;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
	}	
	
	
	public BoardReplyBean() {
		super();
	}
}
