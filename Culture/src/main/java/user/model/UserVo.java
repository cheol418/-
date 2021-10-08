package user.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("uVo")
public class UserVo {
	private int num;
	@NotEmpty(message = "���̵�� �ʼ��Դϴ�.")
	private String id;
	@NotEmpty(message = "��й�ȣ�� �ʼ��Դϴ�.")
	private String passwd;
	@NotEmpty(message = "�̸��� �ʼ��Դϴ�.")
	private String name;
	
	private String image;
	private String oldImage;
	private MultipartFile imgFile;
	
	@NotEmpty(message = "������ �������ּ���.")
	private String gender;
	@NotNull(message = "���̸� �Է����ּ���.")
	private int age;
	@NotEmpty(message = "�̸����� �Է����ּ���.")
	private String email;
	@NotEmpty(message = "�ڵ��� ��ȣ�� �Է����ּ���.")
	private String phone;
	@NotEmpty(message = "������ �ʼ��Դϴ�.")
	private String area;
	private int point;
	
	
	public UserVo() {}
	
	public UserVo(int num, String id, String passwd, String name, String image, String oldImage, MultipartFile imgFile,
			String gender, int age, String email, String phone, String area, int point) {
		super();
		this.num = num;
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.image = image;
		this.oldImage = oldImage;
		this.imgFile = imgFile;
		this.gender = gender;
		this.age = age;
		this.email = email;
		this.phone = phone;
		this.area = area;
		this.point = point;
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


	public String getOldImage() {
		return oldImage;
	}


	public void setOldImage(String oldImage) {
		this.oldImage = oldImage;
	}


	public MultipartFile getImgFile() {
		return imgFile;
	}


	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
		this.image = imgFile.getOriginalFilename();
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
