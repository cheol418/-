package user.model;

public class AttendVo {
	private int num;
	private int adate;
	private int mnum;
	
	public AttendVo() {
	}
	
	public AttendVo(int num, int adate, int mnum) {
		super();
		this.num = num;
		this.adate = adate;
		this.mnum = mnum;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getAdate() {
		return adate;
	}
	public void setAdate(int adate) {
		this.adate = adate;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
}
