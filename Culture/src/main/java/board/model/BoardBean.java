package board.model;

import java.sql.Timestamp;

import org.hibernate.validator.constraints.NotEmpty;

public class BoardBean {
	private int num;
	private String writer;
	private String title;
	private String content;
	private String image;
	private String category;
	private int ref;
	private int restep;
	private int relevel;
	private int readCount;
	private Timestamp regdate;
	
	
	public BoardBean() {
		super();
	}
	
	public BoardBean(int num, String writer, String title, String content, String image, String category, int ref,
			int restep, int relevel, int readCount, Timestamp regdate) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.image = image;
		this.category = category;
		this.ref = ref;
		this.restep = restep;
		this.relevel = relevel;
		this.readCount = readCount;
		this.regdate = regdate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRestep() {
		return restep;
	}
	public void setRestep(int restep) {
		this.restep = restep;
	}
	public int getRelevel() {
		return relevel;
	}
	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	} 
	
	
	
	
}
