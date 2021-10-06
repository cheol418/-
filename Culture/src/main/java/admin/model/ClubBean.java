package admin.model;


public class ClubBean {
	
	private int num;
	private String name;
	private String cdate;
	
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public ClubBean() {
		super();
	}

	public ClubBean(int num, String name, String cdate) {
		super();
		this.num = num;
		this.name = name;
		this.cdate = cdate;
	}
	
}
