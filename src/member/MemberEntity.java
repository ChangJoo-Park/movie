package member;
/**
 * id			: string
 * password		: string
 * mail			: string
 * name			: string
 * address		: string
 * fa_theater	: string
 */
public class MemberEntity {
	private String id;
	private String password;
	private String mail;
	private String name;
	private String address;
	private String favorite_theater;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getFavorite_theater() {
		return favorite_theater;
	}
	public void setFavorite_theater(String favorite_theater) {
		this.favorite_theater = favorite_theater;
	}		
}
