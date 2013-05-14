package theater;

public class TheaterEntity {
	private int id;
	
	private String	location;	
	private String	address;
	private String  room_num;
	private String 	seat;
	private String time_schedule;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRoom_num() {
		return room_num;
	}
	public void setRoom_num(String room_num) {
		this.room_num = room_num;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getTime_schedule() {
		return time_schedule;
	}
	public void setTime_schedule(String time_schedule) {
		this.time_schedule = time_schedule;
	}
}