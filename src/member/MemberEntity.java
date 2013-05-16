package member;
/**
 * id			: string
 * pw			: string
 * mail			: string
 * name			: string
 * address		: string
 * fa_theater	: string
 */
public class MemberEntity {
	private String id;
	private String pw;
	private String mail;
	private String name;
	private String address;
	private String fa_theater;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFa_theater() {
		return fa_theater;
	}
	public void setFa_theater(String fa_theater) {
		this.fa_theater = fa_theater;
	}			
}
