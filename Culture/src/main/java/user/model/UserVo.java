package user.model;

import org.springframework.stereotype.Component;

@Component("uVo")
public class UserVo {
	private String id;
	private String passwd;
	private String name;
	private String image;
	private String gender;
	private int age;
	private String email;
	private String phone;
	private String area;
	private int point;
	
	public UserVo() {}
	
	public UserVo(String id, String passwd, String name, String image, String gender, int age, String email,
			String phone, String area, int point) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.image = image;
		this.gender = gender;
		this.age = age;
		this.email = email;
		this.phone = phone;
		this.area = area;
		this.point = point;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
}
