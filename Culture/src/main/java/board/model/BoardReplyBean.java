package board.model;

import java.util.Date;

public class BoardReplyBean {
	private int bno;
	private int rno;
	private String content;
	private String writer;
	private Date regdate;
	
	
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
		return "BoardReplyBean [bno=" + bno + ", rno=" + rno + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + "]";
	}
	public BoardReplyBean(int bno, int rno, String content, String writer, Date regdate) {
		super();
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
