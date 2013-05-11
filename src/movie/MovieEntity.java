package movie;
/**
 * title 		: String
 * year 		: int
 * description 	: String
 * genre 		: String
 * officialSite : String
 * photo 		: String
 * rate 		: int
 * play_time	: int
 */
public class MovieEntity {
	private String	title;
	private int	year;
	private String	description;
	private String genre;
	private String 	officialSite;
	private String	photo;
	private int	rate;
	private	 int	play_time;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getOfficialSite() {
		return officialSite;
	}
	public void setOfficialSite(String officialSite) {
		this.officialSite = officialSite;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getPlay_time() {
		return play_time;
	}
	public void setPlay_time(int play_time) {
		this.play_time = play_time;
	}
	
	
}
