package admin.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class MemberBean {
	private int num;
	
	@NotEmpty(message = "id를 입력하세요")
	private String id;
	
	@Length(min = 8, message = "8자리 이상입력하세요.")
	private String passwd;
	private String name;
	
	private String image;
	
	private MultipartFile upload;
	private String upload_old;
	
	private String gender;
	private int age;
	private String email;
	private String phone;
	private String area;
	private int point;

	public void setUpload(MultipartFile upload) {
		System.out.println("upload:"+upload);
		this.upload = upload;
		System.out.println(upload.getName());
		System.out.println(upload.getOriginalFilename());
		
		this.image = upload.getOriginalFilename();
		
		//System.out.println(image==null);
		System.out.println(image.equals("")); //선택한 파일이 없으면 image = ""
	}
	
	public String getUpload_old() {
		return upload_old;
	}

	public void setUpload_old(String upload_old) {
		this.upload_old = upload_old;
	}

	public MultipartFile getUpload() {
		return upload;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	
	public MemberBean(int num, String id, String passwd, String name, String image, String gender, int age,
			String email, String phone, String area, int point) {
		super();
		this.num = num;
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
	
	public MemberBean() {
		super();
	}
	
}
